local Tool = script.Parent
local Player = nil
local Stabbable = true
local Server = game.ReplicatedStorage:WaitForChild("RequiemArrowEvent"):Clone()

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	if Stabbable == true and Player.Character:FindFirstChild("StandValue") then
		Stabbable = false
		Server.Player.Value = Player
		Server.Handle.Value = Tool.Handle:Clone()
		
		--TODO: add all other stands as they are created
		if Player.Character["StandValue"].Value == "Steve Platinum" then
			Server.ToGive.Value = "SANS"
		elseif Player.Character["StandValue"].Value == "OREO" then
			Server.ToGive.Value = "JLM"
		else
			Server.ToGive.Value = "SPR"
		end
		
		Server.Parent = game:GetService("ServerScriptService")
		Server.Disabled = false
		game:GetService("Debris"):AddItem(Server, 7.5)
		Tool:Destroy()
		
	end
end)