local Moves = script.Parent.Parent
script.Parent.MouseButton1Click:Connect(function()
	if Moves.List.Visible == true then
		Moves.List.Visible = false	
		Moves.YesNo.Visible = false
		Moves.question.Visible = false
	else
		Moves.List.Visible = true
		Moves.YesNo.Visible = true
		Moves.question.Visible = true
	end
end)