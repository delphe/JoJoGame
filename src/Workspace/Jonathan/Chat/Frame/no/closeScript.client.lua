local ChatFrame = script.Parent.Parent.Parent.Frame
script.Parent.MouseButton1Click:Connect(function()
	ChatFrame.ChatBox.Text = "Okay! Bye!"
	wait(2)
	script.Parent.Parent.Parent:Destroy()
end)