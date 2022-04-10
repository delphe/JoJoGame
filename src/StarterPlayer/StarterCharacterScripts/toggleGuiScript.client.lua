local ReplicatedStorage = game:GetService("ReplicatedStorage")
local disableGuiEvent = ReplicatedStorage:WaitForChild("DisableGuiEvent")
local enableMovesGuiFunction = ReplicatedStorage:WaitForChild("EnableMovesGuiFunction")
local moveListFunction = ReplicatedStorage:WaitForChild("MoveListFunction")
local player = game:GetService("Players").LocalPlayer
local playerGui = player:FindFirstChildOfClass("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local function enableMovesGui()
	local MoveList = playerGui:FindFirstChild("MoveList")
	local KeyboardMoveList = playerGui:FindFirstChild("KeyboardMoveList")
	local uis = game:GetService("UserInputService")
	local MovesGui
	
	if uis.GamepadEnabled or uis.TouchEnabled then
		MovesGui = MoveList
		KeyboardMoveList.Enabled = false
	else
		print("A keyboard is probably enabled.")
		MovesGui = KeyboardMoveList
		MovesGui.MovesList.List.Text = buildMovesList("keyboard")
		MoveList.Enabled = false
	end
	if uis.TouchEnabled then
		print("A touch screen is enabled.")
		MovesGui.MovesList.List.Text = buildMovesList("touch")
	end
	if uis.GamepadEnabled then
		print("A gamepad is enabled.")
		MovesGui.MovesList.List.Text = buildMovesList("gamepad")
		if uis.TouchEnabled == false then
			--don't display move buttons if touch is not enabled
			MovesGui.Moves.Visible = false
		end
	end
	if uis.TouchEnabled and UserInputService.KeyboardEnabled then
		print("A touchpad and keyboard is enabled.")
		MovesGui.YesNo.Visible = true
		MovesGui.question.Visible = true
		KeyboardMoveList.question.Text = "Use Touchpad?"
	end
	if uis.GamepadEnabled and UserInputService.KeyboardEnabled then
		print("A gamepad and keyboard is enabled.")
		MovesGui.YesNo.Visible = true
		MovesGui.question.Visible = true
		KeyboardMoveList.question.Text = "Use Controller?"
	end
	MovesGui.Enabled = true
end

function buildMovesList(deviceType)
	local R = "B"
	local Q = "RB"
	local E = "X"
	local F = "Y"
	local T = "LB"
	local V = "RT"
	local B = "LT"
	local DoubleTap = "Double Tap"
	
	if deviceType == "keyboard" then
		R = "R"
		Q = "Q"
		E = "E"
		F = "F"
		T = "T"
		V = "V"
		B = "B"
		DoubleTap = "Double Click"
	end
	
	if deviceType == "gamepad" then
		DoubleTap = "RT"
	end
	
	local movesList = Q.. " = De/Summon Stand\n"
	if player.Character.CanStab.Value then
		movesList = movesList .. V.." = Strong Stab\n"
	else
		movesList = movesList .. DoubleTap.." = Punch\n"
	end
	
	movesList = movesList .. R.. " = Strong Punch\n"
	movesList = movesList .. E.." (hold) = Barrage\n"	
	
	if player.Character.CanTimeBoost.Value then
		movesList = movesList .. F.."+"..T.." = Time Boost/Resume\n"
	end
	if player.Character.CanTimeErase.Value then
		movesList = movesList .. F.."+"..T.."+"..T.." = Time Erase/Regain\n"
	end
	if player.Character.CanTimeStop.Value then
		movesList = movesList .. F.."+"..T.."+"..F.." = Time Stop\n"
	end
	if player.Character.CanTimeLeap.Value then
		movesList = movesList .. F.."+"..B.." = Time Leap\n"
	end
	if player.Character.CanThrowKnife.Value then
		movesList = movesList .. F.."+"..V.." = Throw Knife\n"
	end
	if player.Character.CanThrowKnives.Value then
		movesList = movesList .. F.."+"..V.."+"..V.." = Throw Knives\n"
	end
	if player.Character.CanHealSelf.Value then
		movesList = movesList .. T.." (hold) = Heal Self\n"
	end
	if player.Character.CanHealOthers.Value then
		movesList = movesList .. F.."+"..F.."+"..T.." = Heal Others\n"
		movesList = movesList .. B.." (hold) = Heal Others\n"
	end
	if player.Character.CanStarFinger.Value then
		movesList = movesList .. F.."+"..R.."+"..T.." = Star Finger\n"
	end
	if player.Character.CanBarrageCombo.Value then
		movesList = movesList .. F.."+"..E.." = Barrage Combo\n"
	end
	if player.Character.CanShearHeartAttack.Value then
		movesList = movesList .. F.."+"..Q.."+"..R.." = Shear Heart Attack\n"
	end
	if player.Character.CanGrowTree.Value then
		movesList = movesList .. F.."+"..Q.." = Grow Tree\n"
	end
	if player.Character.CanCreateWall.Value then
		movesList = movesList .. F.."+"..Q.."+"..Q.." = Create Wall\n"
	end
	if player.Character.CanIncreaseSpeed.Value then
		movesList = movesList .. F.."+"..R.." = De/Increase Speed\n"
	end
	if player.Character.CanDodge.Value then
		movesList = movesList .. F.."+"..F.." = Dodge (toggle)\n"
	end
	if player.Character.CanStandJump.Value then
		movesList = movesList .. F.."+"..E.."+"..E.." = Stand Jump\n"
	end
	
	return movesList
end

local function disableGUIs(typeOfGUI)
	playerGui:FindFirstChild("MoveList").Enabled = false
	playerGui:FindFirstChild("KeyboardMoveList").Enabled = false
	playerGui:FindFirstChild("ClockGui").Enabled = false
end

disableGuiEvent.Event:Connect(disableGUIs)
moveListFunction.OnInvoke = buildMovesList
enableMovesGuiFunction.OnInvoke = enableMovesGui