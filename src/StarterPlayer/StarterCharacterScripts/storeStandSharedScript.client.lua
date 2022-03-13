local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local requiemArrowEvent = ReplicatedStorage:WaitForChild("RequiemArrowEvent"):Clone()
local swapStandRemoteEvent = ReplicatedStorage:WaitForChild("SwapStandRemoteEvent")
local removeStandRemoteEvent = ReplicatedStorage:WaitForChild("RemoveStandRemoteEvent")
local giveStandRemoteEvent = ReplicatedStorage:WaitForChild("GiveStandRemoteEvent")
local standStorageRemoteEvent = ReplicatedStorage:WaitForChild("StandStorageRemoteEvent")
local storeStandEvent = ReplicatedStorage:WaitForChild("StoreStandEvent")
local standImagRemoteFunction = ReplicatedStorage:WaitForChild("StandImagRemoteFunction")

local Debounce = true -- debouce will prevent the function from running again until it's complete.
local function storeStand(storageUnit)
	if Debounce then
		Debounce = false
		local standAlreadyStored = false
		local storageUnitValue = player:WaitForChild("storage")[storageUnit.Name].Value
		local playerStand = player:WaitForChild("stand")
		if storageUnitValue ~= "" then
			--print("stand found in storage unit")
			standAlreadyStored = true
		else
			standAlreadyStored = false
			--print("NO stand found in storage unit!")
		end

		if standAlreadyStored == false and playerStand.Value == "" then
			storageUnit.Parent.ChatBox.Text = "It looks like you don't have any stands to store here. Go find one!"
			wait(0.8)
			Debounce = true
			return
		end

		if playerStand.Value ~= "" then
			--display image of stored stand
			storageUnit.Image = standImagRemoteFunction:InvokeServer(nil)
			storageUnit.Parent.ChatBox.Text = "I'll hang on to that stand for you!"
		end

		local playersExistingStand = playerStand.Value
		if standAlreadyStored and playersExistingStand ~= "" then
			--print("stand is stored here and player has a stand. Swap them out.")
			requiemArrowEvent.Player.Value = player
			requiemArrowEvent.ToGive.Value = storageUnitValue
			requiemArrowEvent.Parent = game:GetService("ServerScriptService")
			requiemArrowEvent.Disabled = false
			swapStandRemoteEvent:FireServer(requiemArrowEvent.ToGive.Value)
		elseif standAlreadyStored == false and playersExistingStand ~= "" then
			--print("player has a stand and wants to store it")
			removeStandRemoteEvent:FireServer()
		elseif standAlreadyStored and playersExistingStand == "" then
			--print("stand is stored here but player doesn't have a stand. Give player the stored stand.")
			requiemArrowEvent.Player.Value = player
			requiemArrowEvent.ToGive.Value = storageUnitValue
			requiemArrowEvent.Parent = game:GetService("ServerScriptService")
			requiemArrowEvent.Disabled = false
			giveStandRemoteEvent:FireServer(requiemArrowEvent.ToGive.Value)
			storageUnit.Image = "rbxassetid://97544973" -- set image back to default
		end

		standStorageRemoteEvent:FireServer(playersExistingStand, storageUnit.Name)
		
		wait(0.8) -- may need to increase if the script takes longer to complete than 0.8 seconds
		Debounce = true
	end
end

storeStandEvent.Event:Connect(storeStand)