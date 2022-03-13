local Parts = {}
local ActionParts = {}
local Character = script:WaitForChild("Char").Value
local PartLimit = 400
local EffectParts = 350
local CurrentParts = 0

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

function CheckParts(Object, Return)
	for i = 1, EffectParts do
		if Parts[(EffectParts+1)-i] ~= nil and not Parts[(EffectParts+1)-i]:IsA("Terrain") then
			if Object == Parts[(EffectParts+1)-i] then
				if Return == "Value" then
					return Object
				elseif Return == "Index" then
					return (EffectParts+1)-i
				end
			end
		end
	end
	return nil
end

--Massive Credit to Player_57 for giving me this TableSorted code.
for Index, Child in next, workspace:GetDescendants() do
	if Child:IsA("BasePart") and not Child:IsA("Terrain") and IsAHumanoid(Child) == nil then
		if Child.Transparency < 0.93 and CurrentParts < PartLimit then
			table.insert(Parts, Child)
			CurrentParts = CurrentParts + 1
		end
	elseif Child:IsA("Sound") and not Child:IsDescendantOf(Character) then
		local PlayingValue = Instance.new("BoolValue")
		PlayingValue.Name = "KC_Playing"
		PlayingValue.Value = Child.Playing
		PlayingValue.Parent = Child
		--[[
		local SoundMute = Instance.new("TremoloSoundEffect")
		SoundMute.Name = "KC_SoundMute"
		SoundMute.Depth = 1
		SoundMute.Duty = 0
		SoundMute.Enabled = true
		SoundMute.Frequency = 5
		SoundMute.Priority = 9e999
		SoundMute.Parent = Child
		]]
		local SoundPitchMod = Instance.new("PitchShiftSoundEffect")
		SoundPitchMod.Name = "KC_Pitcher"
		SoundPitchMod.Octave = 0.95
		SoundPitchMod.Parent = Child
		local SoundReverbMod = Instance.new("ReverbSoundEffect")
		SoundReverbMod.Name = "KC_ReverbAdder"
		SoundReverbMod.DecayTime = 11.5
		SoundReverbMod.Density = 0.85
		SoundReverbMod.Diffusion = 0.15
		SoundReverbMod.DryLevel = -80
		SoundReverbMod.WetLevel = 5
		SoundReverbMod.Parent = Child
		Child:GetPropertyChangedSignal("Playing"):Connect(function()
			if workspace:FindFirstChild("IsTimeErased") then
				--[[
				if Child:FindFirstChild("KC_SoundMute") == nil then
					local SoundMute = Instance.new("TremoloSoundEffect")
					SoundMute.Name = "KC_SoundMute"
					SoundMute.Depth = 1
					SoundMute.Duty = 0
					SoundMute.Enabled = true
					SoundMute.Frequency = 5
					SoundMute.Priority = 9e999
					SoundMute.Parent = Child
				end
				]]
				if Child:FindFirstChild("KC_ReverbAdder") == nil then
					local SoundReverbMod = Instance.new("ReverbSoundEffect")
					SoundReverbMod.Name = "KC_ReverbAdder"
					SoundReverbMod.DecayTime = 11.5
					SoundReverbMod.Density = 0.85
					SoundReverbMod.Diffusion = 0.15
					SoundReverbMod.DryLevel = -80
					SoundReverbMod.WetLevel = 5
					SoundReverbMod.Parent = Child
				end
				if Child:FindFirstChild("KC_Pitcher") == nil then
					local SoundPitchMod = Instance.new("PitchShiftSoundEffect")
					SoundPitchMod.Name = "KC_Pitcher"
					SoundPitchMod.Octave = 0.95
					SoundPitchMod.Parent = Child
				end
			end
		end)
	end
end

local TableSorted = true
repeat
	TableSorted = true
	for i = #Parts, 1, -1 do
		for Part = 2, i do
			if Parts[Part-1].Size.Magnitude < Parts[Part].Size.Magnitude then
				local x = Parts[Part-1]
				Parts[Part-1] = Parts[Part]
				Parts[Part] = x
				TableSorted = false
			end
		end
	end
until TableSorted == true

for i = 1, EffectParts do
	if Parts[i] ~= nil then
		table.insert(ActionParts, Parts[i])
	end
end

local KCSky = Instance.new("Sky")
KCSky.Name = "KC_SkyBox"
KCSky.Parent = game:GetService("Lighting")
KCSky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
KCSky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
KCSky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
KCSky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
KCSky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
KCSky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
KCSky.StarCount = 0
KCSky.SunAngularSize = 0
KCSky.SunTextureId = ""

for Index, Child in next, workspace:GetDescendants() do
	if Child:IsA("BasePart") and IsAHumanoid(Child) == nil and Child.Name ~= "Baseplate" and Child.Name ~= "Base" and CheckParts(Child, "Value") == nil then
		local CollideValue = Instance.new("BoolValue")
		CollideValue.Value = Child.CanCollide
		CollideValue.Name = "KC_Collide"
		CollideValue.Parent = Child
		local AnchoredValue = Instance.new("BoolValue")
		AnchoredValue.Value = Child.Anchored
		AnchoredValue.Name = "KC_Anchor"
		AnchoredValue.Parent = Child
		local TransValue = Instance.new("NumberValue")
		TransValue.Value = Child.Transparency
		TransValue.Name = "KC_Trans"
		TransValue.Parent = Child
		Child.Anchored = true
		Child.Transparency = 0.825
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	workspace:FindFirstChildOfClass("Terrain").Transparency = 1
	if workspace:FindFirstChild("Base") and workspace:FindFirstChild("Base"):IsA("BasePart") then
		workspace.Base.Transparency = 1
	elseif workspace:FindFirstChild("Baseplate") and workspace:FindFirstChild("Baseplate"):IsA("BasePart") then
		workspace.Baseplate.Transparency = 1
	end
end)

for i = 1, EffectParts do
	if ActionParts[i] ~= nil then
		local CFrameDirection = math.random(1,4)
		local OrientationAddX = math.random(-1,1)
		local OrientationAddY = math.random(-1,1)
		local OrientationAddZ = math.random(-1,1)
		local RealPart = ActionParts[i]
		local CollideValue = Instance.new("BoolValue")
		CollideValue.Value = RealPart.CanCollide
		CollideValue.Name = "KC_Collide"
		CollideValue.Parent = RealPart
		local AnchoredValue = Instance.new("BoolValue")
		AnchoredValue.Value = RealPart.Anchored
		AnchoredValue.Name = "KC_Anchor"
		AnchoredValue.Parent = RealPart
		local TransValue = Instance.new("NumberValue")
		TransValue.Value = RealPart.Transparency
		TransValue.Name = "KC_Trans"
		TransValue.Parent = RealPart
		RealPart.Anchored = true
		local Part = RealPart:Clone()
		if Part.Name == "Base" or Part.Name == "Baseplate" then
			Part.Transparency = 1
		end
		Part.Name = "KC_EffectPart"
		RealPart.Transparency = 0.825
		Part.Parent = RealPart.Parent
		Part.CanCollide = false
		Part.Anchored = true
		coroutine.resume(coroutine.create(function()
			while Part do
				if Part == nil then
					break
				end
				game:GetService("RunService").RenderStepped:Wait()
				Part.Orientation = Part.Orientation + Vector3.new(OrientationAddX, OrientationAddY, OrientationAddZ)
				if CFrameDirection == 1 then
					Part.Position = Part.Position + Vector3.new(0, math.random(1,2)/15, 0)
				elseif CFrameDirection == 2 then
					Part.Position = Part.Position + Vector3.new(-math.random(-1,2)/5, -math.random(-1,3)/15, 0)
				elseif CFrameDirection == 3 then
					Part.Position = Part.Position + Vector3.new(0, math.random(-1,4)/15, -math.random(-1,2)/5)
				elseif CFrameDirection == 4 then
					Part.Position = Part.Position + Vector3.new(-math.random(-1,2)/5, 0.05, -math.random(-1,2)/5)
				end
				Part.Size = Part.Size + Vector3.new(-math.random(-1,2)/14*Part.Size.X/4, -math.random(-1,2)/14*Part.Size.Y/4, -math.random(-1,2)/14*Part.Size.Z/4)
				for Index, Child in next, Part:GetChildren() do
					if Part:FindFirstChildOfClass("SpecialMesh") then
						local Mesh = Part:FindFirstChildOfClass("SpecialMesh")
						Mesh.Scale = Mesh.Scale + Vector3.new(-math.random(-1,2)/20*Mesh.Scale.X/6, -math.random(-1,2)/20*Mesh.Scale.Y/6, -math.random(-1,2)/20*Mesh.Scale.Z/6)
					end
				end
			end
		end))
	end
end