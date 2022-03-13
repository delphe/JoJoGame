local Did = false
local IsEnabled = script:WaitForChild("Enabled").Value

local Glitch = script.Parent:WaitForChild("KC")
local Sound = Instance.new("Sound")
Sound.Name = "KC_Effect"
Sound.Parent = game:GetService("SoundService")
Sound.SoundId = "rbxassetid://3373991228"
Sound.Volume = 2
Sound.Looped = false
Sound.PlaybackSpeed = 1
Sound:Play()
Sound.Ended:Connect(function()
	if Did == false and IsEnabled == true then
		Did = true
		Sound.SoundId = "rbxassetid://3431631978"
		Sound:Play()
		game:GetService("Debris"):AddItem(Sound, Sound.TimeLength+1)
		local New = Instance.new("Sound")
		New.SoundId = "rbxassetid://1835344220"
		New.PlaybackSpeed = 0.75
		New.Volume = 10
		New.Looped = false
		New.Name = "KC_Bass"
		New.Parent = game:GetService("SoundService")
		local Loud = Instance.new("DistortionSoundEffect")
		Loud.Enabled = true
		Loud.Level = 0.3
		Loud.Parent = New
		Loud.Priority = 9e999
		spawn(function()
			wait(0.1)
			New:Play()
		end)
		game:GetService("Debris"):AddItem(New, New.TimeLength+3)
	elseif IsEnabled == false then
		Sound:Destroy()
	end
end)

local Images = {4573462670, 4573463247, 4573464191, 4573465237, 4573466633, 4573467848, 4573468665, 4573469255, 4573469861, 4573470481, 4573472230, 4573472712, 4573473408, 4573474618, 4573475743, 4573476483, 4573476928, 4573477493}
--Thanks to Player_57 ^

for i = 1, #Images do
	Glitch.Image = "rbxassetid://"..Images[i]
	if IsEnabled == true then
		wait(0.065)
	else
		wait(0.034)
	end
	if i == #Images then
		coroutine.resume(coroutine.create(function()
			wait(0.06)
			Glitch.Image = ""
		end))
	end
end


