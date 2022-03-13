local ReplicatedStorage = game:GetService("ReplicatedStorage")
local enableGuiRemoteEvent = ReplicatedStorage:WaitForChild("EnableGuiRemoteEvent")
local disableGuiRemoteEvent = ReplicatedStorage:WaitForChild("DisableGuiRemoteEvent")
local player = game:GetService("Players").LocalPlayer
local playerGui = player:FindFirstChildOfClass("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local function enableGUI(typeOfGUI)
	
	local MoveList = playerGui:FindFirstChild("MoveList")
	local KeyboardMoveList = playerGui:FindFirstChild("KeyboardMoveList")
	local uis = game:GetService("UserInputService")
	local ismobile = uis.TouchEnabled
	local MovesGui
	
	if typeOfGUI == "ClockGui" then
		playerGui:FindFirstChild("ClockGui").Enabled = true
	else
		if ismobile then
			print("The user's device has a touch screen.")
			MovesGui = MoveList
			KeyboardMoveList.Enabled = false
		else
			if (UserInputService.KeyboardEnabled) then
				print("The user's device has an available keyboard.")
				MovesGui = KeyboardMoveList
				MoveList.Enabled = false
			else
				print("The user's device doesn't have a touch screen or a keyboard? Maybe they have an Xbox?")
				MovesGui = MoveList
				KeyboardMoveList.Enabled = false
			end
		end
		MovesGui.Enabled = true
	end
	
end

local function disableGUIs(typeOfGUI)
	if typeOfGUI == "ClockGui" then
		playerGui:FindFirstChild("ClockGui").Enabled = false
	elseif typeOfGUI == "MovesGUI" then
		playerGui:FindFirstChild("MoveList").Enabled = false
		playerGui:FindFirstChild("KeyboardMoveList").Enabled = false
	else
		playerGui:FindFirstChild("MoveList").Enabled = false
		playerGui:FindFirstChild("KeyboardMoveList").Enabled = false
		playerGui:FindFirstChild("ClockGui").Enabled = false
	end
end

enableGuiRemoteEvent.OnClientEvent:Connect(enableGUI)
disableGuiRemoteEvent.OnClientEvent:Connect(disableGUIs)