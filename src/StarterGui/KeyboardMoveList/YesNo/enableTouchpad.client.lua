local KeyboardMoveList = script.Parent.Parent
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MoveListFunction = ReplicatedStorage:WaitForChild("MoveListFunction")
local MoveList = script.Parent.Parent.Parent:WaitForChild("MoveList")
local UserInputService = game:GetService("UserInputService")

script.Parent.MouseButton1Click:Connect(function()
	local uis = game:GetService("UserInputService")
	local deviceType = "touch"
	KeyboardMoveList.Enabled = false
	if uis.GamepadEnabled then
		deviceType = "gamepad"
	end
	MoveList.MovesList.List.Text = MoveListFunction:Invoke(deviceType)
	MoveList.Enabled = true
end)