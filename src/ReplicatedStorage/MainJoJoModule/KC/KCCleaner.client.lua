local Char = script:WaitForChild("Char").Value

for Index, Child in next, Char:GetDescendants() do
	if Child:IsA("BasePart") or Child:IsA("Decal") then
		if Child:FindFirstChild("REALTRANS") then
			Child.Transparency = Child.REALTRANS.Value
		else
			Child.Transparency = 0
		end
	end
end

local Sound = Instance.new("Sound")
Sound.Name = "KC_Effect"
Sound.Parent = game:GetService("SoundService")
Sound.SoundId = "rbxassetid://3373991228"
Sound.Volume = 2
Sound.Looped = false
Sound.PlaybackSpeed = 1
Sound:Play()
game:GetService("Debris"):AddItem(Sound, Sound.TimeLength+1)

for Index, Child in next, workspace:GetDescendants() do
	if Child:IsA("Model") and Child.Name == "KC_ClonedCharacter" then
		Child:Destroy()
	elseif Child:IsA("BasePart") and Child.Name ~= "Baseplate" and Child.Name ~= "Base" then
		if Child.Name == "KC_EffectPart"   then
			Child:Destroy()
		end
		if Child:FindFirstChild("KC_Trans") then
			Child.Transparency = Child["KC_Trans"].Value
			Child["KC_Trans"]:Destroy()
		end
		if Child:FindFirstChild("KC_Anchor") then
			Child.Anchored = Child["KC_Anchor"].Value
			Child["KC_Anchor"]:Destroy()
		end
		if Child:FindFirstChild("KC_Collide") then
			Child.CanCollide = Child["KC_Collide"].Value
			Child["KC_Collide"]:Destroy()
		end
	elseif Child:IsA("Sound") then
		if Child:FindFirstChild("KC_Playing") then
			if Child["KC_Playing"].Value == true then
				Child:Resume()
			end
			Child["KC_Playing"]:Destroy()
		end
		if Child:FindFirstChild("KC_SoundMute") then
			Child["KC_SoundMute"]:Destroy()
		end
		if Child:FindFirstChild("KC_Pitcher") then
			Child["KC_Pitcher"]:Destroy()
		end
		if Child:FindFirstChild("KC_ReverbAdder") then
			Child["KC_ReverbAdder"]:Destroy()
		end
	end
end

for Index, Player in next, game:GetService("Players"):GetPlayers() do
	if Player.Character then
		coroutine.resume(coroutine.create(function()
			for Index, Child in next, Player.Character:GetDescendants() do
				if Child:IsA("BasePart") then
					if Child:FindFirstChild("KC_Material") then
						Child.Material = Child["KC_Material"].Value
						Child["KC_Material"]:Destroy()
					end
					if Child:FindFirstChild("KC_Color") then
						Child.Color = Child["KC_Color"].Value
						Child["KC_Color"]:Destroy()
					end
				end
			end
		end))
	end
end

if game:GetService("Lighting"):FindFirstChild("KC_SkyBox") then
	game:GetService("Lighting")["KC_SkyBox"]:Destroy()
end

workspace:FindFirstChildOfClass("Terrain").Transparency = 0
if workspace:FindFirstChild("Base") and workspace:FindFirstChild("Base"):IsA("BasePart") then
	workspace.Base.Transparency = 0
elseif workspace:FindFirstChild("Baseplate") and workspace:FindFirstChild("Baseplate"):IsA("BasePart") then
	workspace.Baseplate.Transparency = 0
end