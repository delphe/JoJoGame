local MoveList = script.Parent.Parent.Parent
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KeyboardMoveList = script.Parent.Parent.Parent.Parent:WaitForChild("KeyboardMoveList")

script.Parent.MouseButton1Click:Connect(function()
	MoveList.Enabled = false
	KeyboardMoveList.Enabled = true
end)