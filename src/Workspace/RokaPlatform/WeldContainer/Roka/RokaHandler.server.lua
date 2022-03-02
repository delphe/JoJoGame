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
		local StandScript = Player.Character[Player.Name.."'s "..Player.Character["StandValue"].Value]
		StandScript.Disabled = true
		StandScript:Destroy()
		Player.Character.StandValue:Destroy()
		if Player.Character:FindFirstChild("CanDodge") then
			Player.Character.CanDodge:Destroy()
		end
		if Player.Character:FindFirstChild("IsTSImmune") then
			Player.Character.IsTSImmune:Destroy()
		end
		if Player.Character:FindFirstChild("CanDodgeInTS") then
			Player.Character.CanDodgeInTS:Destroy()
		end
		if Player.Character.Head:FindFirstChild("Stand") then
			Player.Character.Head.Stand:Destroy()
		end
		Player.Character.StandInputClient.Disabled = true
		Player.Character.StandInputClient:Destroy()
		Player.Character.StandInput:Destroy()
		Player.Character.GetClientPropertyStandInput:Destroy()
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("MoveList") then
			Player:FindFirstChildOfClass("PlayerGui")["MoveList"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("ClockGui") then
			Player:FindFirstChildOfClass("PlayerGui")["ClockGui"]:Destroy()
		end
		wait(0.2)
		Tool:Destroy()
	end
end)