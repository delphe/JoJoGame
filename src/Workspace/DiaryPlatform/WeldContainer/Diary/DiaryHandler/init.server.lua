local Tool = script.Parent
local Player = nil
local Use = true
local Giver = script:WaitForChild("StandEvent")
local Sound = Tool.Handle:FindFirstChild("Energy")

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

function KillStandScript()
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
end

Tool.Activated:Connect(function()
	if Use == true and Player.Character:FindFirstChild("StandValue") and workspace:FindFirstChild("IsTimeStopped") == nil and workspace:FindFirstChild("IsTimeErased") == nil and workspace:FindFirstChild("IsTimeAccelerating") == nil then
		if Player.Character["StandValue"].Value == "C-Moon" then
			Use = false
			Tool.Handle.HeavenParticles.Enabled = true
			if Sound then
				Sound:Play()
			end
			KillStandScript()
			wait(3.125)
			local Server = Giver:Clone()
			Server.Player.Value = Player
			Server.ToGive.Value = "MIH"
			Server.Parent = game:GetService("ServerScriptService")
			Server.Disabled = false
			game:GetService("Debris"):AddItem(Server, 7.5)
			wait(0.325)
			Tool:Destroy()
		elseif Player.Character["StandValue"].Value == "Whitesnake" then
			Use = false
			Tool.Handle.HeavenParticles.Enabled = true
			if Sound then
				Sound:Play()
			end
			KillStandScript()
			wait(3.125)
			local Server = Giver:Clone()
			Server.Player.Value = Player
			Server.ToGive.Value = "CM"
			Server.Parent = game:GetService("ServerScriptService")
			Server.Disabled = false
			game:GetService("Debris"):AddItem(Server, 7.5)
			wait(0.325)
			Tool:Destroy()
		elseif Player.Character["StandValue"].Value == "The World" then
			Use = false
			Tool.Handle.HeavenParticles.Enabled = true
			if Sound then
				Sound:Play()
			end
			KillStandScript()
			wait(3.125)
			local Server = Giver:Clone()
			Server.Player.Value = Player
			Server.ToGive.Value = "TWOH"
			Server.Parent = game:GetService("ServerScriptService")
			Server.Disabled = false
			game:GetService("Debris"):AddItem(Server, 7.5)
			wait(0.325)
			Tool:Destroy()
		elseif Player.Character["StandValue"].Value == "Star Platinum" then
			Use = false
			Tool.Handle.HeavenParticles.Enabled = true
			if Sound then
				Sound:Play()
			end
			KillStandScript()
			wait(3.125)
			local Server = Giver:Clone()
			Server.Player.Value = Player
			Server.ToGive.Value = "SPOH"
			Server.Parent = game:GetService("ServerScriptService")
			Server.Disabled = false
			game:GetService("Debris"):AddItem(Server, 7.5)
			wait(0.325)
			Tool:Destroy()
		end
	end
end)