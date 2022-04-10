local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local removeStandEvent = ReplicatedStorage:WaitForChild("RemoveStandEvent")
local Tool = script.Parent
local Use = true

Tool.Activated:Connect(function()
	if Use == true then
		Use = false
		removeStandEvent:Fire(player)
		wait(0.2)
		Tool:Destroy()
	end
end)