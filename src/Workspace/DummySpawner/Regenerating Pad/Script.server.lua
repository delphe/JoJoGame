local Debris = game:GetService("Debris")
local Dummy = script.Parent.Parent:WaitForChild("Dummy")
local Clone = Dummy:Clone()
Dummy.Parent = workspace

while true do
	Dummy:WaitForChild("Humanoid").Died:Wait()
	Debris:AddItem(Dummy, 3)
	task.wait(3)
	Dummy = Clone:Clone()
	Dummy:MakeJoints()
	Dummy:SetPrimaryPartCFrame(script.Parent.CFrame + Vector3.new(0, 2.7, 0))
	Dummy.Parent = workspace
end