local ReplicatedStorage = game:GetService("ReplicatedStorage")
local standStorageRemoteEvent = ReplicatedStorage:WaitForChild("StandStorageRemoteEvent")
local standImagRemoteFunction = ReplicatedStorage:WaitForChild("StandImagRemoteFunction")

shared["onStoreStand"] = function(player, stand, storageUnit)
	onStoreStand(player, stand, storageUnit)
end
function onStoreStand(player, stand, storageUnit)
	--storage units created when player enters, using DataStoreScript
	player.storage[storageUnit].Value = stand
end

shared["getStandImage"] = function(player, stand)
	return getStandImage(player, stand)
end
function getStandImage(player, stand)
	--TODO: add all other stands as they are created
	if stand == nil then
		stand = player.stand.Value
	end
	if stand == "OREO" then
		return "rbxassetid://9073562739"
	elseif stand == "JLM" then
		return "rbxassetid://9041628316"
	elseif stand == "STEVE" then
		return "rbxassetid://9091887450"
	elseif stand == "SANS" then
		return "rbxassetid://9091887988"
	elseif stand == "SPR" then
		return "rbxassetid://9091887758"
	else
		return "rbxassetid://97544973"
	end
end

standStorageRemoteEvent.OnServerEvent:Connect(onStoreStand)
standImagRemoteFunction.OnServerInvoke = getStandImage