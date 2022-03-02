local StandName = script:WaitForChild("StandName")

if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Shockwave Effect") then
	game:GetService("Lighting")[StandName.Value.."'s Shockwave Effect"]:Destroy()
end

local Blur = Instance.new("BlurEffect")
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0 
Blur.Name = StandName.Value.."'s Shockwave Effect"
coroutine.resume(coroutine.create(function()
	for i = 1, 25 do
		Blur.Size = i
		wait(0.015)
	end
	for i = 1, 25 do
		Blur.Size = Blur.Size - 1
		wait(0.015)
	end
	Blur:Destroy()
end))