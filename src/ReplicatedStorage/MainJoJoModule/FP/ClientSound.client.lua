local pt = script:WaitForChild("SoundParent")
local si = script:WaitForChild("SoundID")
local vo = script:WaitForChild("SoundVolume")
local pi = script:WaitForChild("SoundPitch")
local dt = script:WaitForChild("DestroyTime")
local tpo = script:WaitForChild("TimePos")

local snd = Instance.new("Sound")
snd.Parent = pt.Value
snd.SoundId = "rbxassetid://" ..si.Value
snd.Volume = vo.Value
snd.Pitch = pi.Value
snd.TimePosition = tpo.Value
snd:Play()

game:GetService("Debris"):AddItem(snd, dt.Value)
game:GetService("Debris"):AddItem(script, dt.Value)