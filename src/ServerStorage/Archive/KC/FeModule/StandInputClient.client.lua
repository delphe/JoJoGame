local me = game:service'Players'.localPlayer;
local pg = me:FindFirstChildOfClass'PlayerGui'
local mouse = me:GetMouse();
local UIS = game:service'UserInputService'
local ch = me.Character;

local sentMouseData = {}

local UserEvent = (function()
	local Ret;
	repeat wait() Ret = script:WaitForChild'Remote'.Value until Ret
	return Ret
end)()
UIS.InputChanged:connect(function(io,gpe)
	if(gpe)then return end
	local fakeIo = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,Delta=io.Delta,Position=io.Position,UserInputState=io.UserInputState}
	UserEvent:FireServer{Type='UserInput',Event='InputChanged',Args={fakeIo,gpe and true or false}}
end)


UIS.InputBegan:connect(function(io,gpe)
	if(gpe)then return end
	local fakeIo = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,Delta=io.Delta,Position=io.Position,UserInputState=io.UserInputState}
	UserEvent:FireServer{Type='UserInput',Event='InputBegan',Args={fakeIo,gpe and true or false}}
end)

UIS.InputEnded:connect(function(io,gpe)
	if(gpe)then return end
	local fakeIo = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,Delta=io.Delta,Position=io.Position,UserInputState=io.UserInputState}
	UserEvent:FireServer{Type='UserInput',Event='InputEnded',Args={fakeIo,gpe and true or false}}
end)

mouse.KeyDown:connect(function(k)
	UserEvent:FireServer{Type='Mouse',Event='KeyDown',Args={k}}
end)

mouse.KeyUp:connect(function(k)
	UserEvent:FireServer{Type='Mouse',Event='KeyUp',Args={k}}
end)

mouse.Button1Down:connect(function()
	UserEvent:FireServer{Type='Mouse',Event='Button1Down',Args={}}
end)

mouse.Button1Up:connect(function()
	UserEvent:FireServer{Type='Mouse',Event='Button1Up',Args={}}
end)

mouse.Button2Down:connect(function()
	UserEvent:FireServer{Type='Mouse',Event='Button2Down',Args={}}
end)

mouse.Button2Up:connect(function()
	UserEvent:FireServer{Type='Mouse',Event='Button2Up',Args={}}
end)

UIS.TextBoxFocusReleased:connect(function(inst)
	UserEvent:FireServer{Type='TextboxReplication',TextBox=inst,Text=inst.Text}
end)


local ClientProp = ch:WaitForChild('GetClientProperty'..UserEvent.Name,30)
local sounds = {}

function regSound(o)
	if(o:IsA'Sound')then
		local lastLoudness = o.PlaybackLoudness
		ClientProp:InvokeServer(o,lastLoudness)
		table.insert(sounds,{o,lastLoudness})
		--ClientProp:FireServer(o,o.PlaybackLoudness)
	end
end

ClientProp.OnClientInvoke = function(inst,prop)
	if(inst == 'RegSound')then
		regSound(prop)
		for i = 1, #sounds do
			 if(sounds[i][1] == prop)then 
				return sounds[i][2]
			end 
		end 
	elseif(inst=='Ready')then
		return true
	elseif(inst=='Camera')then
		return workspace.CurrentCamera[prop]
	else
		return inst[prop]
	end
end


function matching(a,b)
	for i,v in next, a do
		if(b[i]~=v)then
			return false;
		end
	end
	for i,v in next, b do
		if(a[i]~=v)then
			return false;
		end
	end
	return true;
end

coroutine.wrap(function()
	while true do
		local data = {Target=mouse.Target,Hit=mouse.Hit,X=mouse.X,Y=mouse.Y}
		--if(sentMouseData.Target~=data.Target or sentMouseData.Hit~=data.Hit)then
		if(not matching(sentMouseData,data))then
			sentMouseData=data
			UserEvent:FireServer({Type='Mouse',Variables=sentMouseData})
		end
		game:service'RunService'.RenderStepped:Wait()
	end	
end)()

game:service'RunService'.RenderStepped:connect(function()
	for i = 1, #sounds do
		local tab = sounds[i]
		local object,last=unpack(tab)
		if(object.PlaybackLoudness ~= last)then
			sounds[i][2]=object.PlaybackLoudness
			ClientProp:InvokeServer(object,sounds[i][2])
		end
	end
end)

for _,v in next, workspace:GetDescendants() do regSound(v) end
workspace.DescendantAdded:connect(regSound)
me.Character.DescendantAdded:connect(regSound)

