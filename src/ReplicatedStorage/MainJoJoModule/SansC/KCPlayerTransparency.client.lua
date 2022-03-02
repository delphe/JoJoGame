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