local Dialog = workspace.Jonathan.Head.Dialog
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")

Dialog.DialogChoiceSelected:connect(function(player,choice)
	if choice.Name == "HamonYes" then
		remoteEvent:FireServer("Hamon")
	end
end)