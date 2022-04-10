local GUI = script.Parent.Parent
script.Parent.MouseButton1Click:Connect(function()
	if GUI.MovesList.List.Visible == true then
		GUI.MovesList.List.Visible = false	
		GUI.YesNo.Visible = false
		GUI.question.Visible = false
	else
		GUI.MovesList.List.Visible = true
		GUI.YesNo.Visible = true
		GUI.question.Visible = true
	end
end)