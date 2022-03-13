local Tool = script.Parent
local Player = nil
local Use = true

Tool.Equipped:Connect(function()
	wait(0.1)
	Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
end)

Tool.Activated:Connect(function()
	if Use == true and Player.Character:FindFirstChild("StandValue") and workspace:FindFirstChild("IsTimeStopped") == nil and workspace:FindFirstChild("IsTimeErased") == nil and workspace:FindFirstChild("IsTimeAccelerating") == nil then
		Use = false
		
		repeat wait() until shared["removeStand"]
		shared.removeStand(Player)	
		
		wait(0.2)
		Tool:Destroy()
	end
end)