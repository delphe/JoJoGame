local ChatWindow = script.Parent.Chat

function onClicked(player)	
	local chatBox = ChatWindow.Frame.ChatBox
	chatBox.Text = "If you truly wish to master Hamon, you must be prepared to die for it. Are you prepared to die?"
		
	local clonedChat = ChatWindow:Clone()
	clonedChat.Parent = player.PlayerGui
	
	wait(15)
	clonedChat:Destroy()
	
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)