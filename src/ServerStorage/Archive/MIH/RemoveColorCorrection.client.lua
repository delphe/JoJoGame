local StandName = script:WaitForChild("StandName")

if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Time Resume Effect") then
	game:GetService("Lighting")[StandName.Value.."'s Time Resume Effect"]:Destroy()
end

local Blur = Instance.new("BlurEffect")
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0 
Blur.Name = StandName.Value.."'s Time Resume Effect"
coroutine.resume(coroutine.create(function()
	for i = 1, 25 do
		Blur.Size = i
		wait(0.025)
	end
	for i = 1, 25 do
		Blur.Size = Blur.Size - 1
	end
	Blur:Destroy()
end))
while wait() do
	if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Time Stop Effect") then
		game:GetService("Lighting")[StandName.Value.."'s Time Stop Effect"]:Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Time Stop Effect 2") then
		game:GetService("Lighting")[StandName.Value.."'s Time Stop Effect 2"]:Destroy()
	end
end 