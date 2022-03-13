local ChatWindow = script.Parent.Chat

function onClicked(player)	
	--local chatBox = ChatWindow.Frame.ChatBox
	--chatBox.Text = ""
	
	repeat wait() until shared["getStandImage"]
	for count = 1, _G.storageSlots do
		ChatWindow.Frame[count].Image = shared.getStandImage(player, player.storage[count].Value)	
	end
	
	local clonedChat = ChatWindow:Clone()
	clonedChat.Parent = player.PlayerGui
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)