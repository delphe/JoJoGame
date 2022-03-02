local Stands = {}

function Stands(Stand, PlayerName)
	if game:GetService("Players"):FindFirstChild(PlayerName) then
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		if Stand == "SP" then
			script:WaitForChild("SP")
			local n = script:WaitForChild("SP"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "TW" then
			script:WaitForChild("TW")
			local n = script:WaitForChild("TW"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "FP" then
			script:WaitForChild("FP")
			local n = script:WaitForChild("FP"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "KC" then
			script:WaitForChild("KC")
			local n = script:WaitForChild("KC"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "CD" then
			script:WaitForChild("CD")
			local n = script:WaitForChild("CD"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "WS" then
			script:WaitForChild("WS")
			local n = script:WaitForChild("WS"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "MIH" then
			script:WaitForChild("MIH")
			local n = script:WaitForChild("MIH"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "STV" then
			script:WaitForChild("STEVE")
			local n = script:WaitForChild("STEVE"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SANS" then
			script:WaitForChild("SANS")
			local n = script:WaitForChild("SANS"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false	
		elseif Stand == "JLM" then
			script:WaitForChild("JLM")
			local n = script:WaitForChild("JLM"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false	
		elseif Stand == "RP" then
			script:WaitForChild("RP")
			local n = script:WaitForChild("RP"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "NP" then
			script:WaitForChild("NP")
			local n = script:WaitForChild("NP"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "TWOH" then
			script:WaitForChild("TWOH")
			local n = script:WaitForChild("TWOH"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "GE" then
			script:WaitForChild("GE")
			local n = script:WaitForChild("GE"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "GER" then
			script:WaitForChild("GER")
			local n = script:WaitForChild("GER"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "TH" then
			script:WaitForChild("TH")
			local n = script:WaitForChild("TH"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "CM" then
			script:WaitForChild("CM")
			local n = script:WaitForChild("CM"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "BRAIN" then
			script:WaitForChild("BRAINMAN")
			local n = script:WaitForChild("BRAINMAN"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SPOH" then
			script:WaitForChild("SPOH")
			local n = script:WaitForChild("SPOH"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SC" then
			script:WaitForChild("SC")
			local n = script:WaitForChild("SC"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SCR" then
			script:WaitForChild("SCR")
			local n = script:WaitForChild("SCR"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "TWR" then
			script:WaitForChild("TWR")
			local n = script:WaitForChild("TWR"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SPR" then
			script:WaitForChild("SPR")
			local n = script:WaitForChild("SPR"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "KQ" then
			script:WaitForChild("KQ")
			local n = script:WaitForChild("KQ"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "MTW" then
			script:WaitForChild("MTW")
			local n = script:WaitForChild("MTW"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "SansC" then
			script:WaitForChild("SansC")
			local n = script:WaitForChild("SansC"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "HowIsThisMan" then
			script:WaitForChild("TheHow")
			local n = script:WaitForChild("TheHow"):Clone()
			n.PLR.Value = PlayerName
			n.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("PlayerGui")
			n.Disabled = false
		elseif Stand == "Arrow" then
			script:WaitForChild("Stand Arrow")
			local Arrow = script["Stand Arrow"]:Clone()
			local Arrow2 = script["Stand Arrow"]:Clone()
			Arrow2.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("Backpack")
			Arrow.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("StarterGear")
		elseif Stand == "Roka" then
			script:WaitForChild("Roka")
			local Roka = script["Roka"]:Clone()
			local Roka2 = script["Roka"]:Clone()
			Roka2.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("Backpack")
			Roka.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("StarterGear")
		elseif Stand == "ReqArrow" then
			script:WaitForChild("Requiem Arrow")
			local ReqArrow = script["Requiem Arrow"]:Clone()
			local ReqArrow2 = script["Requiem Arrow"]:Clone()
			ReqArrow.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("Backpack")
			ReqArrow2.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("StarterGear")
		elseif Stand == "DIODiary" then
			script:WaitForChild("Requiem Arrow")
			local DIODiary = script["Diary"]:Clone()
			local DIODiary2 = script["Diary"]:Clone()
			DIODiary.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("Backpack")
			DIODiary2.Parent = game:GetService("Players")[PlayerName]:FindFirstChildOfClass("StarterGear")
		end
	end
end

return Stands