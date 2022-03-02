local ChatFrame = script.Parent.Parent.Parent.Frame
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")

script.Parent.MouseButton1Click:Connect(function()
	ChatFrame.ChatBox.Text = "Here ya go!"

	remoteEvent:FireServer("Specks")

	wait(3)
	ChatFrame.Parent:Destroy()
end)