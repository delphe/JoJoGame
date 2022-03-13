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
	repeat wait() until shared["removeStand"]
	shared.removeStand(Player)	
end

Tool.Activated:Connect(function()
	if Use == true and Player.Character:FindFirstChild("StandValue") and workspace:FindFirstChild("IsTimeStopped") == nil and workspace:FindFirstChild("IsTimeErased") == nil and workspace:FindFirstChild("IsTimeAccelerating") == nil then
		--TODO: Use existing stands. These are all archived
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