local RemoveIt = script:WaitForChild("RemoveIt").Value
local Object = script:WaitForChild("Object").Value

if RemoveIt == false then
	local Box = Instance.new("SelectionBox")
	Box.Color3 = Color3.fromRGB(188, 0, 0)
	Box.LineThickness = 0.125
	Box.SurfaceColor3 = Box.Color3
	Box.Transparency = 0.8
	Box.SurfaceTransparency = 0.8
	Box.Name = "Killer Queen's Touched Indexer"
	Box.Parent = Object
	Box.Adornee = Box.Parent
else
	if Object:FindFirstChild("Killer Queen's Touched Indexer") then
		Object["Killer Queen's Touched Indexer"]:Destroy()
	end
end