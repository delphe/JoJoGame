local Stands = {}

function Stands(Stand, PlayerName)
	if game:GetService("Players"):FindFirstChild(PlayerName) then
		local player = game:GetService("Players")[PlayerName]
		player:WaitForChild("stand").Value = Stand -- value used to add stand to DataStore
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false) -- disable leader board
		
		--adding stand script will add the stand
		local n = script:WaitForChild("StandScript"):Clone()
		n.Parent = player:FindFirstChildOfClass("PlayerGui")
		n.Disabled = false
	end
end

return Stands