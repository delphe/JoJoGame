local Chance = math.random(1, 100)
local omg = math.random(1, 1000)
local Player = script:WaitForChild("Player").Value
local Arrow = script:WaitForChild("Handle").Value
local StandRequire = game.ReplicatedStorage.MainJoJoModule
local RunService = game:GetService("RunService")
local Torso = Player.Character:FindFirstChild("Torso") or Player.Character:FindFirstChild("UpperTorso")

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

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://2782131222"
Sound.Volume = 5.45
Sound.PlaybackSpeed = 0.985
Sound.Looped = false
Sound.Parent = Torso
Sound:Play()
game:GetService("Debris"):AddItem(Sound, Sound.TimeLength + 1)

if RunService:IsStudio() then
	--Running in test mode. Load up the stand you're wanting to test out
	require(StandRequire)("OREO", Player.Name)
else
	--This block of code will NOT be hit when testing in Roblox Studio
	--TODO: add all other stands as they are created
	local Rand = math.random(1, 2)
	if Rand == 1 then
		require(StandRequire)("OREO", Player.Name)
	else
		require(StandRequire)("STV", Player.Name)
	end
end

wait(1.55)

Torso.Anchored = Anchored

Arrow:Destroy()