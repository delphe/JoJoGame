--https://www.youtube.com/watch?v=DkYupSBUpes
_G.inventoryTable = {"Hamon"}
_G.standStorageTable = {"OERO","JLM","STEVE","SANS"}
_G.storageSlots = 10
local DataStoreService = game:GetService("DataStoreService")
local myDataStore = DataStoreService:GetDataStore("myDataStore")
--local dataTable = {"playersKilled","skillPoints"}
--local topPlayer = game.ServerScriptService.topPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")
local StandRequire = ReplicatedStorage:WaitForChild("MainJoJoModule")

function addToolToInventory(tool, player)
	local backpack = player:WaitForChild("Backpack")
	game.ServerStorage[tool]:Clone().Parent = backpack
end

function addParticles(tool, player)
	repeat wait() until shared["onGiveParticle"]
	shared.onGiveParticle(player,"Hamon")	
end

--function loadIntValInFolder(val, folder, player)
--	local value = Instance.new("IntValue")
--	value.Name = val
--	value.Parent = folder

--	local valData
--	local success, errormessage = pcall(function()	
--		--leaderstats
--		valData = myDataStore:GetAsync(player.UserId.."-"..val)
--	end)

--	if success then	
--		value.Value = valData
--	else
--		print("error getting data")
--		warn(errormessage)
--	end

--end

function loadItemIfFound(item, folder, player, itemType)
	local boolItem = Instance.new("BoolValue")
	boolItem.Name = item
	boolItem.Parent = folder

	local itemData

	local success, errormessage = pcall(function()
		--inventory
		itemData = myDataStore:GetAsync(player.UserId.."-"..item)
	end)

	if success then
		--inventory
		boolItem.Value = itemData
		if boolItem.Value then
			if itemType == "tool" then
				addToolToInventory(item, player)
			elseif itemType == "particle" then
				addParticles(item, player)
			else
				--user has stands in storage
			end
			
		end		
	else
		print("error getting data")
		warn(errormessage)
	end
end

function loadStandIfFound(player)
	local stand = Instance.new("StringValue")
	stand.Name = "stand"
	stand.Parent = player

	local itemData

	local success, errormessage = pcall(function()
		itemData = myDataStore:GetAsync(player.UserId.."-stand")
	end)

	if success then
		stand.Value = itemData
		if stand.Value then
			require(StandRequire)(stand.Value, player.Name)
		end		
	else
		print("error getting data")
		warn(errormessage)
	end
end

function loadItemsInStorage(count, storageFolder, player)
	
	local storageStr = Instance.new("StringValue")
	storageStr.Name = count
	storageStr.Parent = storageFolder

	local itemData

	local success, errormessage = pcall(function()
		itemData = myDataStore:GetAsync(player.UserId.."-storage"..count)
	end)

	if success then
		storageStr.Value = itemData	
	else
		print("error getting data")
		warn(errormessage)
	end
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		--inventory
		local inventory = Instance.new("Folder")
		inventory.Name = "inventory"
		inventory.Parent = player

		for index, item in ipairs(_G.inventoryTable) do
			loadItemIfFound(item, inventory, player, "particle")
		end
		
		--storage
		local storageFolder = Instance.new("Folder")
		storageFolder.Name = "storage"
		storageFolder.Parent = player
		for count = 1, _G.storageSlots do
			loadItemsInStorage(count, storageFolder, player)
		end

		loadStandIfFound(player)

	end)

	--leaderstats
	--local leaderstats = Instance.new("Folder")
	--leaderstats.Name = "leaderstats"
	--leaderstats.Parent = player

	--local cash = Instance.new("IntValue")
	--cash.Name = "Money"
	--cash.Parent = leaderstats

	--local cashData
	--local topPlayerData

	--local success, errormessage = pcall(function()	
	--	--leaderstats

	--	cashData = myDataStore:GetAsync(player.UserId.."-cash")

	--	--Game data for all players
	--	topPlayerData = myDataStore:GetAsync("topPlayerData")

	--end)

	--if success then	
	--	--leaderstats
	--	cash.Value = cashData

	--	--Game data for all players
	--	topPlayer.Value = topPlayerData

	--else
	--	print("error getting data")
	--	warn(errormessage)
	--end

	--player's data
	--local data = Instance.new("Folder")
	--data.Name = "data"
	--data.Parent = player

	--for index, val in ipairs(dataTable) do
	--	loadIntValInFolder(val, data, player)
	--end	

end)

game.Players.PlayerRemoving:Connect(function(player)
	local success, errormessage = pcall(function()
		--inventory
		for index, item in ipairs(_G.inventoryTable) do
			myDataStore:SetAsync(player.UserId.."-"..item,player.inventory[item].Value)
		end
		
		for count = 1, _G.storageSlots do
			myDataStore:SetAsync(player.UserId.."-storage"..count,player.storage[count].Value)
		end

		--stand
		myDataStore:SetAsync(player.UserId.."-stand",player.stand.Value)

		--leaderstats
		--myDataStore:SetAsync(player.UserId.."-cash",player.leaderstats.Money.Value)

		--Game data for all players
		--myDataStore:SetAsync("topPlayerData",topPlayer.Value)

		--data
		--for index, val in ipairs(dataTable) do
		--	myDataStore:SetAsync(player.UserId.."-"..val,player.inventory[val].Value)
		--end
	end)

	if success then
		print("Data saved")
	else
		print("error saving data")
		warn(errormessage)
	end

end)