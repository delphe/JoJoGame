local Tool = script.Parent
local Player = nil
local Stabbable = true
local Server = script:WaitForChild("ArrowEvent")

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	if Stabbable == true and Player.Character:FindFirstChild("StandValue") == nil then
		Stabbable = false
		Server.Player.Value = Player
		Server.Handle.Value = Tool.Handle:Clone()
		Server.Parent = game:GetService("ServerScriptService")
		Server.Disabled = false
		game:GetService("Debris"):AddItem(Server, 7.5)
		Tool:Destroy()
	end
end)