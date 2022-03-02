-- Disable the player list / leaderboard
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

-- If we want to have a custom leaderboard, we can use the script below 
----- but we would want to position it so it doesn't cover the move list

-- Variables
--local playerListButton = script.Parent:WaitForChild("PlayerListButton")

--local playerListFrame = script.Parent:WaitForChild("MainFrame")

---- Open/Close Gui
--playerListButton.ImageButton.MouseButton1Click:Connect(function()
--	if playerListFrame.Position == UDim2.new(1.2,0,0.01,0) then
--		playerListFrame:TweenPosition(UDim2.new(.99,0,0.01,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
--	elseif playerListFrame.Position == UDim2.new(.99,0,0.01,0) then
--		playerListFrame:TweenPosition(UDim2.new(1.2,0,0.01,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
--	end
--end)

---- Updating the leaderboard
--while wait(1) do
--	-- Deletes everything until we make a frame
--	for _, plrFrame in pairs(playerListFrame.PlayerHolder:GetChildren()) do
--		if plrFrame:IsA("Frame") then
--			plrFrame:Destroy()
--		end
--	end
	
--	-- Making a frame for the player
--	for i, plr in pairs(game.Players:GetPlayers()) do
--		local template = script:WaitForChild("Template"):Clone()
--		template.Name = plr.Name
--		template.PlayerPicture.Image = game.Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
--		template.PlayerPicture.PlayerName.Text = plr.Name
--		template.Parent = playerListFrame.PlayerHolder
--	end
	
--	if #game.Players:GetPlayers() >= 7 then
--		playerListFrame.PlayerHolder.CanvasSize = UDim2.new(0,0,1.05 + ((#game.Players:GetPlayers()-7) * .15),0)
--	else
--		playerListFrame.PlayerHolder.CanvasSize = UDim2.new(0,0,0,0)
--	end
--end