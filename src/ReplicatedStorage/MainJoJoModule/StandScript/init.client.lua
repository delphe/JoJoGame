-->Made By XDavodioX & edited by delphedwin<--

--=(Category = Fun, Action, Quick)=--

warn("Huge Credit to XDavodioX for the reference script & livingoreo712 for many of the models! \nGo check them out!")

script:WaitForChild("KCCharacter")
script:WaitForChild("KCTransparentChar")
script:WaitForChild("KCPlayerTransparency")
script:WaitForChild("KCCleaner")
script:WaitForChild("EffectGui")
script:WaitForChild("KCParts")
script:WaitForChild("LeapGui")
local OriginalGui = script["EffectGui"]:Clone()
local OriginalLeap = script["LeapGui"]:Clone()
local OriginalTranspanrencyScript = script["KCTransparentChar"]:Clone()
local OriginalTranspanrencyCleaner = script["KCPlayerTransparency"]:Clone()
local OriginalCleaner = script["KCCleaner"]:Clone()
local OriginalKCChar = script["KCCharacter"]:Clone()
local OriginalKCParts = script["KCParts"]:Clone()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OrgSword = ReplicatedStorage:WaitForChild("Sword")
local CorrectionScript = ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild("ColorCorrection"):Clone()
local CorrectionRemoveScript =ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild("RemoveColorCorrection"):Clone()
local SoundStopScript = ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild("TimeStopSounds"):Clone()
local SoundResumeScript =  ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild("TimeResumeSounds"):Clone()
local OriginalSHA = ReplicatedStorage:WaitForChild("SheerHeartAttack")
local enableMovesGuiFunction = ReplicatedStorage:WaitForChild("EnableMovesGuiFunction")
local ContextActionService = game:GetService("ContextActionService")

local Player = game:GetService("Players").LocalPlayer
local StandName = Player:WaitForChild("stand").Value
local OriginalStand = ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild(StandName):Clone()
local OriginalTree = script["Tree"]:Clone()
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

local ability = {
	CanStab = false,
	CanTimeBoost = false,
	CanTimeErase = false,
	CanTimeStop = false,
	CanTimeLeap = false,
	CanTimeLeapMore = false,
	CanThrowKnife = false,
	CanThrowKnives = false,
	CanHealSelf = false,
	CanHealOthers = false,
	CanStarFinger = false,
	CanBarrageCombo = false,
	CanShearHeartAttack = false,
	CanGrowTree = false,
	CanCreateWall = false,
	CanIncreaseSpeed = false,
	CanIncreaseSpeedMore = false,
	CanDodge = false,
	CanStandJump = false,
}


if StandName == "FLAVR" then
	ability["CanTimeBoost"] = true
	ability["CanTimeErase"] = true
	ability["CanTimeStop"] = true
elseif StandName == "FLAVD" then
	ability["CanStab"] = true
	ability["CanTimeBoost"] = true
	ability["CanTimeErase"] = true
	ability["CanTimeStop"] = true
	ability["CanTimeLeap"] = true
	ability["CanTimeLeapMore"] = true
	ability["CanThrowKnife"] = true
	ability["CanThrowKnives"] = true
	ability["CanHealSelf"] = true
	ability["CanHealOthers"] = true
	ability["CanStarFinger"] = true
	ability["CanBarrageCombo"] = true
	ability["CanShearHeartAttack"] = true
	ability["CanGrowTree"] = true
	ability["CanCreateWall"] = true
	ability["CanIncreaseSpeed"] = true
	ability["CanIncreaseSpeedMore"] = true
	ability["CanDodge"] = true
	ability["CanStandJump"] = true
end

for key,val in next, ability do
	local boolItem
	if Character:FindFirstChild(key) then
		boolItem = Character:FindFirstChild(key)
	else
		boolItem = Instance.new("BoolValue")
		boolItem.Name = key
		boolItem.Parent = Character
	end
	boolItem.Value = val
end

enableMovesGuiFunction:Invoke()

local MoveList = Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("MoveList")
local KeyboardMoveList = Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("KeyboardMoveList")
local Clock = Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("ClockGui")

local AttackSpeed = 1
local Sine = 0

local CurrentStand = nil
local TimeStopSeconds = 12 -- Time Stop Time - In seconds
local TimeStopImmunity = 7 -- Time Stop Immunity when someone else Time Stops - In seconds
local Move = false
local BarrageDown = false
local BarrageSelfHeal = false
local Anim = "Idle"
local TimeAccelerating = false
local TimeStopped = false
local TimeErased = false
local TimeStopHits = {}
local StrongEUF = false
local NormalPunch = false
local StarFingerMove = false
local Speeding = false
local PunchAfterBarrage = false
local AllowClockMovment = false
local ClockTime = 0
local AccelerateSeconds = 0
local OgAttackSpeed = 0
local AccelerateWalkSpeed = 0
local TimeAccelerateSeconds = 30 
local TSConnections = {}
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
local defaultWalkingSpeed = Hum.WalkSpeed

-- Thanks to Chrysophrase for the GetPartsInArea function

function CheckIfInTable(Table,Value)
	for _,v in pairs(Table) do
		if v == Value then
			return true
		end
	end
end

function GetPartsInArea(PropertyTable,IgnoreCharacter,Raw)
	local Table = {}
	local Area = Instance.new("Part",Root)
	Area.CFrame = PropertyTable.CFrame or Root.CFrame
	Area.Size = PropertyTable.Size or Vector3.new(3,3,3)
	Area.Anchored = true
	Area.CanCollide = false
	Area.Transparency = 1
	local hit = {}
	if PropertyTable.Region == true then
		Area.CFrame = CFrame.new(PropertyTable.CFrame.p)
		local __ = Region3.new(Area.Position-(Area.Size/2),Area.Position+(Area.Size/2))
		hit = workspace:FindPartsInRegion3(__,Root,math.huge)
	elseif PropertyTable.Magnitude == true then
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and (v.Position - Area.Position).Magnitude < (PropertyTable.Range or 30) then
				table.insert(hit,v)
			end
		end
	else
		local __ = Area.Touched:Connect(function() end)
		hit = Area:GetTouchingParts()
		__:Disconnect()
	end
	for _,v in pairs(hit) do
		if v.Parent and (not v:IsDescendantOf(Character) or IgnoreCharacter == false) then
			if not Raw then
				if v.Parent and not CheckIfInTable(Table,v.Parent) and v.Parent:FindFirstChildOfClass("Humanoid") then
					table.insert(Table,v.Parent)
				end
			else
				table.insert(Table,v)
			end
		end
	end
	Area:Destroy()
	return Table
end


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
		NEWCLIENTSOUNDDATA = ReplicatedStorage:WaitForChild("MainJoJoModule"):WaitForChild("ClientSound"):Clone()
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
				FadeArm.StandArm.Transparency = FadeArm.StandArm.Transparency + 0.06
				for Index,Child in next, FadeArm.StandArm:GetChildren() do
					if Child:IsA("Decal") then
						Child.Transparency = Child.Transparency + 0.06
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
		if Humanoid.Health < 17 and Humanoid.Health > 0 then
			Humanoid.Health = Humanoid.Health + 16
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
		if IsAHumanoid(Toucher) and IsAHumanoid(Toucher) ~= Character and IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid").Health > 0 and IsAHumanoid(Toucher):FindFirstChild("JustGotHit") == nil then
			game:GetService("Debris"):AddItem(HB, 0.05)
			local Humanoid = IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid")
			local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
			local Val = Instance.new("BoolValue")
			Val.Name = "JustGotHit"
			Val.Value = true
			Val.Parent = Humanoid.Parent
			game:GetService("Debris"):AddItem(Val, 0.05)

			if HitType == "Healing" then
				CreateSound(3378924410, Toucher, 3, math.random(97,105)/100, 0, false, false, "Heal SFX")
				coroutine.resume(coroutine.create(function()
					CreateEffect(Toucher, Effect, EffectColor)
				end))
				Humanoid.Health = Humanoid.Health + Damage
				CreatePopUpGui(Toucher, "Jump", "+"..tostring(Damage), Color3.fromRGB(0, 199, 0))
			elseif TimeStopped == false then
				if Humanoid.Parent:FindFirstChild("CanDodge") then
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
				--TODO: fix sound. Original sound was 1382489817. Replace all 1382489817 in this script
				CreateSound(1382489817, Toucher, 5.35, math.random(95,113)/100, 0.145, false, false, "Hit SFX")
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
					Humanoid:TakeDamage(Damage*1.5)
					CreatePopUpGui(Toucher, "Jump", tostring(Damage*1.5), Color3.fromRGB(188, 0, 0))
				end
				HitEffect(Toucher, Humanoid.Parent, CurrentStand.RootPart.CFrame, HitType)

			else
				if Humanoid.Parent:FindFirstChild("CanDodgeInTS") then
					if Humanoid.Parent.CanDodgeInTS.Value == true then
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
				table.insert(TimeStopHits, {Humanoid, Damage*1.5, 1382489817, Effect, Color3.fromRGB(9, 137, 207), CurrentStand.RootPart.CFrame, HitType})
			end
		end
	end)
	game:GetService("Debris"):AddItem(HB, DebrisTime)
	return HB
end

function Stand()
	Move = true
	if CurrentStand == nil then
		CurrentStand = OriginalStand:Clone()
		CreateSound(1382489817, Head, 3, 1, 0.12, false, false, "Stand Call")
		--for Index,Child in next, CurrentStand:GetDescendants() do
		--	if Child:IsA("BasePart") or Child:IsA("Decal") then
		--		Child.Transparency = 1
		--	end
		--end
		CurrentStand:SetPrimaryPartCFrame(Root.CFrame)
		CurrentStand.Parent = Head
		--for Index,Child in next, CurrentStand:GetDescendants() do
		--	if (Child:IsA("BasePart") or Child:IsA("Decal")) and Child.Name ~= "RootPart" and Child.Name ~= "Left Leg"and Child.Name ~= "Left Arm" and Child.Name ~= "Right Leg" and Child.Name ~= "Right Arm" and Child.Name ~= "StandTorso" and Child.Name ~= "Head" then
		--		coroutine.resume(coroutine.create(function(Part)
		--			for i = 1, 25 do
		--				game:GetService("RunService").RenderStepped:Wait()
		--				Part.Transparency = Part.Transparency - 0.04
		--			end
		--			Part.Transparency = 0
		--		end), Child)
		--	end
		--end
		CreateSound(463010917, CurrentStand.PrimaryPart, 2.1, math.random(95,108)/100, 0, false, false, "Stand Appear")
		for i = 0,1,0.02 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), i)
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 0.8*math.sin(Sine/75)), 1)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.38), 0, 0), 1)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.818), 0, 0), 1)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-8.136), 0, 0), 1)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-12.089), 0, 0), 1)
		end
	else
		for Index,Child in next, CurrentStand:GetDescendants() do
			if Child:IsA("BasePart") or Child:IsA("Decal") and Child.Name ~= "Left Leg"and Child.Name ~= "Left Arm" and Child.Name ~= "Right Leg" and Child.Name ~= "Right Arm" and Child.Name ~= "StandTorso" and Child.Name ~= "Head" then
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

function BarragePunch()
	if CurrentStand == nil then
		return
	end
	Move = true
	local Before = AttackSpeed
	AttackSpeed = AttackSpeed + (AttackSpeed/7)
	StrongEUF = true
	local ORA = CreateSound(2404992475, CurrentStand.Head, 6.2, 1, 0.29, false, false, "Barrager")
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 10
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
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "BarragePunch", Color3.fromRGB(255, 255, 255))
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
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "BarragePunch", Color3.fromRGB(255, 255, 255))
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
	until ORA.TimePosition > 2.9
	ORA:Destroy()
	CreateSound(2553990414, CurrentStand.Head, 6.5, math.random(98,102)/100, 0.1, false, false, "Strong Shout")
	AttackSpeed = Before
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
	for i = 0,1,0.0315*AttackSpeed/0.75 do
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
	StrongEUF = false
	Hum.WalkSpeed = WalkSpeed
	AttachmentLeft1:Destroy()
	AttachmentLeft2:Destroy()
	AttachmentRight1:Destroy()
	AttachmentRight2:Destroy()
	TrailLeft:Destroy()
	TrailRight:Destroy()
	Move = false
end

function Barrage(Times, NeutralStop, BarrageSFX, BarrageType)
	if CurrentStand == nil then
		return
	end
	Move = true
	local Healing = false
	local HitType = "Barrage"
	if BarrageType == "healOthers" or BarrageType == "healSelf" then
		Healing = true
		HitType = "Healing"
	end
	if BarrageType == "healSelf" then
		BarrageSelfHeal = true
	end
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 19
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
	local Sword = OrgSword:Clone()
	local BarrageSoundName
	if BarrageType == "sword" then
		BarrageSoundName = "Stand Rush"
		coroutine.resume(coroutine.create(function()
			wait(0.09)
			Sword.Parent = CurrentStand
			Sword:SetPrimaryPartCFrame(CurrentStand["Right Arm"].CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, 0, math.rad(90)))
			Glue(Sword.PrimaryPart, CurrentStand["Right Arm"])
		end))
	elseif BarrageType == "healOthers" then
		--TODO: find good sound to use
	elseif BarrageType == "healSelf" then
		--TODO: find good sound to use
	else
		BarrageSoundName = "Barrage Shout"
	end
	local BarrageSound = CreateSound(BarrageSFX, CurrentStand.PrimaryPart, 4, 1, 0, not NeutralStop, not NeutralStop, BarrageSoundName)
	BarrageSound.Ended:Connect(function()
		if NeutralStop == true then
			Done = true
		end
	end)
	if NeutralStop == false and Healing then
		coroutine.resume(coroutine.create(function()
			while BarrageSound do
				game:GetService("RunService").RenderStepped:Wait()
				if BarrageSound.TimePosition > 3.9 then
					BarrageSound:Pause()
					BarrageSound.TimePosition = 1.3
					BarrageSound:Resume()
				end
			end
		end))
	end
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		Repeat = Repeat - 1
		if BarrageType == "healSelf" then
			local Ran = math.random(4,9)
			coroutine.resume(coroutine.create(function()
				CreateEffect(Root, "Slice", Color3.fromRGB(20, 255, 20))
				CreateEffect(Root, "PunchWave", Color3.fromRGB(255, 255, 255))
			end))
			Hum.Health = Hum.Health + (Ran)
			CreatePopUpGui(Root, "Jump", "+"..tostring(Ran), Color3.fromRGB(20, 255, 20))
		else
			CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, HitType, Color3.fromRGB(255, 255, 255))
		end
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

		if BarrageType == "healSelf" then
			local Ran = math.random(4,9)
			coroutine.resume(coroutine.create(function()
				CreateEffect(Root, "Slice", Color3.fromRGB(20, 255, 20))
				CreateEffect(Root, "PunchWave", Color3.fromRGB(255, 255, 255))
			end))
			Hum.Health = Hum.Health + (Ran)
			CreatePopUpGui(Root, "Jump", "+"..tostring(Ran), Color3.fromRGB(20, 255, 20))
		else
			CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, HitType, Color3.fromRGB(255, 255, 255),Healing)
		end
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
	BarrageSound:Destroy()
	Sword:Destroy()
	Hum.WalkSpeed = WalkSpeed
	AttachmentLeft1:Destroy()
	AttachmentLeft2:Destroy()
	AttachmentRight1:Destroy()
	AttachmentRight2:Destroy()
	TrailLeft:Destroy()
	TrailRight:Destroy()
	BarrageSelfHeal = false
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

function AddingStopper(Child)
	local ChildAdderConnection = Child.ChildAdded:Connect(function(Child2)
		if Child2:IsA("BasePart") then
			StopObject(Child2)
		else
			AddingStopper(Child2)
		end
	end)
	table.insert(TSConnections, ChildAdderConnection)
end

function StopObject(Child)
	local AnchoredValue = Instance.new("BoolValue")
	AnchoredValue.Value = Child.Anchored
	AnchoredValue.Name = StandName.."'s Anchored Value"
	AnchoredValue.Parent = Child
	local OriginalCFrame = Child.CFrame
	Child.Anchored = true
	local AnchoredConnection = Child:GetPropertyChangedSignal("Anchored"):Connect(function()
		Child.Anchored = true
	end)
	table.insert(TSConnections, AnchoredConnection)
	local CFrameConnection = Child:GetPropertyChangedSignal("CFrame"):Connect(function()
		Child.CFrame = OriginalCFrame
	end)
	table.insert(TSConnections, CFrameConnection)
	local ChildAdderConnection = Child.ChildAdded:Connect(function(Child2)
		if Child2:IsA("BasePart") then
			StopObject(Child2)
		else
			AddingStopper(Child2)
		end
	end)
	table.insert(TSConnections, ChildAdderConnection)
end

function CheckObject(Child)
	for Index, Child2 in next, Child:GetDescendants() do
		if Child2:IsA("BasePart") then 
			StopObject(Child2)
		else
			AddingStopper(Child2)
		end
	end
end

function TimeLeap(frames)
	Move = true
	local Gui = OriginalLeap:Clone()
	Gui.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Gui.Enabled = true
	Gui.GlitchScript.Disabled = false
	game:GetService("Debris"):AddItem(Gui, 0.3)
	Root.CFrame = Root.CFrame * CFrame.new(0, 0, -1*frames)
	CreateSound(3381874860, Torso, 4, 1, 0, false, false, "Time Leap SFX")
	Move = false
end

function TimeStop()
	if CurrentStand == nil then
		return
	end
	if (Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air) and Hum.Sit == false then
		return
	end
	Move = true
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value == Player.Name then
			workspace.IsTimeStopped:Destroy()
		end
	end
	local Val = Instance.new("StringValue")
	Val.Value = Player.Name
	Val.Name = "IsTimeStopped"
	Val.Parent = workspace
	ClockTime = TimeStopSeconds
	Clock.Clock.MainArrow.Rotation = 0.015
	Clock.Clock.Count.Text = tostring(ClockTime)
	Clock.Enabled = true
	Lock(Character)
	local StopAudio = CreateSound(1382489817, Head, 7.5, 1, 0.113, false, true, "Stop Shout")
	local Ended = false
	StopAudio.Ended:Connect(function()
		Ended = true
	end)
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.5), 0.3)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-4.641), 0, 0), 0.5)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.875), 0, 0), 0.5)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-4.011), 0, math.rad(-84.798)), 0.5)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-6.417), 0, 0), 0.5)
	until Ended == true
	TimeStopped = true
	StopAudio:Destroy()
	CreateSound(840567549, CurrentStand.Head, 6, 1, 0.15, false, false, "Time Stop")
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Resumer") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Resumer"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Stopper") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Stopper"]:Destroy()
		end
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
		local Sounder = SoundStopScript:Clone()
		Sounder.Name = StandName.."'s Sound Stopper"
		Sounder.StandName.Value = StandName
		Sounder.Char.Value = Character
		Sounder.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Sounder.Disabled = false
		game:GetService("Debris"):AddItem(Sounder, TimeStopSeconds)
		game:GetService("Debris"):AddItem(Copy, TimeStopSeconds)
	end
	coroutine.resume(coroutine.create(function()
		for Index, Child in next, workspace:GetDescendants() do
			if Child:IsA("BasePart") and not Child:IsDescendantOf(Character) then
				if IsAHumanoid(Child) then
					local TsChar = IsAHumanoid(Child)
					if TsChar:FindFirstChild("IsTSImmune") then
						local Value = TsChar["IsTSImmune"]
						local ValueConnection = Value:GetPropertyChangedSignal("Value"):Connect(function()
							if Value.Value == false then
								CheckObject(Child)
								StopObject(Child)
							end
						end)
						table.insert(TSConnections, ValueConnection)
					else
						CheckObject(Child)
						StopObject(Child)
					end
				else
					CheckObject(Child)
					StopObject(Child)
				end
			elseif not Child:IsA("BasePart") and not Child:IsDescendantOf(Character) and not Child == Character then
				if IsAHumanoid(Child) then
					local TsChar = IsAHumanoid(Child)
					if TsChar:FindFirstChild("IsTSImmune") then
						local Value = TsChar["IsTSImmune"]
						local ValueConnection = Value:GetPropertyChangedSignal("Value"):Connect(function()
							if Value.Value == false then
								CheckObject(Child)
								AddingStopper(Child)
							end
						end)
						table.insert(TSConnections, ValueConnection)
					else
						CheckObject(Child)
						AddingStopper(Child)
					end
				else
					CheckObject(Child)
					AddingStopper(Child)
				end
			end
		end

		local WorkspaceConnection = workspace.ChildAdded:Connect(function(Child)
			if Child:IsA("BasePart") and not Child:IsDescendantOf(Character) then
				CheckObject(Child)
				StopObject(Child)
			elseif not Child:IsA("BasePart") and not Child:IsDescendantOf(Character) then
				CheckObject(Child)
				AddingStopper(Child)
			end
		end)
		table.insert(TSConnections, WorkspaceConnection)
	end))
	coroutine.resume(coroutine.create(function()
		for p = 1, 4 do
			local BillboardGui = Instance.new("BillboardGui")
			local ImageLabel = Instance.new("ImageLabel")
			BillboardGui.Name = "TimeStopEffect"
			BillboardGui.Parent = CurrentStand.PrimaryPart
			BillboardGui.Size = UDim2.new(2,0,2,0)
			BillboardGui.Active = true
			BillboardGui.LightInfluence = 0
			BillboardGui.Enabled = true
			BillboardGui.AlwaysOnTop = true
			ImageLabel.Name = "Ring"
			ImageLabel.Parent = BillboardGui
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.ImageTransparency = 0
			ImageLabel.Size = UDim2.new(1,0,1,0)
			ImageLabel.ImageColor3 = Color3.fromRGB(43,0,65)
			ImageLabel.BackgroundColor3 = Color3.new(1,1,1)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.BorderColor3 = Color3.new(1,1,1)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Image = "rbxassetid://294737298"
			coroutine.wrap(function()
				for i = 1, 20 do
					ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.05
					BillboardGui.Size = UDim2.new(2+(i*1.5*p),0,2+(i*1.5*p),0)
					wait(0.01)
				end
				for i = 20, 1, -1 do
					ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.05
					BillboardGui.Size = UDim2.new(2+(i*1.5*p),0,2+(i*1.5*p),0)
					wait(0.01)
				end
				BillboardGui:Destroy()
			end)()
		end
	end))
	AllowClockMovment = true
	coroutine.resume(coroutine.create(function()
		repeat
			game:GetService("RunService").RenderStepped:Wait()
		until ClockTime < 0 or ClockTime == 0 or TimeStopped == false
		if TimeStopped == true then
			if CurrentStand == nil then
				Stand()
			end
			TimeResume()
		end
	end))
	Unlock(Character)
	Move = false
end

function InstantResume()
	TimeStopped = false
	AllowClockMovment = false
	ClockTime = 0
	Clock.Enabled = false
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value == Player.Name then
			workspace.IsTimeStopped:Destroy()
		end
	end
	for Index,Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Resumer") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Resumer"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Stopper") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Stopper"]:Destroy()
		end
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
		local Resumer = SoundResumeScript:Clone()
		Resumer.Name = StandName.."'s Sound Resumer"
		Resumer.StandName.Value = StandName
		Resumer.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Resumer.Disabled = false
		game:GetService("Debris"):AddItem(Resumer, 3)
		game:GetService("Debris"):AddItem(Copy, 4.5)
		for Index2, Child in next, Player:FindFirstChildOfClass("Backpack"):GetDescendants() do
			if Child:IsA("BasePart") then
				if Child:FindFirstChild(StandName.."'s Anchored Value") then
					Child.Anchored = Child[StandName.."'s Anchored Value"].Value
					Child[StandName.."'s Anchored Value"]:Destroy()
				end
			end
		end
	end
	for Index, Connection in next, TSConnections do
		Connection:Disconnect()
	end
	for Index, Child in next, workspace:GetDescendants() do
		if Child:IsA("BasePart") then
			if Child:FindFirstChild(StandName.."'s Anchored Value") then
				Child.Anchored = Child[StandName.."'s Anchored Value"].Value
				Child[StandName.."'s Anchored Value"]:Destroy()
			end
		end
		if Child:IsA("Humanoid") then
			coroutine.resume(coroutine.create(function()
				for i = 1, #TimeStopHits do
					if CheckTableWithValueIndex(TimeStopHits, Child, 1, "Value") then
						local HitTorso = Child.Parent:FindFirstChild("Torso") or Child.Parent:FindFirstChild("UpperTorso")
						local TableIndex = CheckTableWithValueIndex(TimeStopHits, Child, 1, "Index")
						Child:TakeDamage(TimeStopHits[TableIndex][2])
						if TimeStopHits[TableIndex][7] == "Strong" then
							Child.BreakJointsOnDeath = false
						end
						if TimeStopHits[TableIndex][2] == "Instant Kill" then
							HitTorso.Parent:BreakJoints()
						else
							Child:TakeDamage(TimeStopHits[TableIndex][2])
						end
						coroutine.resume(coroutine.create(function()
							CreateEffect(HitTorso, TimeStopHits[TableIndex][4], TimeStopHits[TableIndex][5])
						end))
						coroutine.resume(coroutine.create(function()
							HitEffect(HitTorso, HitTorso.Parent, TimeStopHits[TableIndex][6], TimeStopHits[TableIndex][7])
						end))
						CreateSound(TimeStopHits[TableIndex][3], HitTorso, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
						PunchAfterBarrage = false
						table.remove(TimeStopHits, TableIndex)
					end
				end
			end))
		end
	end
	TSConnections = {}
	TimeStopHits = {}
end

function StrongStab()
	if CurrentStand == nil then
		return
	end
	Move = true
	local Sword = OrgSword:Clone()
	coroutine.resume(coroutine.create(function()
		wait(0.07)
		Sword.Parent = CurrentStand
		Sword:SetPrimaryPartCFrame(CurrentStand["Right Arm"].CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, 0, math.rad(90)))
		Glue(Sword.PrimaryPart, CurrentStand["Right Arm"])
	end))
	StrongEUF = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 7
	for i = 0,1,0.105*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(0, 0, math.rad(-15.355)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.323), 0, math.rad(0.917)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.589), math.rad(-0.115), math.rad(1.776)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.024, 0.02, -0.087) * CFrame.Angles(math.rad(20.856), math.rad(14.84), math.rad(23.205)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-1.02, -0.16, 0.55) * CFrame.Angles(math.rad(-5.329), math.rad(16.043), math.rad(99.064)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(0, 0, math.rad(16.673)), i)
	end
	coroutine.resume(coroutine.create(function()
		wait(0.06)
		CreateSound(3516657180, CurrentStand.Head, 6.5, 1, 0.3, false, false, "Stab Woosh")
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), "Instant Kill", Vector3.new(4.2,3.4,4), 0.35, true, "Slice", 2319521125, "Strong", Color3.fromRGB(177, 0, 0))
	end))
	for i = 0,1,0.125*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(0, 0, math.rad(10.406)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.323), 0, math.rad(0.917)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.589), math.rad(-0.115), math.rad(1.776)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.024, 0.02, -0.087) * CFrame.Angles(math.rad(20.856), math.rad(14.84), math.rad(23.205)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.709, -0.1, -0.097) * CFrame.Angles(0, math.rad(13.235), math.rad(82.735)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(0, 0, math.rad(0.115)), i)
	end
	for i = 0,1,0.2*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(0, 0, math.rad(-15.355)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.323), 0, math.rad(0.917)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.589), math.rad(-0.115), math.rad(1.776)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.024, 0.02, -0.087) * CFrame.Angles(math.rad(20.856), math.rad(14.84), math.rad(23.205)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-1.02, -0.16, 0.55) * CFrame.Angles(math.rad(-5.329), math.rad(16.043), math.rad(99.064)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(0, 0, math.rad(16.673)), i)
	end
	Sword:Destroy()
	StrongEUF = false
	Hum.WalkSpeed = WalkSpeed
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function KnifeThrow(num)
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
		--TODO: fix sound. Used to be 166423113
		CreateSound(1382489817, CurrentStand.StandTorso, 4, 1, 0.04, false, false, "Throw SFX")
		for i = 1, num do
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

function TimeErase()
	if CurrentStand == nil then
		return
	end
	if (Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air) and Hum.Sit == false then
		return
	end
	Move = true
	if workspace:FindFirstChild("IsTimeErased") then
		if workspace.IsTimeErased.Value == Player.Name then
			workspace.IsTimeErased:Destroy()
		end
	end
	for Inded, Child in next, Character:GetDescendants() do
		if Child:IsA("BasePart") or Child:IsA("Decal") then
			local TransVal = Instance.new("NumberValue")
			TransVal.Value = Child.Transparency
			TransVal.Name = "REALTRANS"
			TransVal.Parent = Child
		end
	end
	local DVal = Instance.new("BoolValue")
	DVal.Name = "CanDodge"
	DVal.Parent = Character
	DVal.Value = true
	local Val = Instance.new("StringValue")
	Val.Value = Player.Name
	Val.Name = "IsTimeErased"
	Val.Parent = workspace
	local ClockTime = TimeStopSeconds
	Clock.Clock.MainArrow.Rotation = 0.015
	Clock.Clock.Count.Text = tostring(ClockTime)
	Clock.Enabled = true
	Lock(Character)
	local StopAudio = CreateSound(3373956700, Head, 5.5, 1, 0, false, true, "Stop Shout")
	local Ended = false
	StopAudio.Ended:Connect(function()
		Ended = true
		StopAudio:Destroy()
	end)
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		local TransparencyScript = OriginalTranspanrencyScript:Clone()
		TransparencyScript.Parent = Player:FindFirstChildOfClass("PlayerGui")
		TransparencyScript.Char.Value = Character
		TransparencyScript.Disabled = true
		spawn(function()
			wait(1.4)
			TransparencyScript.Disabled = false
		end)
	end
	local Gui = OriginalGui:Clone()
	Gui.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Gui.Enabled = true
	Gui.GlitchScript["Enabled"].Value = true
	Gui.GlitchScript.Disabled = false
	game:GetService("Debris"):AddItem(Gui, 1.54)
	local Clone1 = OriginalKCChar:Clone()
	Clone1.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Clone1.Char.Value = Character
	Clone1.Disabled = true
	local Clone2 = OriginalKCParts:Clone()
	Clone2.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Clone2.Char.Value = Character
	Clone2.Disabled = true
	spawn(function()
		wait(1.4)
		Clone1.Disabled = false
		Clone2.Disabled = false
		AllowClockMovment = true
	end)
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.5), 0.3)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-4.641), 0, 0), 0.5)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.875), 0, 0), 0.5)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-4.011), 0, math.rad(-84.798)), 0.5)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-6.417), 0, 0), 0.5)
	until Ended == true
	TimeErased = true
	coroutine.resume(coroutine.create(function()
		repeat
			game:GetService("RunService").RenderStepped:Wait()
		until ClockTime < 0 or ClockTime == 0 or TimeErased == false
		if TimeErased == true then
			if CurrentStand == nil then
				Stand()
			end
			TimeResume()
		end
	end))
	Unlock(Character)
	Move = false
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
	defaultWalkingSpeed = Hum.WalkSpeed
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

function FastTimeErase()
	if CurrentStand == nil then
		return
	end
	Move = true
	local Val = Instance.new("StringValue")
	Val.Value = Player.Name
	Val.Name = "ForceResumeTimeStop"
	if workspace:FindFirstChild("IsTimeStopped") then
		Val.Parent = game:GetService("Players")[workspace.IsTimeStopped.Value].Character
	else
		Val.Parent = workspace
	end
	game:GetService("Debris"):AddItem(Val, 0.5)
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		local Gui = OriginalGui:Clone()
		Gui.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Gui.Enabled = true
		Gui.GlitchScript["Enabled"].Value = false
		Gui.GlitchScript.Disabled = false
		game:GetService("Debris"):AddItem(Gui, 1.34)
	end
	Move = false
end

function TimeRegain()
	if CurrentStand == nil then
		return
	end
	AllowClockMovment = false
	ClockTime = 0
	Clock.Enabled = false
	Move = true
	BarrageDown = false
	if workspace:FindFirstChild("IsTimeErased") then
		if workspace.IsTimeErased.Value == Player.Name then
			workspace.IsTimeErased:Destroy()
		end
	end
	if Character:FindFirstChild("CanDodge") then
		Character.CanDodge:Destroy()
	end
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("KCTransparentChar") then
			Player:FindFirstChildOfClass("PlayerGui")["KCTransparentChar"]:Destroy()
		end
		local Clean = OriginalTranspanrencyCleaner:Clone()
		Clean.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Clean.Char.Value = Character
		Clean.Disabled = false
		game:GetService("Debris"):AddItem(Clean, 2)
	end
	if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("KCParts") then
		Player:FindFirstChildOfClass("PlayerGui")["KCParts"]:Destroy()
	end
	if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild("KCCharacter") then
		Player:FindFirstChildOfClass("PlayerGui")["KCCharacter"]:Destroy()
	end
	local Gui = OriginalGui:Clone()
	Gui.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Gui.Enabled = true
	Gui.GlitchScript["Enabled"].Value = false
	Gui.GlitchScript.Disabled = false
	local Clean = OriginalCleaner:Clone()
	Clean.Parent = Player:FindFirstChildOfClass("PlayerGui")
	Clean.Char.Value = Character
	Clean.Disabled = false
	game:GetService("Debris"):AddItem(Clean, 2)
	game:GetService("Debris"):AddItem(Gui, 1.34)
	for Index, Child in next, Character:GetDescendants() do
		if Child:IsA("BasePart") or Child:IsA("Decal") then
			if Child:FindFirstChild("REALTRANS") then
				game:GetService("Debris"):AddItem(Child.REALTRANS, 0.8)
			end
		end
	end
	TimeErased = false
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
	TimeStopped = false
	AccelerateWalkSpeed = defaultWalkingSpeed
	TimeAccelerating = false
	AttackSpeed = OgAttackSpeed
	Hum.WalkSpeed = defaultWalkingSpeed
	AccelerateSeconds = 0
	local DidSound = false
	if DidSound == false and Character and Character ~= nil and Character:IsDescendantOf(workspace) and Torso and Torso:IsDescendantOf(Character) then
		DidSound = true
		--TODO: fix sound. Used to be 864569342
		CreateSound(1382489817, Torso, 6.9, 1, 0.056, false, false, "Time Resume")
	end
	if workspace:FindFirstChild("IsTimeAccelerating") then
		if workspace.IsTimeAccelerating.Value == Player.Name then
			workspace.IsTimeAccelerating:Destroy()
		end
	end
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value == Player.Name then
			workspace.IsTimeStopped:Destroy()
		end
	end
	for Index,Player in next, game:GetService("Players"):GetPlayers() do
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Resumer") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Resumer"]:Destroy()
		end
		if Player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(StandName.."'s Sound Stopper") then
			Player:FindFirstChildOfClass("PlayerGui")[StandName.."'s Sound Stopper"]:Destroy()
		end
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
		local Resumer = SoundResumeScript:Clone()
		Resumer.Name = StandName.."'s Sound Resumer"
		Resumer.StandName.Value = StandName
		Resumer.Parent = Player:FindFirstChildOfClass("PlayerGui")
		Resumer.Disabled = false
		game:GetService("Debris"):AddItem(Resumer, 3)
		game:GetService("Debris"):AddItem(Copy, 4.5)
		for Index2, Child in next, Player:FindFirstChildOfClass("Backpack"):GetDescendants() do
			if Child:IsA("BasePart") then
				if Child:FindFirstChild(StandName.."'s Anchored Value") then
					Child.Anchored = Child[StandName.."'s Anchored Value"].Value
					Child[StandName.."'s Anchored Value"]:Destroy()
				end
			end
		end
	end
	for Index, Connection in next, TSConnections do
		Connection:Disconnect()
	end
	for Index, Child in next, workspace:GetDescendants() do
		if Child:IsA("BasePart") then
			if Child:FindFirstChild(StandName.."'s Anchored Value") then
				Child.Anchored = Child[StandName.."'s Anchored Value"].Value
				Child[StandName.."'s Anchored Value"]:Destroy()
			end
		end
		if Child:IsA("Humanoid") then
			coroutine.resume(coroutine.create(function()
				for i = 1, #TimeStopHits do
					if CheckTableWithValueIndex(TimeStopHits, Child, 1, "Value") then
						local HitTorso = Child.Parent:FindFirstChild("Torso") or Child.Parent:FindFirstChild("UpperTorso")
						local TableIndex = CheckTableWithValueIndex(TimeStopHits, Child, 1, "Index")
						Child:TakeDamage(TimeStopHits[TableIndex][2])
						if TimeStopHits[TableIndex][7] == "Strong" then
							Child.BreakJointsOnDeath = false
						end
						if TimeStopHits[TableIndex][2] == "Instant Kill" then
							HitTorso.Parent:BreakJoints()
						else
							Child:TakeDamage(TimeStopHits[TableIndex][2])
						end
						coroutine.resume(coroutine.create(function()
							CreateEffect(HitTorso, TimeStopHits[TableIndex][4], TimeStopHits[TableIndex][5])
						end))
						coroutine.resume(coroutine.create(function()
							HitEffect(HitTorso, HitTorso.Parent, TimeStopHits[TableIndex][6], TimeStopHits[TableIndex][7])
						end))
						CreateSound(TimeStopHits[TableIndex][3], HitTorso, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
						PunchAfterBarrage = false
						table.remove(TimeStopHits, TableIndex)
					end
				end
			end))
		end
	end
	TSConnections = {}
	TimeStopHits = {}
	Move = false
end

function Punch()
	if CurrentStand == nil then
		return
	end
	Move = true
	NormalPunch = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 9
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
	Hum.WalkSpeed = WalkSpeed
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
	StrongEUF = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 15
	--CreateSound(1382489817, CurrentStand.Head, 6.5, math.random(97,108)/100, 0.145, false, false, "Strong Shout")
	CreateSound(2553990414, CurrentStand.Head, 6.5, math.random(98,102)/100, 0.1, false, false, "Strong Shout")
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
	StrongEUF = false
	Hum.WalkSpeed = WalkSpeed
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function GravitionalPunch()
	if CurrentStand == nil then
		return
	end
	Move = true
	StrongEUF = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 2
	local Charge1 = CreateSound(159106174, CurrentStand.Head, 4, 0.95, 0.2, false, true, "Charge SFX")
	local Charge2 = CreateSound(244578827, CurrentStand.Head, 4, 1, 0.2, false, true, "Charge SFX")
	for i = 0,1,0.003*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(85.886), 0, math.rad(25.382)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-5.042), math.rad(5.214), math.rad(0.458)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-2.578), math.rad(-5.099), math.rad(-0.229)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.185, -0.079, 0.15) * CFrame.Angles(math.rad(-38.732), math.rad(-5.386), math.rad(50.42)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-0.003, -0.005, 0.068) * CFrame.Angles(math.rad(-30.195), math.rad(53.915), math.rad(120.722)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(0.917), math.rad(1.261), math.rad(-21.772)), i)
	end
	coroutine.resume(coroutine.create(function()
		wait(0.0885)
		pcall(game.Destroy, Charge1)
		pcall(game.Destroy, Charge2)
		CreateEffect(CurrentStand.PrimaryPart, "Gravitation", Color3.fromRGB(25, 255, 50))
		CreateSound(4474164416, CurrentStand.Head, 6.5, math.random(97,105)/100, 0.06, false, false, "Strong Shout")

		for i = 1, 10 do
			CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, 0), 0, Vector3.new(125,38.4,125), 0.35, true, "None", 2319521125, "Push", Color3.fromRGB(25, 255, 50))
			wait(0.035)
		end

		local Targets = GetPartsInArea({CFrame = Torso.CFrame, Size = Vector3.new(225, 235, 225), Region = true})
		for Index, Child in next, Targets do
			local Humanoid = Child:FindFirstChildOfClass("Humanoid")
			if Humanoid then
				local CharTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
				if CharTorso ~= nil and Humanoid.Health > 0 and Humanoid.Parent:FindFirstChild("IsBeingPushed") == nil and (CharTorso.Position-Torso.Position).magnitude < 200 then
					local DoThing = true
					if Humanoid.Parent:FindFirstChild("CanDodge") then
						if Humanoid.Parent["CanDodge"].Value == true then
							DoThing = false
						end
					end
					if DoThing == true then
						local Val = Instance.new("BoolValue")
						Val.Name = "IsBeingPushed"
						Val.Parent = Humanoid.Parent
						Val.Value = true
						game:GetService("Debris"):AddItem(Val, 1.25)
						HitEffect(CharTorso, Humanoid.Parent, CurrentStand.RootPart.CFrame, "Push")
					end
				end
			end
		end
	end))
	for i = 0,1,0.0085*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, -0.51) * CFrame.Angles(math.rad(87.834), math.rad(3.495), math.rad(-33.232)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-9.11), math.rad(5.615), math.rad(-6.875)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-11.287), math.rad(-5.443), math.rad(-2.349)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.62, 0.04, 0.19) * CFrame.Angles(math.rad(-71.104), math.rad(24.465), math.rad(-84.855)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-0.007, -0.065, 0.066) * CFrame.Angles(math.rad(-44.175), math.rad(-8.766), math.rad(-26.929)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(0.458), math.rad(-2.177), math.rad(29.679)), i)
	end
	StrongEUF = false
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Hum.WalkSpeed = WalkSpeed
	Move = false
end

function WallCreator()
	if CurrentStand == nil then
		return
	end
	if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
		return
	end
	Move = true
	StrongEUF = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 7
	for i = 0,1,0.043*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(85.886), 0, math.rad(25.382)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-5.042), math.rad(5.214), math.rad(0.458)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-2.578), math.rad(-5.099), math.rad(-0.229)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.185, -0.079, 0.15) * CFrame.Angles(math.rad(-38.732), math.rad(-5.386), math.rad(50.42)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-0.003, -0.005, 0.068) * CFrame.Angles(math.rad(-30.195), math.rad(53.915), math.rad(120.722)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(0.917), math.rad(1.261), math.rad(-21.772)), i)
	end
	CreateSound(3472910930, CurrentStand.Head, 6.5, math.random(98,103)/100, 0, false, false, "Strong Shout")
	coroutine.resume(coroutine.create(function()
		wait(0.03)
		CreateSound(2319521125, CurrentStand.PrimaryPart, 5, math.random(97,105)/100, 0, false, false, "Hard Punch SFX")
		local Chance = math.random(1, 8)
		local Wall = Instance.new("Part")
		Wall.Size = Vector3.new(10, 10, 2)
		Wall.CFrame = Root.CFrame * CFrame.new(0, -3, -4.5)
		Wall.Anchored = true
		Wall.CanCollide = true
		Wall.Transparency = 1
		Wall.Name = StandName.."'s Created Wall"
		Wall.Material = Enum.Material.Grass
		Wall.BrickColor = BrickColor.new("Dirt brown")
		if Chance == 8 then
			Wall.Material = Enum.Material.Concrete
			Wall.BrickColor = BrickColor.new("Ghost grey")
		end
		if CurrentStand.Head:FindFirstChild("HealParticle") then
			local Particle = CurrentStand.Head.HealParticle:Clone()
			Particle.Enabled = true
			Particle.Parent = Wall
			game:GetService("Debris"):AddItem(Particle, 2)
		end
		if CurrentStand.Head:FindFirstChild("HealParticle2") then
			local Particle = CurrentStand.Head["HealParticle2"]:Clone()
			Particle.Enabled = true
			Particle.Parent = Wall
			game:GetService("Debris"):AddItem(Particle, 2.0000015523)
		end
		Wall.Parent = workspace
		CreateSound(2717163025, Wall, 4, math.random(98,103)/100, 0, false, false, "Heal SFX")
		game:GetService("Debris"):AddItem(Wall, 10)
		spawn(function()
			for i = 1, 50 do
				game:GetService("RunService").RenderStepped:Wait()
				Wall.CFrame = Wall.CFrame * CFrame.new(0, 0.05, 0)
				Wall.Transparency = Wall.Transparency - 0.02
			end
			wait(5)
			Wall.CanCollide = false
			for i = 1, 50 do
				game:GetService("RunService").RenderStepped:Wait()
				Wall.Transparency = Wall.Transparency + 0.02
			end
			Wall:Destroy()
		end)
	end))
	for i = 0,1,0.051*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, -0.51) * CFrame.Angles(math.rad(87.834), math.rad(3.495), math.rad(-33.232)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-9.11), math.rad(5.615), math.rad(-6.875)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-11.287), math.rad(-5.443), math.rad(-2.349)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.62, 0.04, 0.19) * CFrame.Angles(math.rad(-71.104), math.rad(24.465), math.rad(-84.855)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-0.007, -0.065, 0.066) * CFrame.Angles(math.rad(-44.175), math.rad(-8.766), math.rad(-26.929)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(0.458), math.rad(-2.177), math.rad(29.679)), i)
	end
	StrongEUF = false
	Hum.WalkSpeed = WalkSpeed
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function StandJump()
	if CurrentStand == nil then
		return
	end
	if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
		return
	end
	for i = 1, 3 do
		local EffectPart = RLeg:Clone()
		EffectPart.Anchored = true
		EffectPart.Transparency = 1
		EffectPart:ClearAllChildren()
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

function TreeGrowing()
	if CurrentStand == nil then
		return
	end
	if Hum.FloorMaterial == nil or Hum.FloorMaterial == "" or Hum.FloorMaterial == Enum.Material.Air then
		return
	end
	Move = true
	StrongEUF = true
	local Tree = OriginalTree:Clone()
	local Finished = false
	local Saved = Root.CFrame * CFrame.new(0, -5, -6) * CFrame.Angles(0, math.rad(math.random(-30,90)), 0)
	local RandomHeight = math.random(30, 90)/10
	Tree.Transparency = 1
	Tree.Anchored = true
	Tree.CFrame = Saved
	Tree.Name = StandName.."'s Tree"
	Tree.Parent = workspace:FindFirstChildOfClass("Terrain")
	coroutine.resume(coroutine.create(function()
		for i = 1, 65 do
			game:GetService("RunService").RenderStepped:Wait()
			Tree.Transparency = Tree.Transparency - 0.025
		end
		Tree.Transparency = 0
	end))
	coroutine.resume(coroutine.create(function()
		CreateHitBox(Tree.CFrame, math.random(20,80), Tree.Size, 1, false, "", 3092866899, "Strong", Color3.fromRGB(255, 255, 255))
		repeat 
			wait(1)
			CreateHitBox(Tree.CFrame, math.random(20,80), Tree.Size, 1, false, "", 3092866899, "Strong", Color3.fromRGB(255, 255, 255))
		until Finished == true
	end))
	CreateSound(3378924410, Tree, 4, 0.98, 0, false, false, "Tree SFX")
	for i = 0,1,0.065*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		Tree.CFrame = Tree.CFrame:Lerp(Saved * CFrame.new(0, RandomHeight, 0), i)
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 1.09, 0) * CFrame.Angles(math.rad(-13.178), 0, 0), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.266), 0, math.rad(12.032)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-4.297), math.rad(-0.057), math.rad(-10.6)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.323, 0.067, 0.26) * CFrame.Angles(math.rad(35.638), math.rad(49.561), math.rad(-112.185)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.333, 0.069, 0.2) * CFrame.Angles(math.rad(41.024), math.rad(-53.686), math.rad(113.56)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(12.319), 0, 0), i)
	end
	coroutine.resume(coroutine.create(function()
		wait(4)
		for i = 1, 65 do
			game:GetService("RunService").RenderStepped:Wait()
			Tree.Transparency = Tree.Transparency + 0.025
			Tree.CFrame = Tree.CFrame * CFrame.new(0, -0.1, 0)
		end
		Tree:Destroy()
		Finished = true
	end))
	StrongEUF = false
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function StarFinger()
	if CurrentStand == nil then
		return
	end
	Move = true
	StarFingerMove = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 7
	for i = 0,1,0.165*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.5), 0.3)
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0, i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-6.073), 0, 0), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-3.724), 0, 0), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-4.412), 0, math.rad(-88.923)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-6.532), 0, 0), i)
	end
	wait(0.045)
	CreateSound(1382489817, CurrentStand.Head, 3.2, 1, 0.11, false, false, "Star Finger Call")
	wait(0.12)
	CurrentStand["Left Arm"].Transparency = 1
	local Arm = CurrentStand["Left Arm"]:Clone()
	Arm.Name = StandName.."'s Star Finger"
	Arm.Anchored = true
	for Index,Child in next, CurrentStand["Left Arm"]:GetDescendants() do
		if Child:IsA("Decal") then
			Child.Transparency = 1
		end
	end
	Arm.Parent = CurrentStand
	local HB = CreateHitBox(Arm.CFrame, math.random(50,70), Arm.Size+Vector3.new(3,6,3), 0.5, true, "Slice", 2974875851, "Strong", Color3.fromRGB(255, 255, 255))
	Arm.Transparency = 1
	for i = 0,1,0.065*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		HB.Size = HB.Size:Lerp(Vector3.new(HB.Size.X, 18, HB.Size.Z), i/2.5)
		for Index,Child in next, Arm:GetChildren() do
			if Child:IsA("BasePart") then
				Child.Size = Child.Size:Lerp(Vector3.new(Child.Size.X, 18, Child.Size.Z), i/2.5)
			end
		end
		Arm.Size = Arm.Size:Lerp(Vector3.new(Arm.Size.X, 18, Arm.Size.Z), i/2.5)
		Arm.CFrame = Arm.CFrame * CFrame.new(0,-0.635,0)
		HB.CFrame = Arm.CFrame
	end
	wait(0.4)
	Arm:Destroy()
	Hum.WalkSpeed = WalkSpeed
	CurrentStand["Left Arm"].Transparency = 1
	for Index,Child in next, CurrentStand["Left Arm"]:GetDescendants() do
		if Child:IsA("Decal") then
			Child.Transparency = 0
		end
	end
	StarFingerMove = false
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function Healing()
	if CurrentStand == nil then
		return
	end
	Move = true
	NormalPunch = true
	coroutine.resume(coroutine.create(function()
		wait(0.06)
		CreateHitBox(CurrentStand["Right Arm"].CFrame*CFrame.new(0,0.5,-1), math.random(40,120), Vector3.new(5,5,5), 0.4, true, "Heal", 0, "Healing", Color3.fromRGB(0, 255, 0))
	end))
	for i = 0,1,0.045*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(0, 0, math.rad(59.989)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-4.756), 0, math.rad(8.537)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.933), math.rad(-0.115), math.rad(-1.719)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-8.824), math.rad(4.584), math.rad(5.844)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.368, -0.47, 0.458) * CFrame.Angles(math.rad(-90.126), math.rad(-7.105), math.rad(28.82)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(0, 0, math.rad(-34.95)), i)
	end
	NormalPunch = false
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function SuperSpeed(speed)
	if Speeding == false then
		Hum.WalkSpeed = speed
		Speeding = true
	else
		Hum.WalkSpeed = defaultWalkingSpeed
		Speeding = false
	end
end

function SheerHeartAttack()
	if workspace:FindFirstChild(Player.Name.."'s SHA") then
		local SHA = workspace[Player.Name.."'s SHA"]
		if SHA:FindFirstChild("IsExploding") == nil then
			local ExplosionPart = Instance.new("Part")
			ExplosionPart.Size = Vector3.new(1, 1, 1)
			ExplosionPart.CFrame = SHA.CFrame
			ExplosionPart.Transparency = 1
			ExplosionPart.Anchored = true
			ExplosionPart.Parent = workspace
			local Exp = Instance.new("Explosion")
			Exp.BlastPressure = 150
			Exp.BlastRadius = 0
			Exp.ExplosionType = Enum.ExplosionType.NoCraters
			Exp.Position = SHA.Position
			Exp.Parent = ExplosionPart
			--TODO: see if 144699494 is a good replacement for 2686077452
			CreateSound(144699494, ExplosionPart, 10, 1, 0.9725, false, false, "SHA Explode")
			game:GetService("Debris"):AddItem(ExplosionPart, 3)
			SHA:Destroy()
		end
	else
		local SHA = OriginalSHA:Clone()
		SHA.Name = Player.Name.."'s SHA"
		SHA.Stats.Ignore.Value = Character
		SHA.CFrame = Root.CFrame
		SHA.Parent = workspace
		SHA.Controller.Disabled = false
		CreateSound(610470183, SHA, 10, 1, 0, false, false, "SHA Voiceline")
	end
end

function DodgeAnimation()
	if Character:FindFirstChild("GotHitButNot") then
		Character.GotHitButNot:Destroy()
	end
	local RandomDirection = math.random(1,2)
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
	end
	Move = false
end

--Double Click
local count = 0 -- initial counts, should always be 0
local threshHold = 2 -- you can set this to 3 or 4 to get triple and quadriple clicks!
local clickTime = 0.5 -- the time within the clicks should be clicked
function multiClick ()
	count += 1 -- add 1 to the number of clicks

	if count % threshHold == 0 then -- you reached the threshold
		--print("multi click accepted!")
		-- rest of your code goes here!
		if workspace:FindFirstChild("IsTimeStopped") then
			if workspace.IsTimeStopped.Value ~= Player.Name then
				return
			end
		end
		if workspace:FindFirstChild("IsTimeErased") then
			if workspace.IsTimeErased.Value ~= Player.Name then
				return
			end
		end
		if Move == false then
			Punch()
		end
	end

	wait(clickTime) -- just wait to invalidate the click
	count -= 1 -- invalidate the click anyways
end
Mouse.Button1Down:Connect(multiClick)

-- return true if both arrays are the same
local function compare(arr1, arr2)
	if #arr1 ~= #arr2 then
		return false
	end
	for i, v in pairs(arr1) do
		if (typeof(v) == "table") then
			if (compare(arr2[i], v) == false) then
				return false
			end
		else
			if (v ~= arr2[i]) then
				return false
			end
		end
	end
	return true
end

local moves = {}
local comboCounter = 0
local comboClickTime = 0.5 -- moves need to be captured within this time
--For Gamepad or Touchpad users:
-- TODO: add a keyboard mapping GUI to allow user to change which keys control various moves
-- key:control
--  R = B
--  Q = A
--  E = X
--  F = Y
--  G = RB
--  T = LB
--  V = RT
--  B = LT
function executeMove(move)
	--TODO: Remove Move = true/false in all other move functions because it's already set it in this function.
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value ~= Player.Name then
			return
		end
	end
	if workspace:FindFirstChild("IsTimeErased") then
		if workspace.IsTimeErased.Value ~= Player.Name then
			return
		end
	end

	comboCounter += 1
	table.insert(moves, move)

	if moves[1] ~= "F" and #moves == 1 and Move == false then
		Move = true

		-- Single tap moves:

		if move == "Q" then
			Stand() -- De/Summon Stand
		end

		if move == "R" then
			StrongPunch()
		end
		
		if move == "V" then
			if ability["CanStab"] then
				StrongStab()
			else
				Punch()
			end
		end

		-- Hold down moves:
		if move == "E" then
			BarrageDown = true
			--TODO: check if player has a sword, if not use fist
			Barrage(3e9, true, 627722878, "fist")
			--TODO: sword should take more health than fist
			--Barrage(30, false, 3516657180, "sword") -- Stab Rush
		end

		if move == "T" and ability["CanHealSelf"] then
			--TODO: this takes a while to stop. It should stop as soon as you let go
			BarrageDown = true
			Barrage(37, false, 4470712958, "healSelf") -- heal self
		end

		if move == "B" and ability["CanHealOthers"] then
			BarrageDown = true
			Barrage(37, false, 4470712958, "healOthers") -- heal others
		end

		if move == "G" then
			--TODO: add power up move, to increase power and activate special moves
		end


		Move = false
	end

	wait(comboClickTime)
	comboCounter -= 1
	if comboCounter == 0 then
		moves = {} -- reset move list after time is up
	end
	-- Combo moves should always start with an F key or Y button
	--	It may have something to do with MouseButton1Down instead of MouseButton1Click
	if moves[1] == "F" and #moves > 1 and Move == false then
		Move = true
		print(moves)
		if compare(moves, {"F","R","T"}) and ability["CanStarFinger"] then
			--TODO: change audio to say star finger
			print("Star Finger!")
			StarFinger()
		elseif compare(moves, {"F","V","V","V"}) and ability["CanThrowKnives"] then
			print("Throw 3 knives!")
			KnifeThrow(3) 
		elseif compare(moves, {"F","V","V"}) and ability["CanThrowKnives"] then
			print("Throw 2 knives!")
			KnifeThrow(2)
		elseif compare(moves, {"F","V"}) and ability["CanThrowKnife"] then
			print("Throw 1 knife!")
			KnifeThrow(1)
		elseif compare(moves, {"F","Q","Q"}) and ability["CanCreateWall"] then
			print("Create Wall!")
			WallCreator()
		elseif compare(moves, {"F","Q"}) and ability["CanGrowTree"] then
			print("Tree Grow!")
			TreeGrowing()
		elseif compare(moves, {"F","F","T"}) and ability["CanHealOthers"] then
			print("Heal Others!")
			Healing() -- healing others
		elseif compare(moves, {"F","E","E"}) and ability["CanStandJump"] then
			print("Stand Jump!")
			StandJump()
		elseif compare(moves, {"F","E"}) and ability["CanBarrageCombo"] then
			print("Barrage Combo!")
			BarragePunch()
		elseif compare(moves, {"F","Q","R"}) and ability["CanShearHeartAttack"] then
			print("Sheer Heart Attack!")
			--TODO: see if still works after fixing sound
			--TODO: make bomb destroy on impact or after 2-3 kills
			SheerHeartAttack() -- first move sends bomb, second move destroys bomb
		elseif compare(moves, {"F","R","R","R","R"}) and ability["CanIncreaseSpeedMore"] then
			print("Fast Mode 400!")
			SuperSpeed(400)
		elseif compare(moves, {"F","R","R","R"}) and ability["CanIncreaseSpeedMore"] then
			print("Fast Mode 300!")
			SuperSpeed(300)
		elseif compare(moves, {"F","R","R"}) and ability["CanIncreaseSpeedMore"] then
			print("Fast Mode 200!")
			SuperSpeed(200)
		elseif compare(moves, {"F","R"}) and ability["CanIncreaseSpeed"] then
			print("Fast Mode 100!")
			SuperSpeed(100)
		elseif compare(moves, {"F","F"}) and ability["CanDodge"] then
			print("Dodge!")
			if Character:FindFirstChild("CanDodge") then
				Character.CanDodge:Destroy()
				CreatePopUpGui(Head, "FadeOut", "Dodge false", Color3.fromRGB(255, 133, 133))
			else
				CreatePopUpGui(Head, "FadeOut", "Dodge true", Color3.fromRGB(133, 255, 133))
				local Val = Instance.new("BoolValue")
				Val.Name = "CanDodge"
				Val.Parent = Character
				Val.Value = true
			end		
		elseif compare(moves, {"F","T","T"}) and ability["CanTimeErase"] then
			print("Time Erase/Regain!")
			if TimeErased == true then
				TimeRegain()
			else
				--TODO: find out why RootPart of Stand changes to 0.825 transparency. It should be 1
				--check KC & SansC RootPart transparency when using this
				TimeErase()
			end
		elseif compare(moves, {"F","T"}) and ability["CanTimeBoost"] then
			--Note: for some reason this doesn't work for more than a 2 key combo because it fires more than once.
			print("Time Boost/Resume!")
			if TimeStopped == true or TimeAccelerating == true then
				TimeResume()
			else
				TimeAccelerate()
			end
		elseif compare(moves, {"F","T","F"}) and ability["CanTimeStop"] then
			print("Time Stop/Resume!")
			if TimeStopped == true or TimeAccelerating == true then
				TimeResume()
			elseif TimeErased == true then
				TimeRegain()
			else
				TimeStop()
			end
		elseif compare(moves, {"F","B","B","B","B"}) and ability["CanTimeLeapMore"] then
			print("Time Leap 100 frames!")
			if TimeErased == false then
				TimeLeap(100) 
			end
		elseif compare(moves, {"F","B","B","B"}) and ability["CanTimeLeapMore"] then
			print("Time Leap 40 frames!")
			if TimeErased == false then
				TimeLeap(40) 
			end
		elseif compare(moves, {"F","B","B"}) and ability["CanTimeLeapMore"] then
			print("Time Leap 20 frames!")
			if TimeErased == false then
				TimeLeap(20) 
			end
		elseif compare(moves, {"F","B"}) and ability["CanTimeLeap"] then
			print("Time Leap 15 frames!")
			if TimeErased == false then
				TimeLeap(15) 
			end
		end

		--TODO: remove or figure out what this is supposed to do
		--GravitionalPunch()

		--Taunt 
		--	print("Oof!")
		--	if Head:FindFirstChild("MC-Oof") then
		--		return
		--	end
		--	CreateSound(1382489817, Head, 8.5, 1, 0.13, false, false, "MC-Oof")
		wait(0.2)
		Move = false
	end

end

--Touchpad Moves
MoveList.Moves.A.MouseButton1Click:Connect(function()
	executeMove("Q") --TODO: use different button (like RB) because A is reserved for jumping
end)

MoveList.Moves.Y.MouseButton1Click:Connect(function()
	executeMove("F")
end)

MoveList.Moves.B.MouseButton1Click:Connect(function()
	executeMove("R")
end)

MoveList.Moves.RT.MouseButton1Click:Connect(function()
	executeMove("V")
end)

--hold down moves (Touchpad)
MoveList.Moves.X.MouseButton1Down:Connect(function()
	executeMove("E")
end)
MoveList.Moves.X.MouseButton1Up:Connect(function()
	BarrageDown = false
end)

MoveList.Moves.RB.MouseButton1Down:Connect(function()
	executeMove("G")
end)
MoveList.Moves.RB.MouseButton1Up:Connect(function()
	BarrageDown = false
end)

MoveList.Moves.LB.MouseButton1Down:Connect(function()
	executeMove("T")
end)
MoveList.Moves.LB.MouseButton1Up:Connect(function()
	BarrageDown = false
end)

MoveList.Moves.LT.MouseButton1Down:Connect(function()
	executeMove("B")
end)
MoveList.Moves.LT.MouseButton1Up:Connect(function()
	BarrageDown = false
end)


--Keyboard Moves
--Mouse.KeyDown:Connect(function(Key)
--	--TODO: see if moving this to executeMove function would be better
--	if workspace:FindFirstChild("IsTimeStopped") then
--		if workspace.IsTimeStopped.Value ~= Player.Name then
--			return
--		end
--	end
--	if workspace:FindFirstChild("IsTimeErased") then
--		if workspace.IsTimeErased.Value ~= Player.Name then
--			return
--		end
--	end

--	if Key == "q" and Move == false then
--		executeMove("Q")
--	end

--	if Key == "r" and Move == false then
--		executeMove("R")
--	end

--	if Key == "e" and Move == false then
--		executeMove("E")
--	end	

--	if Key == "f" and Move == false then
--		executeMove("F")
--	end	

--	if Key == "g" and Move == false then
--		executeMove("G")
--	end	

--	if Key == "t" and Move == false then
--		executeMove("T")
--	end	

--	if Key == "v" and Move == false then
--		executeMove("V")
--	end	

--	if Key == "b" and Move == false then
--		executeMove("B")
--	end	

--end)

--Mouse.KeyUp:Connect(function(Key)
--	if Key == "e" or Key == "t" or Key == "b" then
--		BarrageDown = false
--	end
--end)

function DeSpawn()
	coroutine.resume(coroutine.create(function()
		while script.Parent ~= nil do
			game:GetService("RunService").RenderStepped:Wait()
			Move = true
			BarrageDown = false
		end
	end))
	Clock.Enabled = false
	MoveList.Enabled = false
	KeyboardMoveList.Enabled = false
	if TimeStopped == true then
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

Character.ChildAdded:Connect(function(Child)
	if Child:IsA("StringValue") and Child.Name == "ForceResumeTimeStop" and TimeStopped == true then
		TimeResume()
	elseif Child:IsA("StringValue") and Child.Name == "MIHInstantResume" and TimeStopped == true then
		InstantResume()
	end
end)

Player.CharacterAdded:Connect(function()
	DeSpawn()
end)

workspace.ChildAdded:Connect(function(AddedChild)
	if AddedChild:IsA("StringValue") and AddedChild.Name == "IsTimeStopped" and AddedChild.Value ~= Player.Name then
		ClockTime = TimeStopImmunity
		Clock.Clock.MainArrow.Rotation = 0.015
		Clock.Clock.Count.Text = tostring(ClockTime)
		Clock.Enabled = true
		AllowClockMovment = true
		coroutine.resume(coroutine.create(function()
			repeat
				game:GetService("RunService").RenderStepped:Wait()
			until ClockTime < 0 or ClockTime == 0 or AddedChild == nil or AddedChild.Parent ~= workspace or AddedChild.Value == Player.Name
			Clock.Enabled = false
			AllowClockMovment = false
			Character.IsTSImmune.Value = false
			if CurrentStand ~= nil then
				CurrentStand.IsTSImmune.Value = false
			end
		end))
		AddedChild:GetPropertyChangedSignal("Parent"):Connect(function()
			if AddedChild == nil or AddedChild.Parent ~= workspace or AddedChild.Value == Player.Name then
				Clock.Enabled = false
				AllowClockMovment = false
				Character.IsTSImmune.Value = true
				if CurrentStand ~= nil then
					CurrentStand.IsTSImmune.Value = true
				end
			end
		end)
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	Sine = Sine + 1
	Hum.PlatformStand = false
	if Hum.Health ~= Hum.MaxHealth then
		Hum.Health = Hum.Health + 1.5
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
		if BarrageSelfHeal == false then
			if (BarrageDown == true or StrongEUF == true or NormalPunch == true) and PunchAfterBarrage == false then
				CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.75), 0.23)
			end
		elseif BarrageSelfHeal == true and BarrageDown == true then
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.75) * CFrame.Angles(0, math.rad(180), 0) , 0.23)
		end			
	end
	if Move == false then
		if Anim == "Idle" then
			if CurrentStand ~= nil then
				--CurrentStand:SetPrimaryPartCFrame(Root.CFrame * CFrame.new(-2, 1.3, 3))
				CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.2)
				CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 0.8*math.sin(Sine/75)), 0.23)
				CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.38), 0, 0), 0.23)
				CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-6.818), 0, 0), 0.23)
				CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-8.136), 0, 0), 0.23)
				CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-12.089), 0, 0), 0.23)
				CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head, 1)
			end
		end
	end
	if Character:FindFirstChild("GotHitButNot") then
		Character.GotHitButNot:Destroy()
		DodgeAnimation()
	end
	if Character:FindFirstChild("IsTSImmune") == nil then
		local ImmunityCharacter = Instance.new("BoolValue")
		ImmunityCharacter.Name = "IsTSImmune"
		ImmunityCharacter.Value = true
		ImmunityCharacter.Parent = Character
	end
	if CurrentStand ~= nil then
		if CurrentStand:FindFirstChild("IsTSImmune") == nil then
			local ImmunityStand = Instance.new("BoolValue")
			ImmunityStand.Name = "IsTSImmune"
			ImmunityStand.Value = true
			ImmunityStand.Parent = CurrentStand
		end
	end
	if Character:FindFirstChild("StandValue") == nil then
		local StandValue = Instance.new("StringValue")
		StandValue.Name = "StandValue"
		StandValue.Value = StandName
		StandValue.Parent = Character
	end
end)

local function BoundInput(actionName, inputState)
	if inputState == Enum.UserInputState.Begin then
		executeMove(actionName)
	end

	if inputState == Enum.UserInputState.End then
		BarrageDown = false
	end
end

ContextActionService:BindAction("Q", BoundInput, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.Q)
ContextActionService:BindAction("V", BoundInput, false, Enum.KeyCode.ButtonR2, Enum.KeyCode.V)
ContextActionService:BindAction("R", BoundInput, false, Enum.KeyCode.ButtonB, Enum.KeyCode.R)
ContextActionService:BindAction("E", BoundInput, false, Enum.KeyCode.ButtonX, Enum.KeyCode.E)
ContextActionService:BindAction("F", BoundInput, false, Enum.KeyCode.ButtonY, Enum.KeyCode.F)
ContextActionService:BindAction("T", BoundInput, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.T)
ContextActionService:BindAction("B", BoundInput, false, Enum.KeyCode.ButtonL2, Enum.KeyCode.B)

while wait(0.25) do
	if CurrentStand ~= nil and TimeErased == false then
		--TODO: change color and effect depending on the stand
		CreateEffect(CurrentStand.StandTorso, "Slice", Color3.fromRGB(9, 137, 207))
	end
end

