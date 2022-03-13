wait(1/60)
script.Parent=nil

local fakemouse = script:WaitForChild'StandInputClient'
fakemouse.Parent=nil;
local fakeEvent = script:WaitForChild'FakeEvent'	
fakeEvent.Parent = nil
return function()
	local fakeEvent = require(fakeEvent);
	local sc = getfenv(2).script
	if(game:service'RunService':IsServer())then
		repeat wait() until sc.Parent and (sc.Parent:IsA'PlayerGui' or sc.Parent:IsA'Model')
		local Player;
		if(sc.Parent:IsA'PlayerGui')then
			Player=sc.Parent.Parent
			sc.Parent=Player.Character
		else
			Player = game:service'Players':GetPlayerFromCharacter(sc.Parent) or game:service'Players':FindFirstChild(sc.Parent.Name)
		end
		
		local ScriptCreated = {}
		
		assert(Player and Player:IsA'Player','Make sure the script is parented to Character or PlayerGUI!')
		local event = Instance.new("RemoteEvent")
		event.Name='StandInput'
		event.Parent=Player.Character;
		local gcp = Instance.new("RemoteFunction")
		gcp.Name='GetClientProperty'..event.Name
		gcp.Parent=Player.Character;
		local loudnesses = {}
		local function GetClientProperty(inst,prop)
			if(prop == 'PlaybackLoudness' and loudnesses[inst])then 
				return loudnesses[inst] or 0
			elseif(prop == 'PlaybackLoudness')then
				return gcp:InvokeClient(Player,'RegSound',inst)
			end
			return gcp:InvokeClient(Player,inst,prop)
		end
		
		local ScriptCreated = {}
		local FakeMouse = fakemouse:Clone();
		FakeMouse.Parent = Player.Character;
		FakeMouse:WaitForChild'Remote'.Value=event
		FakeMouse.Disabled = false
		local fakes={}
		local reals = {}
		local loudnesses = {}
		
		local function object()
			local object={}
			object.__index=function(self,idx)
				local val = rawget(self,idx) or rawget(self,'real')[idx];
				if(typeof(val)=='function')then
					return function(self2,...)
						local realFunc = rawget(self,'real')[idx]==val
						if(realFunc and self2==self)then
							self2=rawget(self,'real')
						end
						return val(self2,...)
					end
				end
				return val
			end
			object.__newindex=function(self,idx,val)
				if(fakes[val])then
					rawget(self,'real')[idx]=fakes[val]
				else
					rawget(self,'real')[idx]=val;
				end
			end
			object.__type='Instance'
			object.__tostring=function(self)
				return rawget(self,'real').Name
			end
			return object;
		end
		gcp.OnServerInvoke = function(plr,inst,play)
			if plr~=Player then return end
			if(inst and typeof(inst) == 'Instance' and inst:IsA'Sound')then
				loudnesses[inst]=play	
			end
		end
		
		local function wrapObject(realobj)
			local fakeobj = {real=realobj}
			if(realobj.ClassName=='Sound')then
				local needsLoudness=false;
				local mt = object()
				setmetatable(fakeobj,{__index=function(s,i)
					if(i=='PlaybackLoudness')then
						needsLoudness=true;
						return loudnesses[realobj] or 0
					else
						return rawget(mt,'__index')(s,i)
					end
				end,
				__type='Instance',
				__tostring=function(self)
					return rawget(self,'real').Name
				end,
				__newindex=function(s,i,v)
					realobj[i]=v
				end})
				coroutine.wrap(function()
					repeat wait() until needsLoudness;
					GetClientProperty(realobj,'PlaybackLoudness')
				end)()
			elseif(realobj:IsA'TextBox')then
				ScriptCreated[realobj]=true;
				fakeobj.FocusLost=fakeEvent();
				setmetatable(fakeobj,object())
			elseif(realobj.ClassName=='ObjectValue')then
				setmetatable(fakeobj,object())
				getmetatable(fakeobj).__newindex=function(s,i,v)
					if(i=='Value' and fakes[v])then
						realobj.Value = fakes[v]
					else
						realobj[i]=v
					end
				end
			end
			
			fakes[fakeobj]=realobj
			reals[realobj]=fakeobj;
			
			return fakeobj
		end
		
		local function getReal(i)
			return fakes[i] or i
		end
		
		local fakeGame={real=game};
		local fakeInstance={new=function(objName,par)
			local realobj = Instance.new(objName)
			local fakeobj = wrapObject(realobj)
			realobj.Parent=getReal(par)
			local wrapped = getmetatable(fakeobj) and getmetatable(fakeobj).__index and true or false
			return wrapped and fakeobj or realobj
		end};
		
		local fakePlayer={};
		fakePlayer.real=Player;
		fakePlayer.mouse={
			KeyDown=fakeEvent();
			KeyUp=fakeEvent();
			Button1Down=fakeEvent();
			Button1Up=fakeEvent();
			Button2Down=fakeEvent();
			Button2Up=fakeEvent();
			Move=fakeEvent();
			X=0;
			Y=0;
			Target=nil;
			Hit=CFrame.new();
		}
		fakePlayer.GetMouse=function(self)
			return self.mouse;	
		end
		fakePlayer.PlayerScripts={}
		setmetatable(fakePlayer.PlayerScripts,object())
		getmetatable(fakePlayer.PlayerScripts).__index=function()
			return {{Disabled=true,Name="GONE"}}
		end
		local services = {
			Players={real=game:service'Players',LocalPlayer=fakePlayer,localPlayer=fakePlayer};
			UserInputService={real=game:service'UserInputService',_keys={};InputBegan=fakeEvent(),InputEnded=fakeEvent(),InputChanged=fakeEvent()};
			Debris={real=game:service'Debris',AddItem=function(self,item,timer)
				if(fakes[item])then
					item = fakes[item]
				end
				self.real:AddItem(item,timer)
			end};
			RunService={
				_bound={},
				_lastCall=tick();
				real=game:service'RunService',
				RenderStepped=game:service'RunService'.Stepped,
				BindToRenderStep=function(self,n,_,func)
					self._bound[n]=func;
				end;
				UnbindFromRenderStep=function(self,n,_,func)
					self:BindToRenderStep(n)
				end;	
			};
		}
		services.Debris.addItem=services.Debris.AddItem
		services.UserInputService.IsKeyDown=function(s,k)
			return s._keys[k] and true or false
		end
		services.UserInputService.InputBegan:connect(function(k)
			services.UserInputService._keys[k.KeyCode]=true
		end)
		services.UserInputService.InputEnded:connect(function(k)
			services.UserInputService._keys[k.KeyCode]=false
		end)

		local function getService(self,name)
			if(self==fakeGame)then
				return services[name] or game:service(name)
			end
		end
		services.RunService.RenderStepped:connect(function()
			local ct = tick();
			local lt = services.RunService._lastCall;
			local dt = ct-lt
			services.RunService._lastCall=ct;
			for name,func in next, services.RunService._bound do
				func(dt)
			end
		end)
		fakeGame.service=getService;
		fakeGame.GetService=getService;
		for i,v in next, services do 
			fakes[v]=v.real
			fakeGame[v.real.Name]=v
			setmetatable(v,object())
		end
		
		setmetatable(fakeGame,object())
		setmetatable(fakePlayer,object())
		fakes[fakeGame]=game
		fakes[fakePlayer]=Player
		
		getfenv(2).game=fakeGame
		getfenv(2).Instance=fakeInstance;
		
		getfenv(2).Wrap=wrapObject; -- lets you wrap your instances manually so that you have access to .PlaybackLoudness on sounds, etc.
		
		event.OnServerEvent:connect(function(self,data)
			local type = data.Type;
			if(data.Event)then
				local event = (type=='Mouse' and fakePlayer.mouse or type=='UserInput' and services.UserInputService or {})[data.Event]
				local eventIsFake = pcall(function()
					return event._connections~=nil
				end)
				if(event and eventIsFake)then
					event:fire(unpack(data.Args))
				end
			elseif(type=='Mouse')then
				--fakePlayer.mouse.Target=data.Target
				--fakePlayer.mouse.Hit=data.Hit
				for i,v in next, data.Variables do
					local eventIsFake = pcall(function()
						return fakePlayer.mouse[i]._connections~=nil
					end)
					if(not fakePlayer.mouse[i] or not eventIsFake)then
						fakePlayer.mouse[i]=v;
					end
				end
			elseif(type=='TextboxReplication')then
				if(ScriptCreated[data.TextBox])then
					data.TextBox.Text = data.Text
					if(reals[data.TextBox] and data.Args)then
						reals[data.TextBox].FocusLost:fire(unpack(data.Args))
					end
				end
			end
		end)
		
		print(gcp:InvokeClient(Player,'Ready'))
		repeat wait() until gcp:InvokeClient(Player,'Ready')
		return GetClientProperty;
	else
		return error("Make sure you're using a server-script!")
	end

end
