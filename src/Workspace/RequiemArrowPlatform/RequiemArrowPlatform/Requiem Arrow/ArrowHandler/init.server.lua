local Tool = script.Parent
local Player = nil
local Stabbable = true
local Server = script:WaitForChild("ArrowEvent")

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	if Stabbable == true and Player.Character:FindFirstChild("StandValue") then
		Stabbable = false
		Server.Player.Value = Player
		Server.Handle.Value = Tool.Handle:Clone()
		
		if Player.Character["StandValue"].Value == "Steve Platinum" then
			Server.ToGive.Value = "SANS"
		elseif Player.Character["StandValue"].Value == "JLM" then
			Server.ToGive.Value = "SPR"
		else
			Server.ToGive.Value = "SPR"
		end
		
		Server.Parent = game:GetService("ServerScriptService")
		Server.Disabled = false
		game:GetService("Debris"):AddItem(Server, 7.5)
		Tool:Destroy()
		
		--if Player.Character["StandValue"].Value == "Golden Experience" then
		--	Stabbable = false
		--	Server.Player.Value = Player
		--	Server.Handle.Value = Tool.Handle:Clone()
		--	Server.ToGive.Value = "GER"
		--	Server.Parent = game:GetService("ServerScriptService")
		--	Server.Disabled = false
		--	game:GetService("Debris"):AddItem(Server, 7.5)
		--	Tool:Destroy()
		--elseif Player.Character["StandValue"].Value == "Silver Chariot" then
		--	Stabbable = false
		--	Server.Player.Value = Player
		--	Server.Handle.Value = Tool.Handle:Clone()
		--	Server.ToGive.Value = "SCR"
		--	Server.Parent = game:GetService("ServerScriptService")
		--	Server.Disabled = false
		--	game:GetService("Debris"):AddItem(Server, 7.5)
		--	Tool:Destroy()
		--elseif Player.Character["StandValue"].Value == "The World" then
		--	Stabbable = false
		--	Server.Player.Value = Player
		--	Server.Handle.Value = Tool.Handle:Clone()
		--	Server.ToGive.Value = "TWR"
		--	Server.Parent = game:GetService("ServerScriptService")
		--	Server.Disabled = false
		--	game:GetService("Debris"):AddItem(Server, 7.5)
		--	Tool:Destroy()
		--elseif Player.Character["StandValue"].Value == "Star Platinum" then
		--	Stabbable = false
		--	Server.Player.Value = Player
		--	Server.Handle.Value = Tool.Handle:Clone()
		--	Server.ToGive.Value = "SPR"
		--	Server.Parent = game:GetService("ServerScriptService")
		--	Server.Disabled = false
		--	game:GetService("Debris"):AddItem(Server, 7.5)
		--	Tool:Destroy()
		--else
		--	Stabbable = false
		--	Server.Player.Value = Player
		--	Server.Handle.Value = Tool.Handle:Clone()
		--	Server.ToGive.Value = "SCR"
		--	Server.Parent = game:GetService("ServerScriptService")
		--	Server.Disabled = false
		--	game:GetService("Debris"):AddItem(Server, 7.5)
		--	Tool:Destroy()
		--end
	end
end)