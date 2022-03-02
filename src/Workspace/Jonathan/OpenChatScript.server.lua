local ChatWindow = script.Parent.Chat

function onClicked(player)	
	local chatBox = ChatWindow.Frame.ChatBox
	chatBox.Text = "Hey, do you want some Specks?"
		
	local clonedChat = ChatWindow:Clone()
	clonedChat.Parent = player.PlayerGui
	
	wait(15)
	clonedChat:Destroy()
	
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)