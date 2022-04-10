local Player = script:WaitForChild("Player").Value
local Arrow = script:WaitForChild("Handle").Value
local Give = script:WaitForChild("ToGive").Value
local Torso = Player.Character:FindFirstChild("Torso") or Player.Character:FindFirstChild("UpperTorso")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local swapStandValueRemoveEvent = ReplicatedStorage:WaitForChild("SwapStandValueRemoveEvent")

for Index, Child in next, Arrow:GetDescendants() do
	if Child:IsA("BasePart") then
		Child.CanCollide = false
	end
end

local Anchored = Torso.Anchored

Torso.Anchored = true

Arrow.Parent = Player.Character
Arrow.CFrame = Torso.CFrame * CFrame.new(0, 0, -1) * CFrame.Angles(math.rad(90), 0, 0)
Arrow.Anchored = true

local Torso = Player.Character:FindFirstChild("Torso") or Player.Character:FindFirstChild("UpperTorso")
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://1382489817"
--TODO: fix sound
--Sound.SoundId = "rbxassetid://2782131222"
Sound.Volume = 5.45
Sound.PlaybackSpeed = 0.985
Sound.Looped = false
Sound.Parent = Torso
Sound:Play()
game:GetService("Debris"):AddItem(Sound, Sound.TimeLength + 1)

swapStandValueRemoveEvent:FireClient(Player,Player,Give)

wait(1.55)

Torso.Anchored = Anchored

Arrow:Destroy()

