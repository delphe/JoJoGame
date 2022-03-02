local StandName = script:WaitForChild("StandName").Value

for Index, Child in next, workspace:GetDescendants() do
	if Child:IsA("Sound") then
		if Child:FindFirstChild(StandName.."'s Time Stop Position") then
			Child.TimePosition = Child[StandName.."'s Time Stop Position"].Value
			Child[StandName.."'s Time Stop Position"]:Destroy()
		end
		if Child:FindFirstChild(StandName.."'s Time Stop Mute") then
			Child[StandName.."'s Time Stop Mute"]:Destroy()
		end
		if Child:FindFirstChild(StandName.."'s Time Stop Playing") then
			if Child[StandName.."'s Time Stop Playing"].Value == true then
				Child:Resume()
			end
			Child[StandName.."'s Time Stop Playing"]:Destroy()
		end
	end
end