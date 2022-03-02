-->Made By XDavodioX<--
 
--=(Category = Fun, Action, Quick, Unfair)=--
 
--:Made In Heaven:--
 
--//Unknown\\--

script:WaitForChild("Stand")
script:WaitForChild("ColorCorrection")
script:WaitForChild("RemoveColorCorrection")
script:WaitForChild("MoveList")
script:WaitForChild("ClockGui")
script:WaitForChild("Shockwave")
script:WaitForChild("FeModule")
local OriginalStand = script["Stand"]:Clone()
local CorrectionScript = script["ColorCorrection"]:Clone()
local CorrectionRemoveScript = script["RemoveColorCorrection"]:Clone()
local WaveScript = script["Shockwave"]:Clone()
wait(0.25)
script["Stand"]:Destroy()

require(script.FeModule)()

local StandName = "Made In Heaven"
local ModelCreator = "UNLOCKED_USERb556"

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local Character = Player.Character
local Root = Character.HumanoidRootPart
local LArm = Character:FindFirstChild("Left Arm") or Character:FindFirstChild("LeftUpperArm")
local LLeg = Character:FindFirstChild("Left Leg") or Character:FindFirstChild("LeftUpperLeg")
local RArm = Character:FindFirstChild("Right Arm") or Character:FindFirstChild("RightUpperArm")
local RLeg = Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightUpperLeg")
local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
local Head = Character.Head
local Hum = Character:FindFirstChildOfClass("Humanoid")
local RJ = Root:FindFirstChild("RootJoint") or Torso:FindFirstChild("Waist")
local LAJ = Torso:FindFirstChild("Left Shoulder") or LArm:FindFirstChild("LeftShoulder")
local LLJ = Torso:FindFirstChild("Left Hip") or LLeg:FindFirstChild("LeftHip")
local RAJ = Torso:FindFirstChild("Right Shoulder") or RArm:FindFirstChild("RightShoulder")
local RLJ = Torso:FindFirstChild("Right Hip") or RLeg:FindFirstChild("RightHip")
local Neck = Torso:FindFirstChild("Neck") or Head:FindFirstChild("Neck")

script.Name = Player.Name.."'s "..StandName

local MoveList = script["MoveList"]
MoveList.Parent = Player:FindFirstChildOfClass("PlayerGui")
MoveList.Enabled = true
local Clock = script["ClockGui"]
Clock.Parent = Player:FindFirstChildOfClass("PlayerGui")
Clock.Enabled = false

warn("Huge Credit to "..ModelCreator.." for the "..StandName.." Model! \nGo check them out!")

local AttackSpeed = 0.9
local Sine = 0

local CurrentStand = nil
local TimeAccelerateSeconds = 30 -- Time Accelerate Time - In seconds, just normal numbers no .2 stuff
local Move = false
local BarrageDown = false
local Anim = "Idle"
local TimeAccelerating = false
local StrongPunching = false
local NormalPunch = false
local PunchAfterBarrage = false
local AllowClockMovment = false
local ClockTime = 0
local OgAttackSpeed = 0
local OgWalkSpeed = 0
local AccelerateSeconds = 0
local AccelerateWalkSpeed = 0
local Posing = false
local StandUsers = {
	Player
}

local AnimDefaults = {
	["head"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["head1"] = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["tors"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["tors0"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["rarm"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["rarm1"] = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["larm"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["larm1"] = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["rleg"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["rleg1"] = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["lleg"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["lleg1"] = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
}

Hum.WalkSpeed = 22
Hum.MaxHealth = 375
Hum.Health = Hum.MaxHealth

function CreateSound(ID, Parent, Volume, Pitch, TimePos, Loop, StayForever, CustomName)
	local New = nil
	coroutine.resume(coroutine.create(function()
		New = Instance.new("Sound")
		New.Name = CustomName
		New.Parent = Parent
		New.Volume = Volume
		New.SoundId = "rbxassetid://"..ID
		New.Pitch = Pitch
		New.TimePosition = TimePos
		New.Looped = Loop
		if StayForever == false then
			New.Ended:Connect(function()
				New:Destroy()
			end)
		end
		New:Play()
	end))
	return New
end

function CreateClientSound(ID, Parent, Volume, TimePosition, Pitch, DebrisTime)
	local NEWCLIENTSOUND = nil
	local NEWCLIENTSOUNDDATA = nil
	coroutine.resume(coroutine.create(function()
		NEWCLIENTSOUNDDATA = script["ClientSound"]
		local pt = NEWCLIENTSOUNDDATA:WaitForChild("SoundParent")
		local si = NEWCLIENTSOUNDDATA:WaitForChild("SoundID")
		local vo = NEWCLIENTSOUNDDATA:WaitForChild("SoundVolume")
		local pi = NEWCLIENTSOUNDDATA:WaitForChild("SoundPitch")
		local dt = NEWCLIENTSOUNDDATA:WaitForChild("DestroyTime")
		local tpo = NEWCLIENTSOUNDDATA:WaitForChild("TimePos")
		pt.Value = Parent
		si.Value = tonumber(ID)
		vo.Value = tonumber(Volume)
		pi.Value = tonumber(Pitch)
		dt.Value = tonumber(DebrisTime)
		tpo.Value = tonumber(TimePosition)
		NEWCLIENTSOUND = script["ClientSound"]:Clone()
		NEWCLIENTSOUND.Parent = Player:FindFirstChildOfClass("PlayerGui")
		NEWCLIENTSOUND.Disabled = false
	end))
end

function Glue(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end

function CheckTable(Table, Value, ValueIndex, Return)
	for Index,Val in pairs(Table) do
		if Val == Value then
			if Return == "Index" then
				return Index
			else
				if ValueIndex == 0 or ValueIndex == nil then
					return Val
				else
					return Val[ValueIndex]
				end
			end
		end
	end
	return nil
end

function CheckTableWithValueIndex(Table, Value, ValueIndex, Return)
	for Index,Val in pairs(Table) do
		if Val[ValueIndex] == Value then
			if Return == "Index" then
				return Index
			else
				return Val[ValueIndex]
			end
		end
	end
	return nil
end

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

function IsAStand(Part)
	if Part:FindFirstAncestorWhichIsA("Model") then
		if Part:FindFirstAncestorWhichIsA("Model"):FindFirstChild("IsAStand") then
			if Part:FindFirstAncestorWhichIsA("Model").IsAStand.Value == true then
				return Part:FindFirstAncestorWhichIsA("Model")
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end

function Lock(Character)
	for Index,Child in next, Character:GetChildren() do
		if Child:IsA("BasePart") then
			Child.Anchored = true
		end
	end
end

function Unlock(Character)
	for Index,Child in next, Character:GetChildren() do
		if Child:IsA("BasePart") then
			Child.Anchored = false
		end
	end
end

function CreateEffect(Parent, EffectType, EffectColor)
	if EffectType == "Ball" then
		local Ball = Instance.new("Part")
		Ball.Shape = Enum.PartType.Ball
		Ball.Name = StandName.."'s Effect"
		Ball.Color = EffectColor
		Ball.Material = Enum.Material.Neon
		Ball.Anchored = true
		Ball.CanCollide = false
		Ball.Transparency = 0
		Ball.Parent = Parent
		Ball.Size = Vector3.new(0.1,0.1,0.1)
		Ball.CFrame = Parent.CFrame * CFrame.new(math.random(-7,7)/10,math.random(-7,7)/10,math.random(-7,7)/10)
		coroutine.resume(coroutine.create(function()
			for i = 1, 50 do
				game:GetService("RunService").RenderStepped:Wait()
				Ball.Size = Ball.Size + Vector3.new(0.05,0.05,0.05)
				Ball.Transparency = Ball.Transparency + 0.02
			end
			Ball:Destroy()
		end))
	elseif EffectType == "Slice" then
		coroutine.resume(coroutine.create(function()
			for i = 1, 2 do
				local ZC = Instance.new("Part")
				ZC.Parent = Parent
				ZC.Size = Vector3.new(1,1,1)
				ZC.CanCollide = false
				ZC.Anchored = true
				ZC.Name = StandName.."'s Effect"
				ZC.CFrame = Parent.CFrame * CFrame.new(0,0,0) * CFrame.Angles(math.random(-4,4),math.random(-4,4),math.random(-4,4))
				ZC.Shape = Enum.PartType.Ball
				ZC.Material = Enum.Material.Neon
				ZC.Color = EffectColor
				local ZC2 = Instance.new("SpecialMesh",ZC)
				ZC2.MeshType = Enum.MeshType.Sphere
				ZC2.Scale = Vector3.new(2,0.7,0.3)
				coroutine.resume(coroutine.create(function()
					for i = 1,35 do
						game:GetService("RunService").RenderStepped:Wait()
						ZC2.Scale = ZC2.Scale + Vector3.new(0,0,0.4)
						ZC.Transparency = ZC.Transparency + 0.03
					end
					ZC:Destroy()
				end))
			end
		end))
	elseif EffectType == "BarrageArm" then
		local FadeArm = Parent:Clone()
		FadeArm.Anchored = true
		FadeArm.Color = EffectColor
		FadeArm.CFrame = FadeArm.CFrame * CFrame.new(math.random(-1,1), 0, math.random(-1.5,1.5))
		FadeArm.Name = StandName.."'s Barrage Arm"
		FadeArm.Parent = CurrentStand
		coroutine.resume(coroutine.create(function()
			for i = 1,27 do
				game:GetService("RunService").RenderStepped:Wait()
				FadeArm.Transparency = FadeArm.Transparency + 0.06
				for Index, Child in next, FadeArm:GetDescendants() do
					if Child:IsA("BasePart") or Child:IsA("Decal") then
						Child.Transparency = FadeArm.Transparency
					end
				end
			end
			FadeArm:Destroy()
		end))
	elseif EffectType == "PunchWave" then
		local WavePart = Instance.new("Part")
		WavePart.Anchored = true
		WavePart.CanCollide = false
		WavePart.Transparency = 0
		WavePart.Size = Vector3.new(0.5,0.5,0.5)
		WavePart.CFrame = Parent.CFrame * CFrame.new(math.random(-1,1), 0, math.random(-1.5,1.5))
		WavePart.Orientation = Vector3.new(90, CurrentStand.StandTorso.Orientation.Y, CurrentStand.StandTorso.Orientation.Z)
		WavePart.Name = StandName.."'s Wave Effect"
		WavePart.Parent = Parent
		WavePart.Color = EffectColor
		local Wave = Instance.new("SpecialMesh")
		Wave.Parent = WavePart
		Wave.MeshId = "rbxassetid://989468093"
		Wave.Scale = Vector3.new(0.35,0.05,0.35)
		coroutine.resume(coroutine.create(function()
			for i = 1,15 do
				game:GetService("RunService").RenderStepped:Wait()
				Wave.Scale = Wave.Scale + Vector3.new(0.25, 0, 0.25)
			end
			for i = 1,20 do
				game:GetService("RunService").RenderStepped:Wait()
				Wave.Scale = Wave.Scale + Vector3.new(0.17, 0, 0.17)
				WavePart.Transparency = WavePart.Transparency + 0.05
			end
			WavePart:Destroy()
		end))
	end
end

function HitEffect(OriginalHit, Character, RootFrame, HitType)
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
	CreateEffect(OriginalHit, "PunchWave", Color3.fromRGB(255, 255, 255))
	if HitType == "Barrage" then
		Humanoid.WalkSpeed = 3.5
		coroutine.resume(coroutine.create(function()
			wait(1.5)
			Humanoid.WalkSpeed = 16
		end))
		if Humanoid.Health < 12 and Humanoid.Health > 0 then
			Humanoid.Health = Humanoid.Health + 7.5
			PunchAfterBarrage = true
			Lock(Humanoid.Parent)
		end
	elseif HitType == "Strong" then
		Unlock(Humanoid.Parent)
		local Velo = Instance.new("BodyVelocity")
		Velo.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		Velo.P = 3000
		Velo.Velocity = RootFrame * CFrame.new(0,0,-195).p
		Velo.Parent = HitTorso
		coroutine.resume(coroutine.create(function()
			wait(0.1275)
			Velo:Destroy()
		end))
	elseif HitType == "Punch" then
		local Velo = Instance.new("BodyVelocity")
		Velo.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		Velo.P = 2500
		Velo.Velocity = RootFrame * CFrame.new(0,0,-65).p
		Velo.Parent = HitTorso
		coroutine.resume(coroutine.create(function()
			wait(0.11)
			Velo:Destroy()
		end))
	end
end

function CreatePopUpGui(Parent, AnimationType, Text, TextColor)
	if AnimationType == "FadeOut" then
		local txt = Instance.new("BillboardGui")
		txt.Parent = Parent
		txt.Adornee = Parent
		txt.Name = StandName.."'s PopUp"
		txt.Size = UDim2.new(2, 0, 1.2, 0)
		txt.StudsOffset = Vector3.new(math.random(-5,-1) , math.random(0,2), math.random(-2,2))
		local text = Instance.new("TextLabel", txt)
		text.Size = UDim2.new(4, 0, 1.25, 0)
		text.TextScaled = true
		text.FontSize = Enum.FontSize.Size24
		text.TextSize = 26
		text.TextTransparency = 0
		text.BackgroundTransparency = 1
		text.TextStrokeTransparency = 1
		text.Font = Enum.Font.Fantasy
		text.Text = Text
		text.TextColor3 = TextColor
		coroutine.resume(coroutine.create(function()
			for i = 1,22 do
				game:GetService("RunService").RenderStepped:Wait()
				txt.StudsOffset = txt.StudsOffset + Vector3.new(0, 0.05, 0)
			end
			for i = 1,20 do
				game:GetService("RunService").RenderStepped:Wait()
				text.TextTransparency = text.TextTransparency + 0.05
				txt.StudsOffset = txt.StudsOffset - Vector3.new(0, 0.015, 0)
			end
			txt:Destroy()
		end))
	elseif AnimationType == "Jump" then
		local JumpDirection = math.random(1,2)
		local txt = Instance.new("BillboardGui")
		txt.Parent = Parent
		txt.Adornee = Parent
		txt.Name = StandName.."'s PopUp"
		txt.Size = UDim2.new(2, 0, 1.2, 0)
		txt.StudsOffset = Vector3.new(math.random(-5,-1) , math.random(3,5), math.random(-2,2))
		local text = Instance.new("TextLabel", txt)
		text.Size = UDim2.new(4, 0, 1.25, 0)
		text.TextScaled = true
		text.FontSize = Enum.FontSize.Size24
		text.TextSize = 26
		text.TextTransparency = 0
		text.BackgroundTransparency = 1
		text.TextStrokeTransparency = 1
		text.Font = Enum.Font.Fantasy
		text.Text = Text
		text.TextColor3 = TextColor
		if JumpDirection == 1 then
			coroutine.resume(coroutine.create(function()
				for i = 1,15 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset + Vector3.new(0, 0.12, 0)
				end
				for i = 1,3 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset - Vector3.new(0.009, -0.015, 0)
					text.Rotation = text.Rotation - 1.15
				end
				for i = 1,7 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset - Vector3.new(0.045, 0.085, 0)
					text.TextTransparency = text.TextTransparency + 0.01
					text.Rotation = text.Rotation - 1.3
				end
				for i = 1,35 do
					game:GetService("RunService").RenderStepped:Wait()
					text.TextTransparency = text.TextTransparency + 0.05
					txt.StudsOffset = txt.StudsOffset - Vector3.new(0.055, 0.19, 0)
					text.Rotation = text.Rotation - 1.75
				end
				txt:Destroy()
			end))
		else
			coroutine.resume(coroutine.create(function()
				for i = 1,15 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset + Vector3.new(0, 0.12, 0)
				end
				for i = 1,3 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset - Vector3.new(-0.009, -0.015, 0)
					text.Rotation = text.Rotation + 1.15
				end
				for i = 1,7 do
					game:GetService("RunService").RenderStepped:Wait()
					txt.StudsOffset = txt.StudsOffset - Vector3.new(-0.045, 0.085, 0)
					text.TextTransparency = text.TextTransparency + 0.01
					text.Rotation = text.Rotation + 1.3
				end
				for i = 1,35 do
					game:GetService("RunService").RenderStepped:Wait()
					text.TextTransparency = text.TextTransparency + 0.04
					txt.StudsOffset = txt.StudsOffset - Vector3.new(-0.055, 0.19, 0)
					text.Rotation = text.Rotation + 1.75
				end
				txt:Destroy()
			end))
		end
	end
end

function CreateHitBox(Cframe, Damage, Size, DebrisTime, Overwrite, Effect, HitSound, HitType, EffectColor)
	if Overwrite == true then
		if CurrentStand:FindFirstChild(StandName.."'s Hit Box") then
			CurrentStand[StandName.."'s Hit Box"]:Destroy()
		end
	end
	local HB = Instance.new("Part")
	HB.Orientation = Vector3.new(0, 90, 0)
	HB.Name = StandName.."'s Hit Box"
	HB.CanCollide = false
	HB.Massless = true
	HB.Size = Size
	HB.CFrame = Cframe
	HB.BrickColor = BrickColor.new("Really red")
	HB.Transparency = 1
	HB.Parent = CurrentStand
	local AnchoredV1 = Instance.new("BodyVelocity")
	AnchoredV1.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	AnchoredV1.Parent = HB
	AnchoredV1.P = 3e9
	AnchoredV1.Velocity = Vector3.new(Cframe)
	local AnchoredV2 = Instance.new("BodyPosition")
	AnchoredV2.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	AnchoredV2.Parent = HB
	AnchoredV2.Position = Vector3.new(Cframe)
	AnchoredV2.P = 3e9
	AnchoredV2.D = 3e9
	HB.Touched:Connect(function(Toucher)
		if IsAHumanoid(Toucher) and IsAHumanoid(Toucher) ~= Character and IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid").Health > 0 and IsAHumanoid(Toucher):FindFirstChild("JustGotHitten") == nil then
			game:GetService("Debris"):AddItem(HB, 0.05)
			local Humanoid = IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid")
			local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
			local Val = Instance.new("BoolValue")
			Val.Name = "JustGotHitten"
			Val.Value = true
			Val.Parent = Humanoid.Parent
			game:GetService("Debris"):AddItem(Val, 0.05)
			if Humanoid.Parent:FindFirstChild("CanDodge") and AccelerateSeconds < 1200 then
				if Humanoid.Parent.CanDodge.Value == true then
					if Humanoid.Parent:FindFirstChild("GotHitButNot") then
						Humanoid.Parent.GotHitButNot:Destroy()
					end
					local Val = Instance.new("StringValue")
					Val.Name = "GotHitButNot"
					Val.Parent = Humanoid.Parent
					Val.Value = "Missed Hit"
					game:GetService("Debris"):AddItem(Val, 0.2)
					CreatePopUpGui(Toucher, "FadeOut", "Miss", Color3.fromRGB(199, 199, 199))
					return
				end
			end
			if Humanoid.Parent:FindFirstChild("ReturnStandDamage") then
				local Val = Instance.new("StringValue")
				Val.Name = "RTZActive"
				Val.Parent = Hum.Parent
				Val.Value = "Missed Hit"
				game:GetService("Debris"):AddItem(Val, 0.2)
				if Humanoid.Parent.ReturnStandDamage.Value == true then
					if Hum.MaxHealth > 10000 then
						Hum.Parent:BreakJoints()
					end
					coroutine.resume(coroutine.create(function()
						CreateEffect(Root, Effect, EffectColor)
					end))
					CreateSound(HitSound, Root, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
					if HitType == "Strong" then
						Hum.BreakJointsOnDeath = false
					end
					if Damage == "Instant Kill" then
						Hum.Parent:BreakJoints()
						CreatePopUpGui(Root, "Jump", tostring(Humanoid.MaxHealth), Color3.fromRGB(188, 0, 0))
					else
						Hum:TakeDamage(Damage)
						CreatePopUpGui(Root, "Jump", tostring(Damage), Color3.fromRGB(188, 0, 0))
					end
					HitEffect(Root, Hum.Parent, CurrentStand.RootPart.CFrame, HitType)
					return
				end
			end
			CreateSound(HitSound, Toucher, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
			if Humanoid.MaxHealth > 10000 then
				Humanoid.Parent:BreakJoints()
			end
			coroutine.resume(coroutine.create(function()
				CreateEffect(Toucher, Effect, EffectColor)
			end))
			if HitType == "Strong" then
				Humanoid.BreakJointsOnDeath = false
			end
			if Damage == "Instant Kill" then
				Humanoid.Parent:BreakJoints()
				CreatePopUpGui(Toucher, "Jump", tostring(Humanoid.MaxHealth), Color3.fromRGB(188, 0, 0))
			else
				Humanoid:TakeDamage(Damage)
				CreatePopUpGui(Toucher, "Jump", tostring(Damage), Color3.fromRGB(188, 0, 0))
			end
			HitEffect(Toucher, Humanoid.Parent, CurrentStand.RootPart.CFrame, HitType)
		end
	end)
	game:GetService("Debris"):AddItem(HB, DebrisTime)
	return HB
end

function Stand()
	Move = true
	if CurrentStand == nil then
		CurrentStand = OriginalStand:Clone()
		local Call = CreateSound(4650379787, Head, 5, 1, 1.87, false, true, "Stand Call")
		game:GetService("Debris"):AddItem(Call, 1.4)
		for Index,Child in next, CurrentStand:GetDescendants() do
			if Child:IsA("BasePart") or Child:IsA("Decal") then
				Child.Transparency = 1
			end
		end
		CurrentStand:SetPrimaryPartCFrame(Root.CFrame)
		CurrentStand.Parent = Head
		for Index,Child in next, CurrentStand:GetDescendants() do
			if (Child:IsA("BasePart") or Child:IsA("Decal")) and Child.Name ~= "RootPart" and Child.Name ~= "Head" and Child.Name ~= "Left Leg" and Child.Name ~= "Right Leg" then
				coroutine.resume(coroutine.create(function(Part)
					for i = 1, 25 do
						game:GetService("RunService").RenderStepped:Wait()
						Part.Transparency = Part.Transparency - 0.04
					end
					Part.Transparency = 0
				end), Child)
			end
		end
		CreateSound(463010917, CurrentStand.PrimaryPart, 2.1, math.random(95,108)/100, 0, false, false, "Stand Appear")
		for i = 0,1,0.02 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-3.5, 1.8, 2.4), 0.23)
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 1.5*math.sin(Sine/75))*CFrame.Angles(0, 0, math.rad(-22.002)), 0.23)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.38), 0, 0), 0.23)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.818), 0, 0), 0.23)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.4, -0.12, 0.04) * CFrame.Angles(math.rad(-36.268), math.rad(-30.653), math.rad(-58.499)), 0.23)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.41, -0.08, 0) * CFrame.Angles(math.rad(-6.188), math.rad(50.306), math.rad(53.915)), 0.23)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(3.953), math.rad(22.861), math.rad(16.1)), 1)
		end
	else
		for Index,Child in next, CurrentStand:GetDescendants() do
			if Child:IsA("BasePart") or Child:IsA("Decal") then
				coroutine.resume(coroutine.create(function(Part)
					for i = 1, 20 do
						game:GetService("RunService").RenderStepped:Wait()
						Part.Transparency = Part.Transparency + 0.05
					end
					Part.Transparency = 1
				end), Child)
			end
		end
		for i = 0,1,0.02 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame, i)
		end
		wait(0.01)
		CurrentStand:Destroy()
		CurrentStand = nil
	end
	Move = false
end

function Barrage(Times, NeutralStop, BarrageSFX, Tpos)
	if CurrentStand == nil then
		return
	end
	Move = true
	local WalkSpeed = Hum.WalkSpeed
	if TimeAccelerating == false then
		Hum.WalkSpeed = 10
	end
	local Done = false
	local Repeat = Times
	local AttachmentLeft1 = Instance.new("Attachment")
	AttachmentLeft1.Parent = CurrentStand["Left Arm"]
	AttachmentLeft1.Position = Vector3.new(0,-2.5,0)
	local AttachmentLeft2 = Instance.new("Attachment")
	AttachmentLeft2.Parent = CurrentStand["Left Arm"]
	AttachmentLeft2.Position = Vector3.new(0,2.5,0)
	local AttachmentRight1 = Instance.new("Attachment")
	AttachmentRight1.Parent = CurrentStand["Right Arm"]
	AttachmentRight1.Position = Vector3.new(0,-2.5,0)
	local AttachmentRight2 = Instance.new("Attachment")
	AttachmentRight2.Parent = CurrentStand["Right Arm"]
	AttachmentRight2.Position = Vector3.new(0,2.5,0)
	local TrailLeft = Instance.new("Trail")
	TrailLeft.Parent = CurrentStand["Left Arm"]
	TrailLeft.Lifetime = 0.05
	TrailLeft.LightEmission = 0.8
	TrailLeft.Transparency = NumberSequence.new(0.7)
	TrailLeft.Attachment0 = AttachmentLeft1
	TrailLeft.Attachment1 = AttachmentLeft2
	local TrailRight = Instance.new("Trail")
	TrailRight.Parent = CurrentStand["Right Arm"]
	TrailRight.Lifetime = 0.05
	TrailRight.LightEmission = 0.8
	TrailRight.Transparency = NumberSequence.new(0.7)
	TrailRight.Attachment0 = AttachmentRight1
	TrailRight.Attachment1 = AttachmentRight2
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		Repeat = Repeat - 1
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Barrage", Color3.fromRGB(255, 255, 255))
		CreateSound(BarrageSFX, CurrentStand.Head, 3, math.random(98,108)/100, Tpos, false, false, "Air Woosh")
		for i = 0,1,0.225*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(28.018), math.rad(-4.526), math.rad(-8.48)), i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(3.667), math.rad(6.646), math.rad(13.923)), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.952, 0.496, -0.141) * CFrame.Angles(math.rad(-5.73), math.rad(6.933), math.rad(-12.261)), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-1.587, 0.561, -0.296) * CFrame.Angles(math.rad(-19.996), math.rad(-32.143), math.rad(-108.862)), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-1.515, -0.375, 0.297) * CFrame.Angles(math.rad(-4.412), math.rad(5.214), math.rad(108.518)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.745), math.rad(8.308)), i)
		end
		CreateEffect(CurrentStand["Left Arm"], "BarrageArm", CurrentStand["Left Arm"].Color)
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Barrage", Color3.fromRGB(255, 255, 255))
		CreateSound(BarrageSFX, CurrentStand.Head, 3, math.random(98,108)/100, Tpos, false, false, "Air Woosh")
		for i = 0,1,0.225*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(27.846), math.rad(5.73), math.rad(10.714)), i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(-0.057, 0.038, -0.01) * CFrame.Angles(math.rad(-2.693), math.rad(-5.157), math.rad(15.069)), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.927, 0.471, 0.061) * CFrame.Angles(math.rad(1.318), math.rad(-4.813), math.rad(-12.892)), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(1.596, -0.316, 0.111) * CFrame.Angles(math.rad(-1.776), math.rad(-3.037), math.rad(-103.075)), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(1.659, 0.498, -0.516) * CFrame.Angles(math.rad(-19.079), math.rad(38.961), math.rad(106.284)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(-0.117, 0.022, -0.012) * CFrame.Angles(math.rad(-23.377), math.rad(-0.917), math.rad(-10.084)), i)
		end
		CreateEffect(CurrentStand["Right Arm"], "BarrageArm", CurrentStand["Right Arm"].Color)
	until Repeat < 0 or Repeat == 0 or BarrageDown == false or Done == true
	if TimeAccelerating == false then
		Hum.WalkSpeed = WalkSpeed
	end
	AttachmentLeft1:Destroy()
	AttachmentLeft2:Destroy()
	AttachmentRight1:Destroy()
	AttachmentRight2:Destroy()
	TrailLeft:Destroy()
	TrailRight:Destroy()
	if PunchAfterBarrage == false then
		for i = 0,1,0.3 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
		end
		Move = false
	else
		StrongPunch()
		PunchAfterBarrage = false
	end
end

function ClockFade()
	local Clone = Clock.Clock.Count:Clone()
	Clone.Name = "CounterFade"
	Clone.Parent = Clock.Clock
	coroutine.resume(coroutine.create(function()
		for i = 1, 75 do
			game:GetService("RunService").RenderStepped:Wait()
			Clone.Size = Clone.Size + UDim2.new(0, 2, 0, 2)
			Clone.Position = Clone.Position + UDim2.new(-0.005, 0, -0.005, 0)
			Clone.TextTransparency = Clone.TextTransparency + 0.025
			Clone.TextStrokeTransparency = Clone.TextTransparency
		end
		Clone:Destroy()
	end))
end

function TimeAccelerate()
	if CurrentStand == nil then
		return
	end
	if (Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air) and Hum.Sit == false then
		return
	end
	Move = true
	if workspace:FindFirstChild("IsTimeStopped") then
		local Val = Instance.new("StringValue")
		Val.Value = Player.Name
		Val.Name = "MIHInstantResume"
		if workspace:FindFirstChild("IsTimeStopped") then
			Val.Parent = game:GetService("Players")[workspace.IsTimeStopped.Value].Character
		else
			Val.Parent = workspace
		end
		game:GetService("Debris"):AddItem(Val, 0.5)
	elseif workspace:FindFirstChild("IsTimeErased") then
		local Val = Instance.new("StringValue")
		Val.Value = Player.Name
		Val.Name = "MIHInstantResume"
		if workspace:FindFirstChild("IsTimeErased") then
			Val.Parent = game:GetService("Players")[workspace.IsTimeErased.Value].Character
		else
			Val.Parent = workspace
		end
		game:GetService("Debris"):AddItem(Val, 0.5)
	end
	if workspace:FindFirstChild("IsTimeAccelerating") then
		if workspace.IsTimeAccelerating.Value == Player.Name then
			workspace.IsTimeAccelerating:Destroy()
		end
	end
	OgAttackSpeed = AttackSpeed
	OgWalkSpeed = Hum.WalkSpeed
	AccelerateWalkSpeed = Hum.WalkSpeed
	local Val = Instance.new("StringValue")
	Val.Value = Player.Name
	Val.Name = "IsTimeAccelerating"
	Val.Parent = workspace
	ClockTime = TimeAccelerateSeconds
	Clock.Clock.MainArrow.Rotation = 0.015
	Clock.Clock.Count.Text = tostring(ClockTime)
	Clock.Enabled = true
	if Character:FindFirstChild("Time Accelerate SFX") then
		Character["Time Accelerate SFX"]:Destroy()
	end
	CreateSound(4095610922, Character, 7.5, 1, 0, false, false, "Time Accelerate SFX")
	TimeAccelerating = true
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.." Stop Effect") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.." Stop Effect"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.." Resume Effect") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.." Resume Effect"]:Destroy()
		end
		local Copy = CorrectionScript:Clone()
		Copy.Name = StandName.." Stop Effect"
		Copy.StandName.Value = StandName
		Copy.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Copy.Disabled = false
		game:GetService("Debris"):AddItem(Copy, TimeAccelerateSeconds)
	end
	AllowClockMovment = true
	coroutine.resume(coroutine.create(function()
		repeat
			game:GetService("RunService").RenderStepped:Wait()
		until ClockTime < 0 or ClockTime == 0 or TimeAccelerating == false
		if TimeAccelerating == true then
			if CurrentStand == nil then
				Stand()
			end
			TimeResume()
		end
	end))
	Move = false
end

function TimeResume()
	if CurrentStand == nil then
		return
	end
	AllowClockMovment = false
	ClockTime = 0
	Clock.Enabled = false
	Move = true
	BarrageDown = false
	AccelerateWalkSpeed = OgWalkSpeed
	TimeAccelerating = false
	AttackSpeed = OgAttackSpeed
	Hum.WalkSpeed = OgWalkSpeed
	AccelerateSeconds = 0
	if workspace:FindFirstChild("IsTimeAccelerating") then
		if workspace.IsTimeAccelerating.Value == Player.Name then
			workspace.IsTimeAccelerating:Destroy()
		end
	end
	for Index,Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.." Resume Effect") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.." Resume Effect"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.." Stop Effect") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.." Stop Effect"]:Destroy()
		end
		local Copy = CorrectionRemoveScript:Clone()
		Copy.Name = StandName.." Resume Effect"
		Copy.StandName.Value = StandName
		Copy.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Copy.Disabled = false
		game:GetService("Debris"):AddItem(Copy, 4.5)
	end
	Move = false
end

function KnifeThrow()
	if CurrentStand == nil then
		return
	end
	Move = true
	NormalPunch = true
	local WalkSpeed = Hum.WalkSpeed
	if TimeAccelerating == false then
		Hum.WalkSpeed = 6
	end
	for i = 0,1,0.065*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, -0.44, 0) * CFrame.Angles(math.rad(11.746), 0, 0), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.209), math.rad(0.688), 0), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-4.183), math.rad(-0.859), math.rad(-0.057)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.323, 0.067, 0) * CFrame.Angles(math.rad(4.641), math.rad(-59.759), math.rad(-78.782)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.333, 0.069, 0) * CFrame.Angles(math.rad(5.157), math.rad(54.66), math.rad(75.401)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(-7.047), 0, 0), i)
	end
	coroutine.resume(coroutine.create(function()
		wait(0.085)
		CreateSound(166423113, CurrentStand.StandTorso, 4, 1, 0.04, false, false, "Throw SFX")
		for i = 1, 2 do
			local KnifePart = Instance.new("Part")
			KnifePart.Size = Vector3.new(1,1,3)
			KnifePart.Name = "Knife"
			KnifePart.Anchored = false
			KnifePart.CanCollide = false
			KnifePart.Massless = true
			KnifePart.Parent = workspace
			KnifePart.CFrame = CurrentStand.StandTorso.CFrame * CFrame.new(-1+(1*i),-1,0) * CFrame.Angles(0, 0, math.rad(90))
			local Mesh = Instance.new("SpecialMesh")
			Mesh.MeshId = "rbxassetid://2047774297"
			Mesh.TextureId = "rbxassetid://2047774362"
			Mesh.Scale = Vector3.new(.4,.4,.4)
			Mesh.Parent = KnifePart
			local Att1 = Instance.new("Attachment")
			Att1.Parent = KnifePart
			Att1.Position = Vector3.new(0, -0.069, 1.317)
			local Att2 = Instance.new("Attachment")
			Att2.Parent = KnifePart
			Att2.Position = Vector3.new(0, 0.103, 1.317)
			local Trail = Instance.new("Trail")
			Trail.Parent = KnifePart
			Trail.FaceCamera = true
			Trail.Enabled = true
			Trail.Attachment0 = Att1
			Trail.Attachment1 = Att2
			Trail.Lifetime = 0.15
			Trail.Parent = KnifePart
			Trail.WidthScale = NumberSequence.new(1,0)
			local Original = 100
			KnifePart.Anchored = false
			local Velocity = Instance.new("BodyVelocity")
			Velocity.Name = "KnifeThrowing"
			Velocity.Parent = KnifePart
			Velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			if TimeAccelerating == false then
				Velocity.Velocity = KnifePart.CFrame.lookVector*Original
			else
				Velocity.Velocity = KnifePart.CFrame.lookVector*(Original*AccelerateSeconds/130)
			end
			coroutine.resume(coroutine.create(function()
				repeat 
					game:GetService("RunService").RenderStepped:Wait()
					Velocity.Velocity = KnifePart.CFrame.lookVector*Original
					Original = Original - 1.75
				until Velocity.Parent == nil or Original < 10
				Velocity:Destroy()
			end))
			game:GetService("Debris"):AddItem(KnifePart, 10)
			local DidHit = false
			local Damage = math.random(40,70)
			KnifePart.Touched:Connect(function(Toucher)
				if DidHit == false and IsAHumanoid(Toucher) and IsAHumanoid(Toucher) ~= Character and IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid").Health > 0 then
					DidHit = true
					local Humanoid = IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid")
					local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
					if Humanoid.Parent:FindFirstChild("CanDodge") and AccelerateSeconds < 1200 then
						if Humanoid.Parent.CanDodge.Value == true then
							if Humanoid.Parent:FindFirstChild("GotHitButNot") then
								Humanoid.Parent.GotHitButNot:Destroy()
							end
							local Val = Instance.new("StringValue")
							Val.Name = "GotHitButNot"
							Val.Parent = Humanoid.Parent
							Val.Value = "Missed Hit"
							game:GetService("Debris"):AddItem(Val, 0.2)
							CreatePopUpGui(Toucher, "FadeOut", "Miss", Color3.fromRGB(199, 199, 199))
							return
						end
					else
						if KnifePart:FindFirstChild("KnifeThrowing") then
							KnifePart.KnifeThrowing:Destroy()
						end
						Glue(Toucher, KnifePart)
					end
					CreateSound(201858024, Toucher, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
					CreatePopUpGui(Toucher, "Jump", tostring(Damage), Color3.fromRGB(188, 0, 0))
					if Humanoid.MaxHealth > 10000 then
						Humanoid.Parent:BreakJoints()
					end
					if Damage == "Instant Kill" then
						Humanoid.Parent:BreakJoints()
					else
						Humanoid:TakeDamage(Damage)
					end
				end
			end)
		end
	end))
	for i = 0,1,0.065*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 1.09, 0) * CFrame.Angles(math.rad(-13.178), 0, 0), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.266), 0, math.rad(12.032)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-4.297), math.rad(-0.057), math.rad(-10.6)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.323, 0.067, 0.26) * CFrame.Angles(math.rad(35.638), math.rad(49.561), math.rad(-112.185)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.333, 0.069, 0.2) * CFrame.Angles(math.rad(41.024), math.rad(-53.686), math.rad(113.56)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(12.319), 0, 0), i)
	end
	NormalPunch = false
	if TimeAccelerating == false then
		Hum.WalkSpeed = WalkSpeed
	end
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function Slit()
	if CurrentStand == nil then
		return
	end
	if not IsAHumanoid(Mouse.Target) then
		return
	end
	local Char = IsAHumanoid(Mouse.Target)
	local CharTorso = Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
	if not CharTorso then
		return
	end
	local Humanoid = Char:FindFirstChildOfClass("Humanoid")
	if (CharTorso.Position-Root.Position).magnitude < 25 then
		NormalPunch = true
		Move = true
		Lock(Char)
		local Saved = Root.CFrame
		Root.CFrame = CharTorso.CFrame * CFrame.new(0, 0.5, 5)
		wait(0.1)
		if Humanoid.Parent:FindFirstChild("CanDodge") and AccelerateSeconds < 1200 then
			if Humanoid.Parent.CanDodge.Value == true then
				if Humanoid.Parent:FindFirstChild("GotHitButNot") then
					Humanoid.Parent.GotHitButNot:Destroy()
				end
				local Val = Instance.new("StringValue")
				Val.Name = "GotHitButNot"
				Val.Parent = Humanoid.Parent
				Val.Value = "Missed Hit"
				game:GetService("Debris"):AddItem(Val, 0.2)
				CreatePopUpGui(CharTorso, "FadeOut", "Miss", Color3.fromRGB(199, 199, 199))	
			end
		else
			CreateSound(186311262, CharTorso, 4, 1, 0, false, false, "Slit SFX")
			Char:BreakJoints()
			CreatePopUpGui(CharTorso, "Jump", tostring(Humanoid.MaxHealth), Color3.fromRGB(199, 0, 0))
		end
		Unlock(Char)
		for i = 0,1,0.03*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(33.289), math.rad(-11.631), math.rad(-18.908)), i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(11.918), math.rad(17.704), math.rad(12.089)), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.971, 0.512, -0.238) * CFrame.Angles(math.rad(-10.6), math.rad(13.522), math.rad(-11.173)), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.615, 0.279, -0.164) * CFrame.Angles(math.rad(-9.683), math.rad(-21.772), math.rad(-98.721)), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.145, 0.078, 0.013) * CFrame.Angles(math.rad(-30.309), math.rad(-14.897), math.rad(5.157)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-24.465), math.rad(4.183), math.rad(25.783)), i)
		end
		NormalPunch = false
		Root.CFrame = Saved
		Move = false
	end
end

function Punch()
	if CurrentStand == nil then
		return
	end
	Move = true
	NormalPunch = true
	local WalkSpeed = Hum.WalkSpeed
	if TimeAccelerating == false then
		Hum.WalkSpeed = 9
	end
	for i = 0,1,0.165*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(35.008), math.rad(0.172), math.rad(-1.547)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.055, -0.008, -0.009) * CFrame.Angles(math.rad(2.75), math.rad(5.386), math.rad(14.037)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.977, 0.511, -0.028) * CFrame.Angles(math.rad(-3.037), math.rad(3.151), math.rad(-12.662)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.435, -0.129, 0.287) * CFrame.Angles(math.rad(156.188), math.rad(60.103), math.rad(129.145)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.137, 0.072, 0.013) * CFrame.Angles(math.rad(-2.005), math.rad(61.249), math.rad(81.074)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.573), math.rad(7.678)), i)
	end
	CreateSound(138097048, CurrentStand.PrimaryPart, 6.5, math.random(97,108)/100, 0, false, false, "Woosh")
	coroutine.resume(coroutine.create(function()
		wait(0.06)
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(35,50), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Punch", Color3.fromRGB(255, 255, 255))
	end))
	for i = 0,1,0.1*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(33.289), math.rad(-11.631), math.rad(-18.908)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(11.918), math.rad(17.704), math.rad(12.089)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.971, 0.512, -0.238) * CFrame.Angles(math.rad(-10.6), math.rad(13.522), math.rad(-11.173)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.351, 0.091, -0.295) * CFrame.Angles(math.rad(-15.47), math.rad(-34.779), math.rad(-105.482)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.145, 0.078, 0.013) * CFrame.Angles(math.rad(-30.309), math.rad(-14.897), math.rad(5.157)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-24.465), math.rad(4.183), math.rad(25.783)), i)
	end
	for i = 0,1,0.2*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(35.008), math.rad(0.172), math.rad(-1.547)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.055, -0.008, -0.009) * CFrame.Angles(math.rad(2.75), math.rad(5.386), math.rad(14.037)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.977, 0.511, -0.028) * CFrame.Angles(math.rad(-3.037), math.rad(3.151), math.rad(-12.662)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.435, -0.129, 0.287) * CFrame.Angles(math.rad(156.188), math.rad(60.103), math.rad(129.145)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.137, 0.072, 0.013) * CFrame.Angles(math.rad(-2.005), math.rad(61.249), math.rad(81.074)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.573), math.rad(7.678)), i)
	end
	NormalPunch = false
	if TimeAccelerating == false then
		Hum.WalkSpeed = WalkSpeed
	end
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function StrongPunch()
	if CurrentStand == nil then
		return
	end
	Move = true
	StrongPunching = true
	local WalkSpeed = Hum.WalkSpeed
	if TimeAccelerating == false then
		Hum.WalkSpeed = 7
	end
	for i = 0,1,0.15*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(35.008), math.rad(0.172), math.rad(-1.547)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.055, -0.008, -0.009) * CFrame.Angles(math.rad(2.75), math.rad(5.386), math.rad(14.037)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.977, 0.511, -0.028) * CFrame.Angles(math.rad(-3.037), math.rad(3.151), math.rad(-12.662)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.571, -0.22, 0.493) * CFrame.Angles(math.rad(152.922), math.rad(46.238), math.rad(119.462)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.306, 0.057, 0.008) * CFrame.Angles(math.rad(2.807), math.rad(66.349), math.rad(84.74)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.573), math.rad(7.678)), i)
	end
	coroutine.resume(coroutine.create(function()
		wait(0.06)
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), "Instant Kill", Vector3.new(4.2,3.4,4), 0.35, true, "Slice", 2319521125, "Strong", Color3.fromRGB(255, 255, 255))
	end))
	CreateSound(147722227, CurrentStand.Head, 6.5, math.random(97,108)/100, 0.15, false, false, "Air Woosh")
	for i = 0,1,0.029*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(33.289), math.rad(-11.631), math.rad(-18.908)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(11.918), math.rad(17.704), math.rad(12.089)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.971, 0.512, -0.238) * CFrame.Angles(math.rad(-10.6), math.rad(13.522), math.rad(-11.173)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.615, 0.279, -0.164) * CFrame.Angles(math.rad(-9.683), math.rad(-21.772), math.rad(-98.721)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.145, 0.078, 0.013) * CFrame.Angles(math.rad(-30.309), math.rad(-14.897), math.rad(5.157)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-24.465), math.rad(4.183), math.rad(25.783)), i)
	end
	for i = 0,1,0.2*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(35.008), math.rad(0.172), math.rad(-1.547)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.055, -0.008, -0.009) * CFrame.Angles(math.rad(2.75), math.rad(5.386), math.rad(14.037)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.977, 0.511, -0.028) * CFrame.Angles(math.rad(-3.037), math.rad(3.151), math.rad(-12.662)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.571, -0.22, 0.493) * CFrame.Angles(math.rad(152.922), math.rad(46.238), math.rad(119.462)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.306, 0.057, 0.008) * CFrame.Angles(math.rad(2.807), math.rad(66.349), math.rad(84.74)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.573), math.rad(7.678)), i)
	end
	StrongPunching = false
	if TimeAccelerating == false then
		Hum.WalkSpeed = WalkSpeed
	end
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function TimeWave()
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.." Shockwave Effect") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.." Shockwave Effect"]:Destroy()
		end
		local Copy = WaveScript:Clone()
		Copy.Name = StandName.." Shockwave Effect"
		Copy.StandName.Value = StandName
		Copy.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Copy.Disabled = false
		game:GetService("Debris"):AddItem(Copy, TimeAccelerateSeconds)
	end
	CreateSound(3782476462, Character, 3, 1, 0, false, false, "Shockwave")
end

function StandJump()
	if CurrentStand == nil then
		return
	end
	if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
		return
	end
	for i = 1, 3 do
		local EffectPart = Instance.new("Part")
		EffectPart.Anchored = true
		EffectPart.Transparency = 1
		EffectPart.Size = Vector3.new(1,1,1)
		EffectPart.CFrame = RLeg.CFrame
		EffectPart.Parent = Character
		game:GetService("Debris"):AddItem(EffectPart, 1.5)
		CreateEffect(EffectPart, "Slice", Color3.fromRGB(127, 127, 127))
	end
	local Bod = Instance.new("BodyPosition",Root)
	Bod.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	Bod.Position = Root.CFrame * CFrame.new(0,80,-80).p
	wait(0.1)
	Bod:Destroy()
end

function DodgeAnimation()
	if Character:FindFirstChild("GotHitButNot") then
		Character.GotHitButNot:Destroy()
	end
	local RandomDirection = math.random(1,2)
	if Hum.RigType ~= Enum.HumanoidRigType.R15 then
		if RandomDirection == 1 then
			for i = 0,1,0.15 do
				game:GetService("RunService").RenderStepped:Wait()
				RJ.C0 = RJ.C0:Lerp(AnimDefaults.tors*CFrame.new(-2.628, 1.074, 0) * CFrame.Angles(0, 0, math.rad(48)), 0.25)
			end
			for i = 0,1,0.25 do
				game:GetService("RunService").RenderStepped:Wait()
				RJ.C0 = RJ.C0:Lerp(AnimDefaults.tors, 0.33)
			end
		else
			for i = 0,1,0.15 do
				game:GetService("RunService").RenderStepped:Wait()
				RJ.C0 = RJ.C0:Lerp(AnimDefaults.tors*CFrame.new(3.574, 1.32, 0) * CFrame.Angles(0, 0, math.rad(-48)), 0.25)
			end
			for i = 0,1,0.25 do
				game:GetService("RunService").RenderStepped:Wait()
				RJ.C0 = RJ.C0:Lerp(AnimDefaults.tors, 0.33)
			end
		end
	end
end

function Pose()
	if CurrentStand == nil then
		return
	end
	if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
		return
	end
	Move = true
	if Character:FindFirstChild("Animate") then
		Character.Animate.Disabled = true
	end
	CreateSound(3307804819, Torso, 3.5, 1, 0, true, true, "MIH Theme")
	local i = 0.12
	coroutine.wrap(function()
		wait(0.5)
		Lock(Character)
	end)()
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		if Hum.RigType == Enum.HumanoidRigType.R6 then
			RJ.C0 = RJ.C0:Lerp(AnimDefaults.tors0*CFrame.Angles(0, math.rad(-6.016), math.rad(28.992)), i)
			LAJ.C0 = LAJ.C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-1.833), math.rad(41.425), math.rad(-92.647)), i)
			LLJ.C0 = LLJ.C0:Lerp(AnimDefaults.lleg*CFrame.new(0.091, -0.07, 0.042) * CFrame.Angles(math.rad(-3.151), math.rad(11.803), math.rad(1.49)), i)
			RAJ.C0 = RAJ.C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-9.855), math.rad(39.19), math.rad(85.313)), i)
			RLJ.C0 = RLJ.C0:Lerp(AnimDefaults.rleg*CFrame.new(-0.043, 0.009, 0.078) * CFrame.Angles(math.rad(-10.428), math.rad(-19.996), math.rad(1.948)), i)
			Neck.C0 = Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(2.063), math.rad(5.844), math.rad(-10.027)), i)
		end
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-5, 1.5, -1.25), 0.23)
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(15.642), math.rad(5.042), math.rad(32.773)), 0.23)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-6.303), math.rad(0.115), math.rad(-2.406)), 0.23)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-7.334), math.rad(0.172), math.rad(-2.807)), 0.23)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.018, 0.082, 0.047) * CFrame.Angles(math.rad(-13.694), math.rad(3.094), math.rad(-111.383)), 0.23)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.439, 0, 0.029) * CFrame.Angles(math.rad(-26.643), math.rad(9.798), math.rad(99.294)), 0.23)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(-17.418), math.rad(5.329), math.rad(-14.84)), 0.23)
	until Posing == false
	Unlock(Character)
	if Character:FindFirstChild("Animate") then
		if Hum.RigType == Enum.HumanoidRigType.R6 then
			RJ.C0 = AnimDefaults.tors0
			LAJ.C0 = AnimDefaults.larm
			LLJ.C0 = AnimDefaults.lleg
			RAJ.C0 = AnimDefaults.rarm
			RLJ.C0 = AnimDefaults.rleg
			Neck.C0 = AnimDefaults.head
		end
		Character.Animate.Disabled = false
	end
	if Torso:FindFirstChild("MIH Theme") then
		Torso["MIH Theme"]:Destroy()
	end
	Move = false
end

function AttackTemplate()
	if CurrentStand == nil then
		return
	end
	Move = true
	for i = 0,1,0.165*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*0, i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*0, i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*0, i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*0, i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*0, i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*0, i)
	end
	Move = false
end

Mouse.Button1Down:Connect(function()
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value ~= Player.Name then
			return
		end
	end
	if Move == false then
		Punch()
	end
end)

Mouse.KeyDown:Connect(function(Key)
	if Key ~= "t" then
		if workspace:FindFirstChild("IsTimeStopped") then
			if workspace.IsTimeStopped.Value ~= Player.Name then
				return
			end
		end
	elseif Key == "t" and workspace:FindFirstChild("IsTimeStopped") then
		TimeAccelerate()
		return
	end
	if Key == "q" and Move == false then
		Stand()
	end
	if Key == "e" and Move == false then
		BarrageDown = true
		Barrage(30, false, 147722227, 0.15)
	end
	if Key == "t" and Move == false then
		if workspace:FindFirstChild("IsTimeAccelerating") then
			if workspace.IsTimeAccelerating.Value ~= Player.Name then
				return
			end
		end
		if TimeAccelerating == true then
			TimeResume()
		else
			TimeAccelerate()
		end
	end
	if Key == "x" and Move == false then
		Slit()
	end
	if Key == "f" and Move == false then
		KnifeThrow()
	end
	if Key == "r" and Move == false then
		StrongPunch()
	end
	if Key == "z" and Move == false then
		StandJump()
	end
	if Key == "g" and CurrentStand ~= nil then
		if Move == true and Posing == false then
			return
		end
		if Posing == false then
			if CurrentStand == nil then
				return
			end
			if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
				return
			end
			Posing = true
			Move = true
			Pose()
		else
			Posing = false
		end
	end
end)

Mouse.KeyUp:Connect(function(Key)
	if Key == "e" then
		BarrageDown = false
	end
end)

function DeSpawn()
	coroutine.resume(coroutine.create(function()
		while script.Parent ~= nil do
			game:GetService("RunService").RenderStepped:Wait()
			Move = true
			BarrageDown = false
		end
	end))
	if MoveList ~= nil then
		MoveList:Destroy()
	end
	if Clock ~= nil then
		Clock:Destroy()
	end
	if TimeAccelerating == true then
		TimeResume()
	end
	if CurrentStand ~= nil then
		pcall(Stand)
	end
	wait(0.1)
	script:Destroy()
end

Hum.Died:Connect(function()
	DeSpawn()
end)

Character.Changed:Connect(function(Parent)
	if not Character:IsDescendantOf(workspace) then
		DeSpawn()
	end
end)

Player.CharacterAdded:Connect(function()
	DeSpawn()
end)

game:GetService("RunService").RenderStepped:Connect(function()
	Sine = Sine + 1
	Hum.PlatformStand = false
	if Hum.Health ~= Hum.MaxHealth then
		Hum.Health = Hum.Health + 0.15
	end
	if TimeAccelerating == true then
		AccelerateSeconds = AccelerateSeconds + 1
		AttackSpeed = AttackSpeed + 0.00075
		AccelerateWalkSpeed = AccelerateWalkSpeed + 0.1285
		Hum.WalkSpeed = AccelerateWalkSpeed
		Hum.Health = Hum.Health + AccelerateSeconds/100
		game:GetService("Lighting"):SetMinutesAfterMidnight(game:GetService("Lighting"):GetMinutesAfterMidnight()+AccelerateSeconds/230)
	end
	if Clock and AllowClockMovment == true then
		Clock.Clock.MainArrow.Rotation = Clock.Clock.MainArrow.Rotation + 5
		Clock.Clock.SecondaryArrow.Rotation = Clock.Clock.SecondaryArrow.Rotation + 0.85
		if Clock.Clock.MainArrow.Rotation > 359 then
			CreateClientSound(850256806, Character, 3.5, 1.49, 1, 1.7)
			Clock.Clock.MainArrow.Rotation = 0
			ClockTime = ClockTime - 1
			Clock.Clock.Count.Text = tostring(ClockTime)
			ClockFade()
		end
		if Clock.Clock.SecondaryArrow.Rotation > 359 then
			Clock.Clock.SecondaryArrow.Rotation = 0
		end
	end
	if Move == true and CurrentStand ~= nil then
		if (BarrageDown == true or StrongPunching == true or NormalPunch == true) and PunchAfterBarrage == false then
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.75), 0.23)
		end
	end
	if Move == false then
		if Anim == "Idle" then
			if CurrentStand ~= nil then
				CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-3.5, 1.8, 3), 0.23)
				CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 1.5*math.sin(Sine/75))*CFrame.Angles(0, 0, math.rad(-22.002)), 0.23)
				CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.38), 0, 0), 0.23)
				CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.818), 0, 0), 0.23)
				CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.4, -0.12, 0.04) * CFrame.Angles(math.rad(-36.268), math.rad(-30.653), math.rad(-58.499)), 0.23)
				CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.41, -0.08, 0) * CFrame.Angles(math.rad(-6.188), math.rad(50.306), math.rad(53.915)), 0.23)
				CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(3.953), math.rad(22.861), math.rad(16.1)), 1)
			end
		end
	end
	if Character:FindFirstChild("GotHitButNot") then
		Character.GotHitButNot:Destroy()
		DodgeAnimation()
	end
	if Character:FindFirstChild("StandValue") == nil then
		local StandValue = Instance.new("StringValue")
		StandValue.Name = "StandValue"
		StandValue.Value = StandName
		StandValue.Parent = Character
	end
end)

while wait(2.95) do
	if TimeAccelerating == true then
		TimeWave()
	end
end