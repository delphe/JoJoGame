local ReplicatedStorage = game:GetService("ReplicatedStorage")
local standStorageRemoteEvent = ReplicatedStorage:WaitForChild("StandStorageRemoteEvent")
local standImagRemoteFunction = ReplicatedStorage:WaitForChild("StandImagRemoteFunction")
local setStandValueRemoveEvent = ReplicatedStorage:WaitForChild("SetStandValueRemoveEvent")

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
		return "rbxassetid://9202002939"
	elseif stand == "JLM" then
		return "rbxassetid://9041628316"
	elseif stand == "STV" then
		return "rbxassetid://9091887450"
	elseif stand == "SANS" then
		return "rbxassetid://9091887988"
	elseif stand == "FLAV" then
		return "rbxassetid://9321416326"
	elseif stand == "FLAVR" then
		return "rbxassetid://9202003284"
	elseif stand == "FLAVD" then
		return "rbxassetid://9321416744"
	elseif stand == "SPR" then
		return "rbxassetid://9091887758"
	else
		return "rbxassetid://97544973"
	end
end

function setStandValue(player, value)
	player.stand.Value = value
end

standStorageRemoteEvent.OnServerEvent:Connect(onStoreStand)
standImagRemoteFunction.OnServerInvoke = getStandImage
setStandValueRemoveEvent.OnServerEvent:Connect(setStandValue)