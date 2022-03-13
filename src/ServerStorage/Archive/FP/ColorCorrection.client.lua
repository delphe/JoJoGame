local StandName = script:WaitForChild("StandName")

local Effect = Instance.new("ColorCorrectionEffect")
Effect.Parent = game:GetService("Lighting")
Effect.Name = StandName.Value.."'s Time Stop Effect"
local Blur = Instance.new("BlurEffect")
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0 
Blur.Name = StandName.Value.."'s Time Stop Effect 2"
coroutine.resume(coroutine.create(function()
	for i = 1, 10 do
		Effect.Contrast = -1-(i/10)
		wait(0.05)
	end
	Effect.TintColor = Color3.fromRGB(188,188,188)
	for i = 1, 10 do
		Effect.Contrast = -1+(i/10)
		wait(0.05)
	end
end))
coroutine.resume(coroutine.create(function()
	for i = 1, 25 do
		Blur.Size = i
		wait(0.035)
	end
	for i = 1, 25 do
		Blur.Size = Blur.Size - 1
		wait(0.015)
	end
	Blur:Destroy()
end))
while wait() do
	if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Time Resume Effect") then
		game:GetService("Lighting")[StandName.Value.."'s Time Resume Effect"]:Destroy()
	end
end 