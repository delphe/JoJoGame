local SHA = script.Parent
local CFraming = SHA:FindFirstChildOfClass("BodyGyro")
local ConfigParent = SHA:WaitForChild("Stats")
local Exploded = false
local Config = {
	["Speed"] = ConfigParent.Speed.Value,
	["Ignore"] = ConfigParent.Ignore.Value,
	["Players"] = ConfigParent.AttackPlayers.Value,
	["Humanoids"] = ConfigParent.AttackHumanoids.Value
}

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

function MoveTowards(TargetPart)
	local Direction = (TargetPart.Position - SHA.Position).unit
	local CurrentPosition = SHA.Position
	local Position = CurrentPosition + Direction
	CFraming.CFrame = CFrame.new(Position,  Position + Direction)
	CFraming.MaxTorque = Vector3.new(9000, 9000, 9000)
end

function GetTargets(Position, Range, Ignore)
	local list = workspace:GetChildren()
	local MoveToPart = nil
	local dist = Range
	local Targets = {}
	for x = 1, #list do
		local CurrentObject = list[x]
		if CurrentObject:IsA("Model") and not CurrentObject:IsDescendantOf(Ignore) and CurrentObject ~= Ignore then
			local FoundHumanoid = CurrentObject:FindFirstChildOfClass("Humanoid")
			if FoundHumanoid ~= nil and FoundHumanoid.Health > 0 then
				local Torso = CurrentObject:FindFirstChild("Torso") or CurrentObject:FindFirstChild("UpperTorso")
				if Torso ~= nil and (Torso.Position - Position).magnitude < dist and Torso.Transparency < 0.9 and CurrentObject:FindFirstChild("ReturnStandDamage") == nil and Torso:FindFirstChildOfClass("Motor6D") then
					table.insert(Targets, CurrentObject)
				end
			end
		end
	end
	return Targets
end

function GetNearTargets(Position)
	local list = workspace:GetChildren()
	local MoveToPart = nil
	local dist = 500
	for x = 1, #list do
		local CurrentObject = list[x]
		if CurrentObject:IsA("Model") and not CurrentObject:IsDescendantOf(Config.Ignore) and CurrentObject ~= Config.Ignore then
			local FoundHumanoid = CurrentObject:FindFirstChildOfClass("Humanoid")
			if FoundHumanoid ~= nil and FoundHumanoid.Health > 0 then
				if game:GetService("Players"):GetPlayerFromCharacter(CurrentObject) ~= nil then
					if Config.Players == true then
						local Torso = CurrentObject:FindFirstChild("Torso") or CurrentObject:FindFirstChild("UpperTorso")
						if Torso ~= nil and (Torso.Position - Position).magnitude < dist and Torso.Transparency < 0.9 and CurrentObject:FindFirstChild("ReturnStandDamage") == nil and Torso:FindFirstChildOfClass("Motor6D") then
							MoveToPart = Torso
							dist = (Torso.Position - Position).magnitude
						end
					end
				else
					if Config.Humanoids == true then
						local Torso = CurrentObject:FindFirstChild("Torso") or CurrentObject:FindFirstChild("UpperTorso")
						if Torso ~= nil and (Torso.Position - Position).magnitude < dist and Torso.Transparency < 0.9 and CurrentObject:FindFirstChild("ReturnStandDamage") == nil and Torso:FindFirstChildOfClass("Motor6D") then
							MoveToPart = Torso
							dist = (Torso.Position - Position).magnitude
						end
					end
				end
			end
		end
	end
	if dist < 10 and Exploded == false and workspace:FindFirstChild("IsTimeStopped") == nil then
		Exploded = true
		local Val = Instance.new("BoolValue")
		Val.Name = "IsExploding"
		Val.Value = true
		Val.Parent = SHA
		game:GetService("Debris"):AddItem(Val, 3)
		CreateSound(920181099, SHA, 10, 1, 0, false, false, "SHA Click")
		spawn(function()
			wait(1)
			for Index, Humanoid in next, GetTargets(SHA.Position, 16, Config.Ignore) do
				coroutine.resume(coroutine.create(function()
					for Index, Child in next, Humanoid:GetChildren() do
						if Child:IsA("BasePart") then
							coroutine.wrap(function()
								local Repeats = 0
								local X = Child.Size.X
								local Y = Child.Size.Y
								local Z = Child.Size.Z
								repeat
									game:GetService("RunService").Heartbeat:Wait()
									Repeats = Repeats + 1
									Child.Size = Vector3.new(X+(math.random(-5,5)/10), Y+(math.random(-5,5)/10), Z+(math.random(-5,5)/10))
								until Repeats > 30 or Child == nil
							end)()
						end
					end
					wait(0.825)
					Humanoid:BreakJoints()
				end))
			end
			CreateSound(2686077452, SHA, 10, 1, 0, false, false, "SHA Explode")
			coroutine.resume(coroutine.create(function()
				wait(1)
				local Exp = Instance.new("Explosion")
				Exp.BlastPressure = 150
				Exp.BlastRadius = 0
				Exp.ExplosionType = Enum.ExplosionType.NoCraters
				Exp.Position = SHA.Position
				Exp.Parent = SHA
				game:GetService("Debris"):AddItem(Exp, 3)
			end))
		end)
		spawn(function()
			wait(5)
			Exploded = false
		end)
	end
	return MoveToPart
end

CreateSound(155279006, SHA, 6.5, 1, 0, true, true, "SHA Motor")

spawn(function()
	while wait(10) do
		if math.random(1, 2) == 1 then
			CreateSound(610470183, SHA, 10, 1, 0, false, false, "SHA Voiceline")
		end
	end
end)

while wait() do
	if workspace:FindFirstChild("IsTimeStopped") == nil then
		local Move = GetNearTargets(SHA.Position)
		if Move ~= nil then
			MoveTowards(Move)
			SHA.CFrame = SHA.CFrame * CFrame.new(0, 0, -(2*Config.Speed))
		end
	end
end
