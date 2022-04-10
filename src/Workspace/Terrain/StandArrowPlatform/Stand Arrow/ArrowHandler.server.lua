local Tool = script.Parent
local Player = nil
local Stabbable = true
local Server = game.ReplicatedStorage:WaitForChild("StandArrowEvent"):Clone()

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	local hasStand = false
	if Player:FindFirstChild("stand") then
		if Player.stand.Value ~= nil and Player.stand.Value ~= "" then
			hasStand = true
		end
	end
	if Stabbable == true and hasStand == false then
		Stabbable = false
		Server.Player.Value = Player
		Server.Handle.Value = Tool.Handle:Clone()
		Server.Parent = game:GetService("ServerScriptService")
		Server.Disabled = false
		game:GetService("Debris"):AddItem(Server, 7.5)
		Tool:Destroy()
	end
end)