local Player = script:WaitForChild("Player").Value
local Arrow = script:WaitForChild("Handle").Value
local Give = script:WaitForChild("ToGive").Value
local StandRequire = game.ReplicatedStorage.MainJoJoModule
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

local StandScript = Player.Character[Player.Name.."'s "..Player.Character["StandValue"].Value]
StandScript.Disabled = true
StandScript:Destroy()
Player.Character.StandValue:Destroy()
if Player.Character:FindFirstChild("CanDodge") then
	Player.Character.CanDodge:Destroy()
end
if Player.Character:FindFirstChild("IsTSImmune") then
	Player.Character.IsTSImmune:Destroy()
end
if Player.Character:FindFirstChild("CanDodgeInTS") then
	Player.Character.CanDodgeInTS:Destroy()
end
if Player.Character.Head:FindFirstChild("Stand") then
	Player.Character.Head.Stand:Destroy()
end
Player.Character.StandInputClient.Disabled = true
Player.Character.StandInputClient:Destroy()
Player.Character.StandInput:Destroy()
Player.Character.GetClientPropertyStandInput:Destroy()
if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("MoveList") then
	Player:FindFirstChildOfClass("PlayerGui")["MoveList"]:Destroy()
end
if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("ClockGui") then
	Player:FindFirstChildOfClass("PlayerGui")["ClockGui"]:Destroy()
end
local Chance = math.random(1, 10000)
if Chance == 10000 then
	require(StandRequire)("Justice", Player.Name)
else
	require(StandRequire)(Give, Player.Name)
end
		

wait(1.55)

Torso.Anchored = Anchored

Arrow:Destroy()