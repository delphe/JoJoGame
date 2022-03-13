local Char = script:WaitForChild("Char").Value
local Locally = game:GetService("Players").LocalPlayer

if Locally ~= game:GetService("Players"):GetPlayerFromCharacter(Char) then
	for Inded, Child in next, Char:GetDescendants() do
		if Child:IsA("BasePart") or Child:IsA("Decal") then
			Child.Transparency = 1
		end
	end
end

function ConnectCharacter(Character)
	for Index, Child in next, Character:GetDescendants() do
		if Child:IsA("BasePart") then
			local MaterialValue = Instance.new("StringValue")
			MaterialValue.Name = "KC_Material"
			MaterialValue.Value = string.sub(tostring(Child.Material), 15)
			MaterialValue.Parent = Child
			local ColorValue = Instance.new("Color3Value")
			ColorValue.Name = "KC_Color"
			ColorValue.Value = Child.Color
			ColorValue.Parent = Child
			Child.Material = Enum.Material.ForceField
			Child.Color = Color3.fromRGB(255, 0, 0)
			Child:GetPropertyChangedSignal("Material"):Connect(function()
				if workspace:FindFirstChild("IsTimeErased") then
					Child.Material = Enum.Material.ForceField
				end
			end)
			Child:GetPropertyChangedSignal("Color"):Connect(function()
				if workspace:FindFirstChild("IsTimeErased") then
					Child.Color = Color3.fromRGB(255, 0, 0)
				end
			end)
		end
	end
end

function CreateClone(Character)
	Character.Archivable = true
	local NewClone = Character:Clone()
	NewClone.Name = "KC_ClonedCharacter"
	Character.Archivable = false
	NewClone.Parent = workspace
	local Humanoid = NewClone:FindFirstChildOfClass("Humanoid")
	Humanoid:ClearAllChildren()
	Humanoid.MaxHealth = 9e999
	Humanoid.Health = Humanoid.MaxHealth
	Humanoid.AutoRotate = false
	Humanoid.PlatformStand = true
	Humanoid.BreakJointsOnDeath = false
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
	for I,C in next, NewClone:GetChildren() do
		if not C:IsA("BasePart") and not C:IsA("Accessory") and not C:IsA("Pants") and not C:IsA("ShirtGraphic") and not C:IsA("Shirt") and not C:IsA("Humanoid") then
			C:Destroy()
		end
	end
	for Index, Child in next, NewClone:GetDescendants() do
		if Child:IsA("BasePart") then
			if Child.Transparency ~= 1 then
				Child.Transparency = 0.2
			end
			Child.Name = "KC_ClonedPart"
			Child.Anchored = true
			Child.CastShadow = false
			Child.CanCollide = false
			Child.Massless = true
			Child.BackSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.RightSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.TopSurface = Enum.SurfaceType.SmoothNoOutlines
			Child.Material = Enum.Material.SmoothPlastic
		elseif Child:IsA("Decal") then
			Child.Transparency = 0.2
		elseif Child:IsA("Script") then
			Child.Disabled = true
			Child:Destroy()
		elseif Child:IsA("ForceField") then
			Child:Destroy()
		elseif Child:IsA("JointInstance") then
			Child:Destroy()
		elseif Child:IsA("Attachment") then
			Child:Destroy()
		elseif Child:IsA("Sound") then
			Child:Destroy()
		elseif Child:IsA("BillboardGui") then
			Child:Destroy()
		end
	end
	coroutine.resume(coroutine.create(function()
		for i = 1, 50 do
			game:GetService("RunService").RenderStepped:Wait()
			for Index, Child in next, NewClone:GetDescendants() do
				if Child:IsA("BasePart") then
					if Child.Transparency ~= 1 then
						Child.Transparency = Child.Transparency + 0.03
					end
				elseif Child:IsA("Decal") then
					if Child.Transparency ~= 1 then
						Child.Transparency = Child.Transparency + 0.03
					end
				end
			end
		end
		NewClone:Destroy()
	end))
end

for Index, Player in next, game:GetService("Players"):GetPlayers() do
	if Player ~= game:GetService("Players"):GetPlayerFromCharacter(Char) then
		Player.CharacterAdded:Connect(function()
			wait(0.1)
			ConnectCharacter(Player.Character)
		end)
		if Player.Character then
			ConnectCharacter(Player.Character)
		end
	end
end

while wait(0.28) do
	for Index, Player in next, game:GetService("Players"):GetPlayers() do
		if Player ~= game:GetService("Players"):GetPlayerFromCharacter(Char) then
			if Player.Character then
				CreateClone(Player.Character)
			end
		end
	end
end