local ChatFrame = script.Parent.Parent.Parent.Frame
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")

script.Parent.MouseButton1Click:Connect(function()
	ChatFrame.ChatBox.Text = "Conquer fear and you may use this Hamon I give you!"

	remoteEvent:FireServer("Hamon")

	wait(3)
	ChatFrame.Parent:Destroy()
end)