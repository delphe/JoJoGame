local MoveList = script.Parent.Parent
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MoveListFunction = ReplicatedStorage:WaitForChild("MoveListFunction")
local KeyboardMoveList = script.Parent.Parent.Parent:WaitForChild("KeyboardMoveList")
local UserInputService = game:GetService("UserInputService")

script.Parent.MouseButton1Click:Connect(function()
	local uis = game:GetService("UserInputService")
	local question = "Use Touchpad?"
	MoveList.Enabled = false
	if uis.GamepadEnabled then
		question = "Use Controller?"
	end
	KeyboardMoveList.MovesList.List.Text = MoveListFunction:Invoke("keyboard")
	KeyboardMoveList.YesNo.Visible = true
	KeyboardMoveList.question.Text = question
	KeyboardMoveList.question.Visible = true
	KeyboardMoveList.Enabled = true
end)