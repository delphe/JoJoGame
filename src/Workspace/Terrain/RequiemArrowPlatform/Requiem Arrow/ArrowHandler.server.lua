local Tool = script.Parent
local Player = nil
local Stabbable = true
local Server = game.ReplicatedStorage:WaitForChild("RequiemArrowEvent"):Clone()

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	if Stabbable == true and Player:FindFirstChild("stand") ~= nil and Player:FindFirstChild("stand") ~= "" then
		Stabbable = false
		Server.Player.Value = Player
		Server.Handle.Value = Tool.Handle:Clone()
		
		--TODO: add all other stands as they are created
		if Player.stand.Value == "STV" then
			Server.ToGive.Value = "SANS"
		elseif Player.stand.Value == "OREO" then
			Server.ToGive.Value = "JLM"
		elseif Player.stand.Value == "FLAV" then
			Server.ToGive.Value = "FLAVR"
		else
			Server.ToGive.Value = "SPR"
		end
		
		Server.Parent = game:GetService("ServerScriptService")
		Server.Disabled = false
		game:GetService("Debris"):AddItem(Server, 7.5)
		Tool:Destroy()
		
	end
end)