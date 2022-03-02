local Character = script:WaitForChild("Char").Value
local StandName = script:WaitForChild("StandName").Value

function IsAHumanoid(Part)
	if Part:FindFirstAncestorWhichIsA("Model") then
		if Part:FindFirstAncestorWhichIsA("Model").Name == "Stand" then
			if Part:FindFirstAncestorWhichIsA("Model"):FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid") then
				return Part:FindFirstAncestorWhichIsA("Model"):FindFirstAncestorWhichIsA("Model")
			else
				return nil
			end
		end
		if Part:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid") then
			return Part:FindFirstAncestorWhichIsA("Model")
		else
			return nil
		end
	else
		return nil
	end
end

function AddingStopper(Child)
	Child.ChildAdded:Connect(function()
		if script then
			if Child:IsA("Sound") then
				Mute(Child)
			else
				AddingStopper(Child)
			end
		end
	end)
end

function Mute(Sound)
	local TimePositionValue = Instance.new("NumberValue")
	TimePositionValue.Value = Sound.TimePosition
	TimePositionValue.Name = StandName.."'s Time Stop Position"
	TimePositionValue.Parent = Sound
	local PlayingValue = Instance.new("BoolValue")
	PlayingValue.Value = Sound.Playing
	PlayingValue.Name = StandName.."'s Time Stop Playing"
	PlayingValue.Parent = Sound
	local SoundMute = Instance.new("TremoloSoundEffect")
	SoundMute.Name = StandName.."'s Time Stop Mute"
	SoundMute.Depth = 1
	SoundMute.Duty = 0
	SoundMute.Enabled = true
	SoundMute.Frequency = 5
	SoundMute.Priority = 9e999
	SoundMute.Parent = Sound
	Sound:Stop()
	Sound:GetPropertyChangedSignal("Playing"):Connect(function()
		if script then
			Sound:Stop()
			if Sound:FindFirstChild(StandName.."'s Time Stop Mute") == nil then
				local SoundMute = Instance.new("TremoloSoundEffect")
				SoundMute.Name = StandName.."'s Time Stop Mute"
				SoundMute.Depth = 1
				SoundMute.Duty = 0
				SoundMute.Enabled = true
				SoundMute.Frequency = 5
				SoundMute.Priority = 9e999
				SoundMute.Parent = Sound
			end
		end
	end)
	Sound.ChildAdded:Connect(function(Child)
		if script then
			if Child:IsA("Sound") then
				Mute(Child)
			else
				AddingStopper(Child)
			end
		end
	end)
end

for Index, Child in next, workspace:GetDescendants() do
	if Child:IsA("Sound") and not Child:IsDescendantOf(Character) then
		if IsAHumanoid(Child) then
			local TsChar = IsAHumanoid(Child)
			if TsChar:FindFirstChild("IsTSImmune") then
				local Value = TsChar["IsTSImmune"]
				Value:GetPropertyChangedSignal("Value"):Connect(function()
					if Value.Value == false then
						Mute(Child)
					end
				end)
			else
				Mute(Child)
			end
		else
			Mute(Child)
		end
	elseif not Child:IsA("Sound") and not Child:IsDescendantOf(Character) and not Child == Character then
		if IsAHumanoid(Child) then
			local TsChar = IsAHumanoid(Child)
			if TsChar:FindFirstChild("IsTSImmune") then
				local Value = TsChar["IsTSImmune"]
				Value:GetPropertyChangedSignal("Value"):Connect(function()
					if Value.Value == false then
						AddingStopper(Child)
					end
				end)
			else
				AddingStopper(Child)
			end
		else
			AddingStopper(Child)
		end
	end
end

workspace.DescendantAdded:Connect(function(Child)
	if Child:IsA("Sound") and not Child:IsDescendantOf(Character) then
		if IsAHumanoid(Child) then
			local TsChar = IsAHumanoid(Child)
			if TsChar:FindFirstChild("IsTSImmune") then
				local Value = TsChar["IsTSImmune"]
				Value:GetPropertyChangedSignal("Value"):Connect(function()
					if Value.Value == false then
						Mute(Child)
					end
				end)
			else
				Mute(Child)
			end
		else
			Mute(Child)
		end
	end
end)