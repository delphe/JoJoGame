-->Made By XDavodioX<--
 
--=(Category = Fun, Action)=--
 
--:Brain Power Man:--
 
--//Unknown\\--

script:WaitForChild("Stand")
script:WaitForChild("MoveList")
script:WaitForChild("FeModule")
local OriginalStand = script["Stand"]:Clone()
wait(0.25)
script["Stand"]:Destroy()

require(script.FeModule)()

local StandName = "BRAINMAN"
local ModelCreator = "SOMEONE"

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

local MoveList = script["MoveList"]
MoveList.Parent = Player:FindFirstChildOfClass("PlayerGui")
MoveList.Enabled = true

script.Name = Player.Name.."'s "..StandName

warn("Huge Credit to "..ModelCreator.." for the "..StandName.." Model! \nGo check them out!")

local AttackSpeed = 1.2
local Sine = 0

local StandRequire = 2939778387

local CurrentStand = nil
local Move = false
local BarrageDown = false
local Anim = "Idle"
local StrongPunching = false
local NormalPunch = false
local StarFingerMove = false
local PunchAfterBarrage = false
local Discing = false
local MouseHold = false
local CurrentDisc = nil
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
					if Child:IsA("BasePart") and Child.Name ~= "Gun" and Child.Name ~= "Disc" then
						Child.Transparency = FadeArm.Transparency
					elseif Child:IsA("Texture") then
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
		if Humanoid.Health < 19 and Humanoid.Health > 0 then
			Humanoid.Health = Humanoid.Health + 18.5
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

function CreateHitBox(Cframe, Damage, Size, DebrisTime, Overwrite, Effect, HitSound, HitType, EffectColor, DoSteal)
	if Overwrite == true then
		if CurrentStand:FindFirstChild(StandName.."'s Hit Box") then
			CurrentStand[StandName.."'s Hit Box"]:Destroy()
		end
	end
	local Stealing = DoSteal or false 
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
		if IsAHumanoid(Toucher) and IsAHumanoid(Toucher) ~= Character and IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid").Health > 0 then
			HB:Destroy()
			local Humanoid = IsAHumanoid(Toucher):FindFirstChildOfClass("Humanoid")
			local HitTorso = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso")
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
			if Stealing == false then
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
			elseif Stealing == true then
				if Humanoid.Parent:FindFirstChild("StandValue") then
					if CurrentDisc == nil then
						if Humanoid.Parent["StandValue"].Value == "The World Over Heaven" or Humanoid.Parent["StandValue"].Value == "Made In Heaven" or Humanoid.Parent["StandValue"].Value == "Golden Experience Requiem" then
							CreatePopUpGui(Toucher, "FadeOut", "Blocked", Color3.fromRGB(70, 70, 70))
							return
						end
						CurrentDisc = Humanoid.Parent["StandValue"].Value
						local MessagePart = Instance.new("Part")
						MessagePart.Transparency = 1
						MessagePart.Anchored = true
						MessagePart.CanCollide = false
						MessagePart.Size = Vector3.new(1,1,1)
						MessagePart.CFrame = Toucher.CFrame * CFrame.new(0, 1.5, 0)
						MessagePart.Parent = workspace
						CreatePopUpGui(MessagePart, "FadeOut", "Stole "..Humanoid.Parent["StandValue"].Value, Color3.fromRGB(0, 0, 199))
						coroutine.resume(coroutine.create(function()
							for i = 1, 10 do
								local Ran = math.random(1,2)
								if Ran == 1 then
									CreateEffect(MessagePart, "Slice", Color3.fromRGB(199, 199, 199))
								else
									CreateEffect(MessagePart, "Slice", Color3.fromRGB(155, 155, 155))
								end
							end
						end))
						game:GetService("Debris"):AddItem(MessagePart, 1.35)
						local StandPlayer = game:GetService("Players"):GetPlayerFromCharacter(Humanoid.Parent)
						local Frame = HitTorso.CFrame
						StandPlayer:LoadCharacter()
						if StandPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("MoveList") then
							StandPlayer:FindFirstChildOfClass("PlayerGui")["MoveList"].Enabled = false
						end
						if StandPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("ClockGui") then
							StandPlayer:FindFirstChildOfClass("PlayerGui")["ClockGui"].Enabled = false
						end
						local NewChar = workspace:WaitForChild(StandPlayer.Name)
						NewChar:SetPrimaryPartCFrame(Frame)
					else
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
				else
					if CurrentDisc == nil then
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
					else
						local NoStandPlayer = game:GetService("Players"):GetPlayerFromCharacter(Humanoid.Parent)
						if NoStandPlayer then
							CurrentStand["Left Arm"].Disc.Transparency = 1
							CreateSound(2042706607, Toucher, 6.5, 1, 0, false, false, "Shockwave SFX")
							coroutine.resume(coroutine.create(function()
								for i = 1, 15 do
									game:GetService("RunService").RenderStepped:Wait()
									local Ran = math.random(1,2)
									if Ran == 1 then
										CreateEffect(HitTorso, "Slice", Color3.fromRGB(199, 199, 199))
									else
										CreateEffect(HitTorso, "Slice", Color3.fromRGB(155, 155, 155))
									end
								end
							end))
							if CurrentDisc == "The World" then
								require(StandRequire)("TW2", NoStandPlayer.Name)
							elseif CurrentDisc == "Star Platinum" then
								require(StandRequire)("SP", NoStandPlayer.Name)
							elseif CurrentDisc == "Crazy Diamond" then
								require(StandRequire)("CD", NoStandPlayer.Name)
							elseif CurrentDisc == "King Crimson" then
								require(StandRequire)("KC", NoStandPlayer.Name)
							elseif CurrentDisc == "Whitesnake" then
								require(StandRequire)("WS", NoStandPlayer.Name)
							elseif CurrentDisc == "Made In Heaven" then
								require(StandRequire)("MIH", NoStandPlayer.Name)
							elseif CurrentDisc == "Noob Platinum" then
								require(StandRequire)("NP", NoStandPlayer.Name)
							elseif CurrentDisc == "Flamingo Platinum" then
								require(StandRequire)("FP", NoStandPlayer.Name)
							elseif CurrentDisc == "Steve Platinum" then
								require(StandRequire)("STV", NoStandPlayer.Name)
							elseif CurrentDisc == "Rainbow Puncher" then
								require(StandRequire)("RP", NoStandPlayer.Name)
							elseif CurrentDisc == "C-Moon" then
								require(StandRequire)("CM", NoStandPlayer.Name)
							elseif CurrentDisc == "The Hand" then
								require(StandRequire)("TH", NoStandPlayer.Name)
							elseif CurrentDisc == "Golden Experience" then
								require(StandRequire)("GE2", NoStandPlayer.Name)  
							end
							CurrentDisc = nil
						else
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
					end
				end
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
		for Index,Child in next, CurrentStand:GetDescendants() do
			if Child:IsA("BasePart") or Child:IsA("Decal") then
				Child.Transparency = 1
			end
		end
		CurrentStand:SetPrimaryPartCFrame(Root.CFrame)
		CreateSound(1118989395, CurrentStand.PrimaryPart, 5, 1, 0.3, true, true, "Stand Music")
		CurrentStand.Parent = Head
		for Index,Child in next, CurrentStand:GetDescendants() do
			if (Child:IsA("BasePart") or Child:IsA("Decal") or Child:IsA("Texture")) and Child.Name ~= "RootPart" then
				coroutine.resume(coroutine.create(function(Part)
					for i = 1, 25 do
						game:GetService("RunService").RenderStepped:Wait()
						Part.Transparency = Part.Transparency - 0.04
					end
					Part.Transparency = 0
				end), Child)
			end
		end
		if CurrentDisc ~= nil then
			coroutine.resume(coroutine.create(function(Part)
				for i = 1, 25 do
					game:GetService("RunService").RenderStepped:Wait()
					Part.Transparency = Part.Transparency - 0.04
				end
				Part.Transparency = 0
			end), CurrentStand["Left Arm"].Disc)
		end
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
			if Child:IsA("BasePart") or Child:IsA("Decal") or Child:IsA("Texture") then
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
	if CurrentStand.PrimaryPart:FindFirstChild("Stand Music") then
		CurrentStand.PrimaryPart["Stand Music"]:Pause()
	end
	local BarrageSound = CreateSound(BarrageSFX, CurrentStand.Head, 5.25, 1, 0, not NeutralStop, not NeutralStop, "Barrage Shout")
	BarrageSound.Ended:Connect(function()
		if NeutralStop == true then
			Done = true
		end
	end)
	if NeutralStop == false and External == true then
		BarrageSound.TimePosition = 95.19
		coroutine.resume(coroutine.create(function()
			while BarrageSound do
				game:GetService("RunService").RenderStepped:Wait()
				if BarrageSound.TimePosition > 127.83 then --106.53
					BarrageSound:Pause()
					BarrageSound.TimePosition = 95.19
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
	repeat
		game:GetService("RunService").RenderStepped:Wait()
		Repeat = Repeat - 1
		CreateHitBox(CurrentStand.PrimaryPart.CFrame * CFrame.new(0, 0, -2.35), math.random(4,9), Vector3.new(4.2,3.4,4), 0.35, true, "Ball", 2974875851, "Barrage", Color3.fromRGB(255, 255, 255))
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
	if CurrentStand.PrimaryPart:FindFirstChild("Stand Music") then
		CurrentStand.PrimaryPart["Stand Music"]:Resume()
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

function ShootGun()
	if CurrentStand == nil then
		return
	end
	local Damage = math.random(40,70)
	Move = true
	coroutine.resume(coroutine.create(function()
		CreateSound(3606135620, CurrentStand["Right Arm"].Gun, 4, 1, 0, false, false, "Gun Equip SFX")
		for i = 1, 22 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand["Right Arm"].Gun.Transparency = CurrentStand["Right Arm"].Gun.Transparency - 0.15
		end
	end))
	local Chance = math.random(1, 100)
	if Chance < 3 then
		CreateSound(3559772665, CurrentStand["Right Arm"].Gun, 3, 1, 0, false, false, "Meme Gun SFX")
	end
	wait(0.1)
	Lock(Character)
	repeat
		for i = 0,1,0.05*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart.CFrame = CurrentStand.RootPart.CFrame:Lerp(CFrame.new(CurrentStand.RootPart.CFrame.p, Vector3.new(Mouse.Hit.p.X, CurrentStand.RootPart.Position.Y, Mouse.Hit.p.Z)) * CFrame.new(0, 0, 0), i)
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0, i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.953), 0, 0), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-3.037), 0, 0), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-1.776), 0, 0), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(0, math.rad(4.354), math.rad(89.725)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head, i)
		end
		local GunRay = Ray.new(CurrentStand["Right Arm"].Gun.Position, (Mouse.Hit.p - CurrentStand["Right Arm"].Gun.Position).unit*500)
		local Hit, Pos = workspace:FindPartOnRay(GunRay, Character)
		local GunDistance = (Mouse.Hit.p - CurrentStand["Right Arm"].Gun.Position).magnitude
		local Shoot = Instance.new("Part")
		Shoot.Material = Enum.Material.Neon
		Shoot.BrickColor = BrickColor.new("Neon orange")
		Shoot.Name = StandName.."'s Bullet"
		Shoot.Size = Vector3.new(0.6, 0.6, GunDistance)
		Shoot.CFrame = CFrame.new(CurrentStand["Right Arm"].Gun.Position, Mouse.Hit.p)
		Shoot.CFrame = Shoot.CFrame*CFrame.new(0, 0.55, -GunDistance/2)
		Shoot.Transparency = 0.25
		Shoot.Anchored = true
		Shoot.CanCollide = false
		local Mesh = Instance.new("SpecialMesh")
		Mesh.MeshType = Enum.MeshType.Sphere
		Mesh.Parent = Shoot
		Shoot.Parent = workspace
		game:GetService("Debris"):AddItem(Shoot, 0.28)
		CreateSound(4144238684, CurrentStand["Right Arm"].Gun, 4, 1, 0, false, false, "Gun Fire SFX")
		if Hit ~= nil and IsAHumanoid(Hit) and not Hit:IsDescendantOf(Character) then
			local Humanoid = IsAHumanoid(Hit):FindFirstChildOfClass("Humanoid")
			local DoDamage = true
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
					CreatePopUpGui(Hit, "FadeOut", "Miss", Color3.fromRGB(199, 199, 199))
					DoDamage = false
				end
			end
			if DoDamage == true then
				CreateSound(3092866899, Hit, 3, math.random(99,103)/100, 0, false, false, "Bullet Hit SFX")
				Humanoid:TakeDamage(Damage)
				CreatePopUpGui(Hit, "Jump", tostring(Damage), Color3.fromRGB(188, 0, 0))
			end
		end
		for i = 0,1,0.09*AttackSpeed/0.75 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand.RootPart.CFrame = CurrentStand.RootPart.CFrame:Lerp(CFrame.new(CurrentStand.RootPart.CFrame.p, Vector3.new(Mouse.Hit.p.X, CurrentStand.RootPart.Position.Y, Mouse.Hit.p.Z)) * CFrame.new(0, 0, 0), i)
			CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0, i)
			CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.953), 0, 0), i)
			CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-3.037), 0, 0), i)
			CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-1.776), 0, 0), i)
			CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(math.rad(-1.948), math.rad(3.896), math.rad(116.425)), i)
			CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head, i)
		end
	until MouseHold == false
	coroutine.resume(coroutine.create(function()
		for i = 1, 22 do
			game:GetService("RunService").RenderStepped:Wait()
			CurrentStand["Right Arm"].Gun.Transparency = CurrentStand["Right Arm"].Gun.Transparency + 0.15
		end
	end))
	Unlock(Character)
	CreateSound(3606135620, CurrentStand["Right Arm"].Gun, 4, 0.89, 0, false, false, "Gun Equip SFX")
	for i = 0,1,0.18*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart.CFrame = CurrentStand.RootPart.CFrame:Lerp(CFrame.new(CurrentStand.RootPart.CFrame.p, Vector3.new(Mouse.Hit.p.X, CurrentStand.RootPart.Position.Y, Mouse.Hit.p.Z)) * CFrame.new(0, 0, 0), i)
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0, i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.Angles(math.rad(-3.953), 0, 0), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.Angles(math.rad(-3.037), 0, 0), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.Angles(math.rad(-1.776), 0, 0), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.Angles(0, math.rad(4.354), math.rad(89.725)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head, i)
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
	Hum.WalkSpeed = 7
	local OML = CreateSound(3140574182, CurrentStand.Head, 6.5, 1, 91.85, false, false, "Strong Shout")
	game:GetService("Debris"):AddItem(OML, 1.4)
	for i = 0,1,0.05*AttackSpeed/0.75 do
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
	for i = 0,1,0.04*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(33.289), math.rad(-11.631), math.rad(-18.908)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.056, -0.008, 0.011) * CFrame.Angles(math.rad(11.918), math.rad(17.704), math.rad(12.089)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.971, 0.512, -0.238) * CFrame.Angles(math.rad(-10.6), math.rad(13.522), math.rad(-11.173)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(-0.615, 0.279, -0.164) * CFrame.Angles(math.rad(-9.683), math.rad(-21.772), math.rad(-98.721)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.145, 0.078, 0.013) * CFrame.Angles(math.rad(-30.309), math.rad(-14.897), math.rad(5.157)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-24.465), math.rad(4.183), math.rad(25.783)), i)
	end
	for i = 0,1,0.08*AttackSpeed/0.75 do
		game:GetService("RunService").RenderStepped:Wait()
		CurrentStand.RootPart["Root Joint"].C0 = CurrentStand.RootPart["Root Joint"].C0:Lerp(AnimDefaults.tors0*CFrame.Angles(math.rad(35.008), math.rad(0.172), math.rad(-1.547)), i)
		CurrentStand.StandTorso["Left Hip"].C0 = CurrentStand.StandTorso["Left Hip"].C0:Lerp(AnimDefaults.lleg*CFrame.new(0.055, -0.008, -0.009) * CFrame.Angles(math.rad(2.75), math.rad(5.386), math.rad(14.037)), i)
		CurrentStand.StandTorso["Right Hip"].C0 = CurrentStand.StandTorso["Right Hip"].C0:Lerp(AnimDefaults.rleg*CFrame.new(0.977, 0.511, -0.028) * CFrame.Angles(math.rad(-3.037), math.rad(3.151), math.rad(-12.662)), i)
		CurrentStand.StandTorso["Left Shoulder"].C0 = CurrentStand.StandTorso["Left Shoulder"].C0:Lerp(AnimDefaults.larm*CFrame.new(0.571, -0.22, 0.493) * CFrame.Angles(math.rad(152.922), math.rad(46.238), math.rad(119.462)), i)
		CurrentStand.StandTorso["Right Shoulder"].C0 = CurrentStand.StandTorso["Right Shoulder"].C0:Lerp(AnimDefaults.rarm*CFrame.new(0.306, 0.057, 0.008) * CFrame.Angles(math.rad(2.807), math.rad(66.349), math.rad(84.74)), i)
		CurrentStand.StandTorso.Neck.C0 = CurrentStand.StandTorso.Neck.C0:Lerp(AnimDefaults.head*CFrame.new(0.049, 0.007, -0.004) * CFrame.Angles(math.rad(-23.377), math.rad(0.573), math.rad(7.678)), i)
	end
	StrongPunching = false
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
	if workspace:FindFirstChild("IsTimeErased") then
		if workspace.IsTimeErased.Value ~= Player.Name then
			return
		end
	end
	if Move == false then
		Punch()
	end
end)

Mouse.Button1Up:Connect(function()
	MouseHold = false
end)

Mouse.KeyDown:Connect(function(Key)
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
	if Key == "q" and Move == false then
		Stand()
	end
	if Key == "e" and Move == false then
		BarrageDown = true
		Barrage(250, false, 3140574182, true)
	end
	if Key == "t" and Move == false and CurrentDisc ~= nil and CurrentStand ~= nil then
		CreateSound(1571353313, CurrentStand.Head, 3, 1, 0, false, false, "Disc breaking")
		CurrentStand["Left Arm"].Disc.Transparency = 1
		coroutine.resume(coroutine.create(function()
			for i = 1, 4 do
				CreateEffect(CurrentStand["Left Arm"].Disc, "Slice", Color3.fromRGB(98, 98, 98))
			end
		end))
		CurrentDisc = nil
	end
	if Key == "f" and Move == false then
		
	end
	if Key == "r" and Move == false then
		StrongPunch()
	end
	if Key == "z" and Move == false then
		StandJump()
	end
	if Key == "j" then
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
		Hum.Health = Hum.Health + 0.2
	end
	if Move == true and CurrentStand ~= nil then
		if (BarrageDown == true or StrongPunching == true or NormalPunch == true or Discing == true) and PunchAfterBarrage == false then
			CurrentStand.PrimaryPart.CFrame = CurrentStand.PrimaryPart.CFrame:Lerp(Root.CFrame * CFrame.new(0, 0.5, -3.75), 0.23)
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
	if Character:FindFirstChild("StandValue") == nil then
		local StandValue = Instance.new("StringValue")
		StandValue.Name = "StandValue"
		StandValue.Value = StandName
		StandValue.Parent = Character
	end
end)