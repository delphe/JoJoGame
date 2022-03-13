local Char = script:WaitForChild("Char").Value

function Glue(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end

for Index, Child in next, Char:GetDescendants() do
	if Child:IsA("BasePart") and Child.Name ~= "RootPart" and Child.Name ~= "HumanoidRootPart" then
		--[[
		if Child:FindFirstChild("REALTRANS") then
			Child.Transparency = Child.REALTRANS.Value
		else
			Child.Transparency = 0
		end
		]]
		Child.Transparency = 0.7
		--[[
		local A = Child:Clone()
		A:ClearAllChildren()
		A.Material = Enum.Material.ForceField
		A.Anchored = false
		A.CanCollide = false
		A.Massless = true
		A.Transparency = 0
		A.Color = Color3.fromRGB(255, 0, 0)
		A.Name = "GER_Visibility"
		A.Parent = Child
		Glue(Child, A)
		game:GetService("Debris"):AddItem(A, 1.75)
		]]
	end
end