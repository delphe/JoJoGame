local Char = script:WaitForChild("Char").Value
local Locally = game:GetService("Players").LocalPlayer

if Locally ~= game:GetService("Players"):GetPlayerFromCharacter(Char) then
	for Inded, Child in next, Char:GetDescendants() do
		if Child:IsA("BasePart") or Child:IsA("Decal") then
			Child.Transparency = 1
		end
	end
end