local StandName = script:WaitForChild("StandName")
local Player = game:GetService("Players").LocalPlayer

function TimeStopLighting()
	local Camera = workspace.CurrentCamera
	local CurrentFOV = Camera.FieldOfView
	local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
	local TimeStopColor = Instance.new("ColorCorrectionEffect")
	TimeStopColor.Name = StandName.Value.."'s Time Stop Effect"
	TimeStopColor.Parent = game:GetService("Lighting")
	TimeStopColor.Brightness = -0.7
	TimeStopColor.Contrast = 0
	TimeStopColor.Saturation = 1
	game:GetService("Debris"):AddItem(TimeStopColor, 25)
	coroutine.resume(coroutine.create(function()
		for i = 1, 25 do
			Camera.FieldOfView = CurrentFOV+(i*2)
			Humanoid.CameraOffset = Vector3.new(math.random(-17,17)/(-i/2), math.random(-17,17)/(-i/2), math.random(-17,17)/10)
			wait()
		end
		for i = 1, 10 do
			Camera.FieldOfView = 120-(i*5)
			Humanoid.CameraOffset = Vector3.new(math.random(-25,25)/(-i), math.random(-25,25)/(-i), math.random(-12,12)/10)
			wait()
		end
		Camera.FieldOfView = CurrentFOV
		Humanoid.CameraOffset = Vector3.new(0,0,0)
	end))
	coroutine.resume(coroutine.create(function()
		for i = 1, 10 do
			TimeStopColor.Contrast = -1-(i/10)
			TimeStopColor.Brightness = TimeStopColor.Brightness +0.077
			wait(0.054)
		end
		TimeStopColor.TintColor = Color3.fromRGB(127, 127, 127)
		for i = 1, 10 do
			TimeStopColor.Contrast = -1+(i/10)
			TimeStopColor.Brightness = TimeStopColor.Brightness -0.01
			TimeStopColor.Saturation = TimeStopColor.Saturation - 0.2
			wait(0.053)
		end
	end))
end

TimeStopLighting()

while wait() do
	if game:GetService("Lighting"):FindFirstChild(StandName.Value.."'s Time Resume Effect") then
		game:GetService("Lighting")[StandName.Value.."'s Time Resume Effect"]:Destroy()
	end
end 