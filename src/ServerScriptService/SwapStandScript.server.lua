local StandRequire = game.ReplicatedStorage.MainJoJoModule
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local swapStandRemoteEvent = ReplicatedStorage:WaitForChild("SwapStandRemoteEvent")
local removeStandRemoteEvent = ReplicatedStorage:WaitForChild("RemoveStandRemoteEvent")
local giveStandRemoteEvent = ReplicatedStorage:WaitForChild("GiveStandRemoteEvent")
local disableGuiRemoteEvent = ReplicatedStorage:WaitForChild("DisableGuiRemoteEvent")

shared["removeStand"] = function(player)
	removeStand(player)
end
function removeStand(player)
	if player.Character:FindFirstChild("StandValue") then
		local StandScript = player.Character[player.Name.."'s "..player.Character["StandValue"].Value]
		StandScript.Disabled = true
		StandScript:Destroy()
		player.Character.StandValue:Destroy()
		local standModel = player.Character.Head:FindFirstChild(player:WaitForChild("stand").Value) 
		if player.Character:FindFirstChild("CanDodge") then
			player.Character.CanDodge:Destroy()
		end
		if player.Character:FindFirstChild("IsTSImmune") then
			player.Character.IsTSImmune:Destroy()
		end
		if player.Character:FindFirstChild("CanDodgeInTS") then
			player.Character.CanDodgeInTS:Destroy()
		end
		if standModel then
			standModel:Destroy()
		end
		player.Character.StandInputClient.Disabled = true
		player.Character.StandInput:Destroy()
		player.Character.GetClientPropertyStandInput:Destroy()
		player:WaitForChild("stand").Value = ""
		disableGuiRemoteEvent:FireClient(player, "all")
	end
end

function giveStand(player, Give)
	require(StandRequire)(Give, player.Name)
end

shared["onSwapStand"] = function(player, Give)
	onSwapStand(player, Give)
end
function onSwapStand(player, Give)
	removeStand(player)
	giveStand(player, Give)
end

giveStandRemoteEvent.OnServerEvent:Connect(giveStand)
removeStandRemoteEvent.OnServerEvent:Connect(removeStand)
swapStandRemoteEvent.OnServerEvent:Connect(onSwapStand)