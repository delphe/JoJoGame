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


--if omg ~= 1000 then
--	if Chance < 50 then
--		local Rand = math.random(1, 6)
--		if Rand == 1 then
--			require(StandRequire)("TH", Player.Name)
--		elseif Rand == 2 then
--			require(StandRequire)("WS", Player.Name)
--		elseif Rand == 3 then
--			require(StandRequire)("KC", Player.Name)
--		--[[
--		elseif Rand == 4 then
--			local Rand2 = math.random(1, 3)
--			if Rand2 == 1 then
--				require(StandRequire)("NP", Player.Name)
--			elseif Rand2 == 2 then
--				require(StandRequire)("FP", Player.Name)
--			elseif Rand2 == 3 then
--				require(StandRequire)("STV", Player.Name)
--			end
--		--]]
--		elseif Rand == 4 then
--			require(StandRequire)("GE", Player.Name)
--		elseif Rand == 5 then
--			require(StandRequire)("KQ", Player.Name)
--		elseif Rand == 6 then
--			Player.Character:BreakJoints()
--		end
--	elseif Chance > 50 and Chance < 101 then
--		local Rand = math.random(1, 4)
--		if Rand == 1 then
--			require(StandRequire)("CD", Player.Name)
--		elseif Rand == 2 then
--			require(StandRequire)("SP", Player.Name)
--		elseif Rand == 3 then
--			require(StandRequire)("TW", Player.Name)
--		elseif Rand == 4 then
--			require(StandRequire)("SC", Player.Name)
--		end
--	end
--else
--	require(StandRequire)("MTW", Player.Name)
--end

wait(1.55)

Torso.Anchored = Anchored

Arrow:Destroy()