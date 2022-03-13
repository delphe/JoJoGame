local ReplicatedStorage = game:GetService("ReplicatedStorage")
local storeStandEvent = ReplicatedStorage:WaitForChild("StoreStandEvent")

script.Parent.MouseButton1Click:Connect(function()
	storeStandEvent:Fire(script.Parent)	
end)