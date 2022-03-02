-->Made By XDavodioX<--
 
--=(Category = Fun, Action, Quick)=--
 
--:Bruh World:--
 
--//Unknown\\--

script:WaitForChild("Stand")
script:WaitForChild("ColorCorrection")
script:WaitForChild("RemoveColorCorrection")
script:WaitForChild("MoveList")
script:WaitForChild("RoadRoller")
script:WaitForChild("ClockGui")
script:WaitForChild("TimeStopSounds")
script:WaitForChild("TimeResumeSounds")
script:WaitForChild("FeModule")
local OriginalStand = script["Stand"]:Clone()
local OriginalRoller = script["RoadRoller"]:Clone()
local CorrectionScript = script["ColorCorrection"]:Clone()
local CorrectionRemoveScript = script["RemoveColorCorrection"]:Clone()
local SoundStopScript = script["TimeStopSounds"]:Clone()
local SoundResumeScript = script["TimeResumeSounds"]:Clone()
wait(0.25)
script["Stand"]:Destroy()
script["RoadRoller"]:Destroy()

require(script.FeModule)()

local StandName = "Bruh World"
local ModelCreator = "BiggerGames_YT"

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

local AttackSpeed = 1
local Sine = 0

local CurrentStand = nil
local TimeStopSeconds = 10 -- Time Stop Time - In seconds, just normal numbers no .2 stuff
local TimeStopImmunity = 7 -- Time Stop Immunity when someone else Time Stops - In seconds, just normal numbers no .2 stuff
local Move = false
local BarrageDown = false
local Anim = "Idle"
local TimeStopped = false
local AnchoredList = {}
local SoundList = {}
local TimeStopHits = {}
local StrongMUDA = false
local NormalPunch = false
local KnifeThrowing = false
local PunchAfterBarrage = false
local TimeStopKnifes = {}
local RoadRollering = false
local AllowClockMovment = false
local ClockTime = 0
local TSConnections = {}
local Speeding = false
local OGWS = 22
local StandUsers = {
	Player
}

local ImmunityCharacter = Instance.new("BoolValue")
ImmunityCharacter.Name = "IsTSImmune"
ImmunityCharacter.Value = true
ImmunityCharacter.Parent = Character

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

function CreateTextGui(Parent, Text, TextSpeed, TextColor, TextStrokeColor, Font)
	local ToWrite = Text
	local DoStroke = false
	local Billboard = Instance.new("BillboardGui")
	Billboard.Adornee = Parent
	Billboard.Name = tostring(tick()^20*5*math.random())
	Billboard.Size = UDim2.new(2, 0, 1.2, 0)
	Billboard.StudsOffset = Vector3.new(-6, 0, 0)
	Billboard.Parent = Parent
	local WriterGui = Instance.new("TextLabel")
	WriterGui.Size = UDim2.new(7, 0, 0.5, 0)
	WriterGui.TextScaled = true
	WriterGui.FontSize = "Size24"
	WriterGui.TextSize = 22
	WriterGui.BackgroundTransparency = 1
	WriterGui.TextTransparency = 1
	WriterGui.TextStrokeTransparency = 1
	if TextStrokeColor ~= "None" then
		DoStroke = true
		WriterGui.TextStrokeColor3 = TextStrokeColor
	end
	WriterGui.Font = Font
	WriterGui.Name = tostring(tick()^20*5*math.random())
	WriterGui.Text = ""
	WriterGui.TextColor3 = TextColor
	WriterGui.Parent = Billboard
	coroutine.resume(coroutine.create(function()
		for i = 1, 20 do
			WriterGui.TextTransparency = WriterGui.TextTransparency - 0.05
			if DoStroke == true then
				WriterGui.TextStrokeTransparency = WriterGui.TextTransparency
			end
			Billboard.StudsOffset = Billboard.StudsOffset + Vector3.new(0, 0.15, 0)
			game:GetService("RunService").RenderStepped:Wait(25)
		end
	end))
	coroutine.resume(coroutine.create(function()
		for i = 1, #ToWrite do
			WriterGui.Text = string.sub(ToWrite, 1, i)
			wait(0.4/(TextSpeed*2.5))
		end
		wait(1.25)
		for i = 1, 20 do
			WriterGui.TextTransparency = WriterGui.TextTransparency + 0.05
			if DoStroke == true then
				WriterGui.TextStrokeTransparency = WriterGui.TextTransparency
			end
			Billboard.StudsOffset = Billboard.StudsOffset + Vector3.new(0, 0.15, 0)
			game:GetService("RunService").RenderStepped:Wait(25)
		end
		Billboard:Destroy()
	end))
end

function CreateSound(ID, Parent, Volume, Pitch, TimePos, Loop, StayForever, CustomName)
	local New = nil
	coroutine.resume(coroutine.create(function()
		New = Instance.new("Sound")
		New.Name = CustomName
		New.Parent = Parent
		New.Volume = Volume
		New.SoundId = "rbxassetid://"..ID
		--[[
		if Pitch == "Random" then
			spawn(function()
				while New do
					wait(0.1)
					New.Pitch = math.random(93,113)/100
				end
			end)
		else
			New.Pitch = Pitch
		end
		]]
		spawn(function()
			while New do
				wait(0.1)
				New.Pitch = math.random(93,113)/100
			end
		end)
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
				for Index, Child in next, FadeArm:GetDescendants() do
					if Child:IsA("BasePart") then
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
			if TimeStopped == false then
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
					CreateSound(141679994, Toucher, 10, math.random(105,125)/100, 0, false, false, "Hit SFX")
					Humanoid.Parent:BreakJoints()
					local a = ""
					local Chance = math.random(1, 5)
					if Chance == 1 then
						a = "lol noob got coronavirus"
					elseif Chance == 2 then
						a = "victoRRRRRyYy"
					elseif Chance == 3 then
						a = "noobi'd"
					elseif Chance == 4 then
						a = "flattend"
					elseif Chance == 5 then
						a = "+ infinite amounts of sicknessssss"
					elseif Chance == 6 then
						a = "that's a lot of damage!"
					end
					CreatePopUpGui(Toucher, "Jump", a, Color3.fromRGB(188, 0, 0))
				else
					CreateSound(1741722952, Toucher, 4, math.random(105,125)/100, 0, false, false, "Hit SFX")
					Humanoid:TakeDamage(Damage)
					local A = "AaAaAaAaAaA"
					CreatePopUpGui(Toucher, "Jump", string.sub(A, 1, math.random(1, string.len(A))), Color3.fromRGB(188, 0, 0))
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
				table.insert(TimeStopHits, {Humanoid, Damage, HitSound, Effect, EffectColor, CurrentStand.RootPart.CFrame, HitType})
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
		CreateSound(616576400, Head, 5, 1, 0.4, false, false, "Stand Call")
		for Index,Child in next, CurrentStand:GetDescendants() do
			if Child:IsA("BasePart") then
				Child.Transparency = 1
			end
		end
		CurrentStand:SetPrimaryPartCFrame(Root.CFrame)
		CurrentStand.Parent = Head
		for Index,Child in next, CurrentStand:GetDescendants() do
			if (Child:IsA("BasePart") or Child:IsA("Decal")) and Child.Name ~= "RootPart" and Child.Parent ~= CurrentStand then
				coroutine.resume(coroutine.create(function(Part)
					for i = 1, 20 do
						game:GetService("RunService").RenderStepped:Wait()
						Part.Transparency = Part.Transparency - 0.06
					end
					Part.Transparency = 0
				end), Child)
			end
		end
		--1844947150
		local Chance = math.random(1, 25)
		local id
		if Chance == 1 then
			id = 4200187685
		elseif Chance == 2 then
			id = 3811778674
		elseif Chance == 3 then
			id = 3789273990
		elseif Chance == 4 then
			id = 910713928
		elseif Chance == 5 then
			id = 2998977755
		elseif Chance == 6 then
			id = 4602944754
		elseif Chance == 7 then
			id = 2273703445
		elseif Chance == 8 then
			id = 382117218
		elseif Chance == 9 then
			id = 292480358
		elseif Chance == 10 then
			id = 1844947086
		elseif Chance == 11 then
			id = 1836262330
		elseif Chance == 12 then
			id = 3048060571
		elseif Chance == 13 then
			id = 2466688348
		elseif Chance == 14 then
			id = 1662226414
		elseif Chance == 15 then
			id = 1835451681
		elseif Chance == 16 then
			id = 1839638725
		elseif Chance == 17 then
			id = 1515053586
		elseif Chance == 18 then
			id = 4053564243
		elseif Chance == 19 then
			id = 1292441853
		elseif Chance == 20 then
			id = 278380971
		elseif Chance == 21 then
			id = 290015580
		elseif Chance == 22 then
			id = 2779427724
		elseif Chance == 23 then
			id = 346736820
		elseif Chance == 24 then
			id = 4783156235
		elseif Chance == 25 then
			id = 269853353
		end
		coroutine.resume(coroutine.create(function()
			CreateTextGui(CurrentStand.Head, "Destiny still arrives", 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0), Enum.Font.Antique)
		end))
		CreateSound(id, CurrentStand.PrimaryPart, 3, "Random", 0, true, true, "The Bruh")
		CreateSound(4550017741, CurrentStand.PrimaryPart, 10, math.random(98,103)/100, 0.2, false, false, "Stand Appear")
		for i = 0,1,0.02 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2.2, 1.3, 2.25), i)
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 0.8*math.sin(Sine/75))*CFrame.Angles(0, 0, math.rad(-41.998)), 0.23)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.033, 0.27, -0.068) * CFrame.Angles(math.rad(0.172), math.rad(32.028), math.rad(5.329)), 0.23)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(-0.212, -0.01, 0.007) * CFrame.Angles(math.rad(-4.526), math.rad(-12.089), math.rad(1.432)), 0.23)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.061, 0, 0.081) * CFrame.Angles(math.rad(-17.418), math.rad(-12.949), math.rad(-14.381)), 0.23)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-16.845), math.rad(21.601), math.rad(2.979)), 0.23)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(0, 0, math.rad(35.008)), 1)
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

function Barrage(Times, NeutralStop, BarrageSFX, External)
	if CurrentStand == nil then
		return
	end
	Move = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 10
	local Done = false
	local Repeat = Times
	local BarrageSound = CreateSound(BarrageSFX, CurrentStand.Head, 3.25, 1, 25.7, not NeutralStop, not NeutralStop, "Barrage Shout")
	BarrageSound.Ended:Connect(function()
		if NeutralStop == true then
			Done = true
		end
	end)
	if NeutralStop == false and External == true then
		coroutine.resume(coroutine.create(function()
			while BarrageSound do
				game:GetService("RunService").RenderStepped:Wait()
				if BarrageSound.TimePosition > 34.2 then
					BarrageSound:Pause()
					BarrageSound.TimePosition = 25.7
					BarrageSound:Resume()
				end
			end
		end))
	end
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
	if CurrentStand.PrimaryPart:FindFirstChild("The Bruh") then
		CurrentStand.PrimaryPart["The Bruh"]:Pause()
	end
	coroutine.resume(coroutine.create(function()
		local say = "muda"
		local the
		repeat
			the = ""
			for i = 1, string.len(say) do
				if math.random(1, 2) == 1 then
					the = the..string.upper(string.sub(say,i,i))
				else
					the = the..string.lower(string.sub(say,i,i))
				end	
			end
			if math.random(1, 2) == 1 then
				CreateTextGui(CurrentStand["Left Arm"], the, 5, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 0), Enum.Font.Bodoni)
			else
				CreateTextGui(CurrentStand["Right Arm"], the, 5, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 0), Enum.Font.Bodoni)
			end
			wait(0.5)
		until Repeat < 0 or Repeat == 0 or BarrageDown == false or Done == true
	end))
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		Repeat = Repeat - 1
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Barrage", Color3.fromRGB(255, 255, 255))
		for i = 0,1,0.225*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(28.018), math.rad(-11.526*math.sin(Sine/6)), math.rad(-22.48*math.sin(Sine/8))), i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(3.667), math.rad(6.646), math.rad(13.923)), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.952, 0.496, -0.141) * CFrame.Angles(math.rad(-5.73), math.rad(6.933), math.rad(-12.261)), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-1.587, 0.561, -0.296) * CFrame.Angles(math.rad(-19.996), math.rad(-32.143), math.rad(-108.862)), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(-1.515, -0.375, 0.297) * CFrame.Angles(math.rad(-4.412), math.rad(5.214), math.rad(108.518)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.745), math.rad(8.308)), i)
		end
		CreateEffect(CurrentStand["Left Arm"], "BarrageArm", CurrentStand["Left Arm"].Color)
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Barrage", Color3.fromRGB(255, 255, 255))
		for i = 0,1,0.225*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(28.018), math.rad(-11.526*math.sin(Sine/6)), math.rad(-22.48*math.sin(Sine/8))), i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(-0.057, 0.038, -0.01) * CFrame.Angles(math.rad(-2.693), math.rad(-5.157), math.rad(15.069)), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.927, 0.471, 0.061) * CFrame.Angles(math.rad(1.318), math.rad(-4.813), math.rad(-12.892)), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(1.596, -0.316, 0.111) * CFrame.Angles(math.rad(-1.776), math.rad(-3.037), math.rad(-103.075)), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(1.659, 0.498, -0.516) * CFrame.Angles(math.rad(-19.079), math.rad(38.961), math.rad(106.284)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(-0.117, 0.022, -0.012) * CFrame.Angles(math.rad(-23.377), math.rad(-0.917), math.rad(-10.084)), i)
		end
		CreateEffect(CurrentStand["Right Arm"], "BarrageArm", CurrentStand["Right Arm"].Color)
	until Repeat < 0 or Repeat == 0 or BarrageDown == false or Done == true
	BarrageSound:Destroy()
	if CurrentStand.PrimaryPart:FindFirstChild("The Bruh") then
		CurrentStand.PrimaryPart["The Bruh"]:Resume()
	end
	Hum.WalkSpeed = WalkSpeed
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

function AddingStopper(Child)
	local ChildAdderConnection = Child.DescendantAdded:Connect(function(Child2)
		CheckObject(Child2)
		if Child2:IsA("BasePart") and Child2:FindFirstChild(StandName.."'s Anchored Value") == nil then
			StopObject(Child2)
		end
	end)
	table.insert(TSConnections, ChildAdderConnection)
end

function StopObject(Child)
	local AnchoredValue = Instance.new("BoolValue")
	AnchoredValue.Value = Child.Anchored
	AnchoredValue.Name = StandName.."'s Anchored Value"
	AnchoredValue.Parent = Child
	local SizeValue = Instance.new("Vector3Value")
	SizeValue.Value = Child.Size
	SizeValue.Name = StandName.."'s Size Value"
	SizeValue.Parent = Child
	local TransparencyValue = Instance.new("NumberValue")
	TransparencyValue.Value = Child.Transparency
	TransparencyValue.Name = StandName.."'s Transparency Value"
	TransparencyValue.Parent = Child
	local ColorValue = Instance.new("Color3Value")
	ColorValue.Value = Child.Color
	ColorValue.Name = StandName.."'s Color Value"
	ColorValue.Parent = Child
	local OriginalCFrame = Child.CFrame
	local OriginalSize = Child.Size
	local OriginalTransparency = Child.Transparency
	local OriginalColor = Child.Color
	Child.Anchored = true
	local AnchoredConnection = Child:GetPropertyChangedSignal("Anchored"):Connect(function()
		Child.Anchored = true
	end)
	table.insert(TSConnections, AnchoredConnection)
	local CFrameConnection = Child:GetPropertyChangedSignal("CFrame"):Connect(function()
		Child.CFrame = OriginalCFrame
	end)
	table.insert(TSConnections, CFrameConnection)
	local SizeConnection = Child:GetPropertyChangedSignal("Size"):Connect(function()
		Child.Size = OriginalSize
	end)
	table.insert(TSConnections, SizeConnection)
	local TransparencyConnection = Child:GetPropertyChangedSignal("Transparency"):Connect(function()
		Child.Transparency = OriginalTransparency
	end)
	table.insert(TSConnections, TransparencyConnection)
	local ColorConnection = Child:GetPropertyChangedSignal("Color"):Connect(function()
		Child.Color = OriginalColor
	end)
	table.insert(TSConnections, ColorConnection)
	--[[ Useless since I use workspace.DescendantAdded now
	local ChildAdderConnection = Child.ChildAdded:Connect(function(Child2)
		if Child2:IsA("BasePart") then
			StopObject(Child2)
		else
			AddingStopper(Child2)
		end
	end)
	table.insert(TSConnections, ChildAdderConnection)
	]]
end

function CheckObject(Child)
	for Index, Child2 in next, Child:GetDescendants() do
		if Child2:IsA("BasePart") and Child2:FindFirstChild(StandName.."'s Anchored Value") == nil then 
			StopObject(Child2)
		end
	end
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
	local StopAudio = CreateSound(1219326109, Head, 10, 1, 0, false, false, "Stop Shout")
	coroutine.resume(coroutine.create(function()
		CreateTextGui(Head, "i'm completly lost help", 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(123, 123, 123), Enum.Font.Bodoni)
	end))
	local i = 0.095
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(-50*math.sin(Sine/8)), math.rad(-40), math.rad(90*math.sin(Sine/8))), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-4.125), math.rad(0.344), math.rad(-4.641)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-7.85), math.rad(-0.917), math.rad(6.474)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(10.943), math.rad(-41.597), math.rad(-69.328)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(9.282), math.rad(41.769), math.rad(84.339)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(12.6), 0, 0), i)
	until StopAudio.TimePosition > 2
	TimeStopped = true
	CreateSound(157022838, CurrentStand.Head, 10, 1, 0, false, false, "POOOOOOOOOOOSH")
	coroutine.resume(coroutine.create(function()
		local Chance = math.random(1, 9)
		if Chance == 9 then
			CreateTextGui(CurrentStand.Head, "i did the funny poosh stop move haha", 5, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 0), Enum.Font.Bodoni)
		else
			CreateTextGui(CurrentStand.Head, "poosh", 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 0), Enum.Font.Bodoni)
		end
	end))
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
		game:GetService("Debris"):AddItem(Sounder, TimeStopSeconds+TimeStopSeconds/1.75)
		game:GetService("Debris"):AddItem(Copy, TimeStopSeconds+TimeStopSeconds/1.75)
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
								StopObject(Child)
							end
						end)
						table.insert(TSConnections, ValueConnection)
					else
						StopObject(Child)
					end
				else
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
		--[[
		for Index, Plr in next, game:GetService("Players"):GetPlayers() do
			if Plr ~= Player then
				local CharacterAddingConnection = Plr.CharacterAdded:Connect(function()
					local Char = workspace:WaitForChild(Plr.Name)
					for Index2, Child in next, Char:GetDescendants() do
						if Child:IsA("BasePart") then
							CheckObject(Child)
							StopObject(Child)
						else
							CheckObject(Child)
							AddingStopper(Child)
						end
					end
				end)
				table.insert(TSConnections, CharacterAddingConnection)
			end
		end
		local PlayerJoinedConnection = game:GetService("Players").PlayerAdded:Connect(function(Plr)
			local CharacterAddingConnection = Plr.CharacterAdded:Connect(function()
				local Char = workspace:WaitForChild(Plr.Name)
				for Index2, Child in next, Char:GetDescendants() do
					if Child:IsA("BasePart") then
						CheckObject(Child)
						StopObject(Child)
					else
						CheckObject(Child)
						AddingStopper(Child)
					end
				end
			end)
			table.insert(TSConnections, CharacterAddingConnection)
			local Char = workspace:WaitForChild(Plr.Name)
			for Index, Child in next, Char:GetDescendants() do
				if Child:IsA("BasePart") then
					CheckObject(Child)
					StopObject(Child)
				else
					CheckObject(Child)
					AddingStopper(Child)
				end
			end
		end)
		table.insert(TSConnections, PlayerJoinedConnection)
		]]
		local WorkspaceConnection = workspace.DescendantAdded:Connect(function(Child)
			if not Child:IsDescendantOf(Character) then
				CheckObject(Child)
			end
			if Child:IsA("BasePart") and not Child:IsDescendantOf(Character) then
				StopObject(Child)
			elseif not Child:IsA("BasePart") and not Child:IsDescendantOf(Character) then
				AddingStopper(Child)
			end
		end)
		table.insert(TSConnections, WorkspaceConnection)
	end))
	coroutine.resume(coroutine.create(function()
		for p = 1, 10 do
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
			ImageLabel.ImageColor3 = Color3.fromRGB(255,255,0)
			ImageLabel.BackgroundColor3 = Color3.new(1,1,1)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.BorderColor3 = Color3.new(1,1,1)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Image = "rbxassetid://4593484353"
			coroutine.wrap(function()
				for i = 1, 20 do
					ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.05
					BillboardGui.Size = UDim2.new(2+(i*1.5*p),0,2+(i*1.5*p),0)
					wait(0.01)
				end
				--[[
				for i = 20, 1, -1 do
					ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.05
					BillboardGui.Size = UDim2.new(2+(i*1.5*p),0,2+(i*1.5*p),0)
					wait(0.01)
				end
				]]
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
	for i = 0,1,0.008*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(-30*math.sin(Sine/8)), 0, math.rad(30*math.sin(Sine/8))), 1.86)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-4.125), math.rad(-0.63), math.rad(8.652)), 1.86)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-7.792), math.rad(1.318), math.rad(-9.511)), 1.86)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.669, 0.039, 0.18) * CFrame.Angles(math.rad(13.35), math.rad(49.504), math.rad(-103.591)), 1.86)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.782, 0.086, 0.12) * CFrame.Angles(math.rad(-4.756), math.rad(-30.882), math.rad(102.445)), 1.86)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(-8.193), 0, 0), 1.86)
	end
	Unlock(Character)
	Move = false
end

function InstantResume()
	TimeStopped = false
	AllowClockMovment = false
	ClockTime = 0
	Clock.Enabled = false
	for Index, Knife in next, TimeStopKnifes do
		if Knife:IsA("BasePart") then
			Knife.Anchored = false
			local Original = 100
			local Velocity = Instance.new("BodyVelocity")
			Velocity.Name = "KnifeThrowing"
			Velocity.Parent = Knife
			Velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			Velocity.Velocity = Knife.CFrame.lookVector*Original
			coroutine.resume(coroutine.create(function()
				repeat 
					game:GetService("RunService").RenderStepped:Wait()
					Velocity.Velocity = Knife.CFrame.lookVector*Original
					Original = Original - 1.25
				until Velocity.Parent == nil or Original < 10
				Velocity:Destroy()
			end))
			game:GetService("Debris"):AddItem(Knife, 10)
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
		game:GetService("Debris"):AddItem(Resumer, 6)
		game:GetService("Debris"):AddItem(Copy, 8)
		for Index2, Child in next, Player:FindFirstChildOfClass("Backpack"):GetDescendants() do
			if Child:IsA("BasePart") then
				if Child:FindFirstChild(StandName.."'s Anchored Value") then
					Child.Anchored = Child[StandName.."'s Anchored Value"].Value
					Child[StandName.."'s Anchored Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Size Value") then
					Child.Size = Child[StandName.."'s Size Value"].Value
					Child[StandName.."'s Size Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Transparency Value") then
					Child.Transparency = Child[StandName.."'s Transparency Value"].Value
					Child[StandName.."'s Transparency Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Color Value") then
					Child.Color = Child[StandName.."'s Color Value"].Value
					Child[StandName.."'s Color Value"]:Destroy()
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
			if Child:FindFirstChild(StandName.."'s Size Value") then
				Child.Size = Child[StandName.."'s Size Value"].Value
				Child[StandName.."'s Size Value"]:Destroy()
			end
			if Child:FindFirstChild(StandName.."'s Transparency Value") then
				Child.Transparency = Child[StandName.."'s Transparency Value"].Value
				Child[StandName.."'s Transparency Value"]:Destroy()
			end
			if Child:FindFirstChild(StandName.."'s Color Value") then
				Child.Color = Child[StandName.."'s Color Value"].Value
				Child[StandName.."'s Color Value"]:Destroy()
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
	TimeStopKnifes = {}
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
	if Character and Character ~= nil and Character:IsDescendantOf(workspace) then
		Lock(Character)
		if Character:FindFirstChild("Head") then
			CreateSound(2571959267, Head, 10, 1, 0, false, false, "Time Resume Call")
			wait(1.6)
		end
	end
	local DidSound = false
	if DidSound == false and Character and Character ~= nil and Character:IsDescendantOf(workspace) and Torso and Torso:IsDescendantOf(Character) then
		DidSound = true
		CreateSound(864569342, Torso, 6.9, 1, 0.056, false, false, "Time Resume")
	end
	for Index, Knife in next, TimeStopKnifes do
		if Knife:IsA("BasePart") then
			Knife.Anchored = false
			local Original = 100
			local Velocity = Instance.new("BodyVelocity")
			Velocity.Name = "KnifeThrowing"
			Velocity.Parent = Knife
			Velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			Velocity.Velocity = Knife.CFrame.lookVector*Original
			coroutine.resume(coroutine.create(function()
				repeat 
					game:GetService("RunService").RenderStepped:Wait()
					Velocity.Velocity = Knife.CFrame.lookVector*Original
					Original = Original - 1.25
				until Velocity.Parent == nil or Original < 10
				Velocity:Destroy()
			end))
			game:GetService("Debris"):AddItem(Knife, 10)
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
		game:GetService("Debris"):AddItem(Resumer, 6)
		game:GetService("Debris"):AddItem(Copy, 8)
		for Index2, Child in next, Player:FindFirstChildOfClass("Backpack"):GetDescendants() do
			if Child:IsA("BasePart") then
				if Child:FindFirstChild(StandName.."'s Anchored Value") then
					Child.Anchored = Child[StandName.."'s Anchored Value"].Value
					Child[StandName.."'s Anchored Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Size Value") then
					Child.Size = Child[StandName.."'s Size Value"].Value
					Child[StandName.."'s Size Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Transparency Value") then
					Child.Transparency = Child[StandName.."'s Transparency Value"].Value
					Child[StandName.."'s Transparency Value"]:Destroy()
				end
				if Child:FindFirstChild(StandName.."'s Color Value") then
					Child.Color = Child[StandName.."'s Color Value"].Value
					Child[StandName.."'s Color Value"]:Destroy()
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
			if Child:FindFirstChild(StandName.."'s Size Value") then
				Child.Size = Child[StandName.."'s Size Value"].Value
				Child[StandName.."'s Size Value"]:Destroy()
			end
			if Child:FindFirstChild(StandName.."'s Transparency Value") then
				Child.Transparency = Child[StandName.."'s Transparency Value"].Value
				Child[StandName.."'s Transparency Value"]:Destroy()
			end
			if Child:FindFirstChild(StandName.."'s Color Value") then
				Child.Color = Child[StandName.."'s Color Value"].Value
				Child[StandName.."'s Color Value"]:Destroy()
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
	if Character and Character ~= nil and Character:IsDescendantOf(workspace) then
		Unlock(Character)
	end
	TSConnections = {}
	TimeStopHits = {}
	TimeStopKnifes = {}
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
	StrongMUDA = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 7
	if PunchAfterBarrage == true then
		CreateSound(616593932, CurrentStand.Head, 6.5, 1, 3.545, false, false, "Strong Shout")
	else
		CreateSound(3182703798, CurrentStand.Head, 6.5, math.random(98,102)/100, 0, false, false, "Strong Shout")
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
	StrongMUDA = false
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

function KnifeThrow()
	if CurrentStand == nil then
		return
	end
	Move = true
	KnifeThrowing = true
	local WalkSpeed = Hum.WalkSpeed
	Hum.WalkSpeed = 6
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
		CreateSound(3299325484, CurrentStand.StandTorso, 10, 1, 0, false, false, "Throw SFX")
		local KnivesParent = Instance.new("Model")
		KnivesParent.Name = StandName.."'s Knives"
		KnivesParent.Parent = Head
		game:GetService("Debris"):AddItem(KnivesParent, TimeStopSeconds*2)
		for i = 1, 3 do
			local KnifePart = Instance.new("Part")
			KnifePart.Size = Vector3.new(1,1,3)
			KnifePart.Name = "Knife"
			KnifePart.Anchored = false
			KnifePart.CanCollide = false
			KnifePart.Massless = true
			KnifePart.Parent = KnivesParent
			KnifePart.CFrame = CurrentStand.StandTorso.CFrame * CFrame.new(-4+(1*i),-1,-2-math.sin(i*math.random(1,5)))
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
			if TimeStopped == false then
				KnifePart.Anchored = false
				local Velocity = Instance.new("BodyVelocity")
				Velocity.Name = "KnifeThrowing"
				Velocity.Parent = KnifePart
				Velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				Velocity.Velocity = KnifePart.CFrame.lookVector*Original
				coroutine.resume(coroutine.create(function()
					repeat 
						game:GetService("RunService").RenderStepped:Wait()
						Velocity.Velocity = KnifePart.CFrame.lookVector*Original
						Original = Original - 1.25
					until Velocity.Parent == nil or Original < 10
					Velocity:Destroy()
				end))
				game:GetService("Debris"):AddItem(KnifePart, 10)
			else
				KnifePart.Anchored = true
				table.insert(TimeStopKnifes, KnifePart)
			end
			local DidHit = false
			local Damage = math.random(40,70)
			KnifePart.Touched:Connect(function(Toucher)
				if DidHit == false and IsAHumanoid(Toucher) and IsAHumanoid(Toucher) ~= Character and IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid").Health > 0 then
					DidHit = true
					local DoDamage = true
					local Humanoid = IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid")
					local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
					if Humanoid.Parent:FindFirstChild("ReturnStandDamage") then
						if Humanoid.Parent.ReturnStandDamage.Value == true then
							local Val = Instance.new("StringValue")
							Val.Name = "RTZActive"
							Val.Parent = Hum.Parent
							Val.Value = "Missed Hit"
							game:GetService("Debris"):AddItem(Val, 0.2)
							if Hum.MaxHealth > 10000 then
								Hum.Parent:BreakJoints()
							end
							CreateSound(201858024, Root, 3, math.random(95,113)/100, 0, false, false, "Hit SFX")
							if Damage == "Instant Kill" then
								Hum.Parent:BreakJoints()
							else
								Hum:TakeDamage(Damage)
							end
							DoDamage = false
						end
					end
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
							DoDamage = false
						end
					end
					if DoDamage == true then
						if KnifePart:FindFirstChild("KnifeThrowing") then
							KnifePart.KnifeThrowing:Destroy()
						end
						Glue(Toucher, KnifePart)
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
	KnifeThrowing = false
	Hum.WalkSpeed = WalkSpeed
	for i = 0,1,0.3 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2, 1.3, 3), 0.3)
	end
	Move = false
end

function RoadRoller()
	if CurrentStand == nil then
		return
	end
	if TimeStopped == false then 
		return
	end
	Move = true
	RoadRollering = true
	
	local Roller = OriginalRoller:Clone()
	Roller.Parent = Character
	
	
	RoadRollering = false
	Move = false
	if TimeStopped == true and Move == false then
		TimeResume()
	end
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
		if workspace.IsTimeStopped.Value ~= Player.Name and Root.Anchored == true and Head.Anchored == true then
			return
		end
	end
	if Move == false then
		Punch()
	end
end)

Mouse.KeyDown:Connect(function(Key)
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value ~= Player.Name and Root.Anchored == true and Head.Anchored == true then
			return
		end
	end
	if Key == "q" and Move == false then
		Stand()
	end
	if Key == "e" and Move == false then
		BarrageDown = true
		Barrage(69, false, 2998977755, true)
	end
	if Key == "t" and Move == false then
		if workspace:FindFirstChild("IsTimeAccelerating") then
			if workspace.IsTimeAccelerating.Value ~= Player.Name then
				return
			end
		end
		if workspace:FindFirstChild("IsTimeStopped") then
			if workspace.IsTimeStopped.Value ~= Player.Name then
				return
			end
		end
		if TimeStopped == true then
			TimeResume()
		else
			TimeStop()
		end
	end
	if Key == "g" then
		if Head:FindFirstChild("b line") then
			return
		end
		local Chance = math.random(1, 5)
		local Id
		local Text
		if Chance == 1 then
			Id = 3000890097
			Text = "so guys we did it but at what cost i would say it's my sanity"
		elseif Chance == 2 then
			Id = 1841220649
			Text = "roblox uploaded.mp3"
		elseif Chance == 3 then
			Id = 1241856420
			Text = "yes.mp3                      "
		elseif Chance == 4 then
			Id = 4801222924
			Text = "some random language"
		elseif Chance == 5 then
			Id = 389421766
			Text = "yes daddy"
		end
		CreateSound(Id, Head, 7.5, 1, 0, false, false, "b line")
		CreateTextGui(Head, Text, 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(123, 123, 123), Enum.Font.Bodoni)
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
	if Key == "c" and TimeStopped == true then
		InstantResume()
	end
	if Key == "x" and Move == false then
		if Speeding == false then
			CreateSound(3163347496, Head, 10, 0, 0, true, true, "SPEEDMAN")
			OGWS = Hum.WalkSpeed
			Hum.WalkSpeed = 400
			Speeding = true
			CreateTextGui(Head, "BOI FAST MODE TIME", 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(30, 30, 255), Enum.Font.Bodoni)
		else
			if Head:FindFirstChild("SPEEDMAN") then
				Head.SPEEDMAN:Destroy()
			end
			Hum.WalkSpeed = OGWS
			Speeding = false
			CreateTextGui(Head, "sl0w", 2, Color3.fromRGB(255, 255, 255), Color3.fromRGB(123, 123, 123), Enum.Font.Bodoni)
		end
	end
end)

Mouse.KeyUp:Connect(function(Key)
	if Key == "e" then
		BarrageDown = false
	end
end)

function DeSpawn()
	if workspace:FindFirstChild("IsTimeStopped") then
		if workspace.IsTimeStopped.Value == Player.Name then
			workspace.IsTimeStopped:Destroy()
		end
	end
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
	if TimeStopped == true then
		InstantResume()
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
local Speederman = false
local HealthChanger = Hum.Health
Hum.HealthChanged:Connect(function()
	if Hum.Health < HealthChanger then
		local Chance = math.random(1, 22)
		local id
		local TP = 0
		if Chance == 1 then
			id = 1515053586
		elseif Chance == 2 then
			id = 597154815
		elseif Chance == 3 then
			id = 175272131
		elseif Chance == 4 then
			id = 4792539171
		elseif Chance == 5 then
			id = 2317719457
		elseif Chance == 6 then
			id = 2317719457
		elseif Chance == 7 then
			id = 1980850846
		elseif Chance == 8 then
			id = 3919693908
		elseif Chance == 9 then
			id = 527970724
		elseif Chance == 10 then
			id = 880951531
		elseif Chance == 11 then
			id = 401467311
		elseif Chance == 12 then
			id = 737938643
		elseif Chance == 13 then
			id = 581042222
		elseif Chance == 14 then
			id = 182309585
		elseif Chance == 15 then
			id = 18230960
		elseif Chance == 16 then
			id = 4006851441
		elseif Chance == 17 then
			id = 4018616850
		elseif Chance == 18 then
			id = 401468711
		elseif Chance == 19 then
			id = 1741722952
		elseif Chance == 20 then
			id = 4602905960
		elseif Chance == 21 then
			id = 4791128838
		elseif Chance == 22 then
			id = 4791153986
			TP = 8.5
		end
		CreateSound(id, Head, 6, 1, TP, false, false, "Yikes Hurt")
	end
	HealthChanger = Hum.Health
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
		Hum.Health = Hum.Health + 0.1
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
		if (BarrageDown == true or StrongMUDA == true or NormalPunch == true or KnifeThrowing == true) and PunchAfterBarrage == false then
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.75), 0.23)
		end
	end
	if Move == false then
		if Anim == "Idle" then
			if CurrentStand ~= nil then
				--CurrentStand:SetPrimaryPartCFrame(Root.CFrame * CFrame.new(-2, 1.3, 3))
				CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(-2.2, 1.3, 2.25), 0.2)
				CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.new(0, 0, 0.8*math.sin(Sine/75))*CFrame.Angles(math.rad(30*math.sin(Sine/8)), 0, math.rad(-30*math.sin(Sine/8))), 0.23)
				CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(0, math.rad(-20*math.sin(Sine/11)), 0), 0.23)
				CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg, 0.23)
				CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-90*math.sin(-Sine/-22)), 0, math.rad(22*math.sin(-Sine/-10))), 0.23)
				CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-90*math.sin(Sine/22)), math.rad(22*math.sin(Sine/-10)), 0), 0.23)
				CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.Angles(math.rad(30*math.sin(Sine/10)), math.rad(22*math.sin(-Sine/10)), 0), 1)
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
	if Character:FindFirstChild("CanDodge") == nil then
		local DdogeCharacter = Instance.new("BoolValue")
		DdogeCharacter.Name = "CanDodge"
		DdogeCharacter.Value = true
		DdogeCharacter.Parent = Character
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
	if (Torso.Velocity.X > 2 or Torso.Velocity.Z > 2 or Torso.Velocity.X < -2 or Torso.Velocity.Z < -2) and Speeding == true then
		if Speederman == false then
			Speederman = true
			Head.SPEEDMAN.TimePosition = 6
		end
		if Head:FindFirstChild("SPEEDMAN") then
			Head.SPEEDMAN:Resume()
		end
	elseif Torso.Velocity.X < 2 and Torso.Velocity.Z < 2 and Torso.Velocity.X > -2 and Torso.Velocity.Z > -2 and Speeding == true then
		if Head:FindFirstChild("SPEEDMAN") then
			Speederman = false
			if Head.SPEEDMAN.TimePosition > 5.6 then
				Head.SPEEDMAN.TimePosition = 0.4
			end
		end
	end
end)