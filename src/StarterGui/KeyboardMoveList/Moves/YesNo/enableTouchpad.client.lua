local KeyboardMoveList = script.Parent.Parent.Parent
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MoveList = script.Parent.Parent.Parent.Parent:WaitForChild("MoveList")

script.Parent.MouseButton1Click:Connect(function()
	KeyboardMoveList.Enabled = false
	MoveList.Enabled = true
end)