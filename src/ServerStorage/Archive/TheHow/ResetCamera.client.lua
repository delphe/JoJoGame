local Camera = workspace.CurrentCamera

while wait() do
	pcall(function()
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").CameraOffset = Vector3.new(0,0,0)
		Camera.FieldOfView = 70
	end)
end