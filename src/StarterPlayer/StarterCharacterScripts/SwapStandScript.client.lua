local StandRequire = game.ReplicatedStorage.MainJoJoModule
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local swapStandEvent = ReplicatedStorage:WaitForChild("SwapStandEvent")
local removeStandEvent = ReplicatedStorage:WaitForChild("RemoveStandEvent")
local giveStandEvent = ReplicatedStorage:WaitForChild("GiveStandEvent")
local disableGuiEvent = ReplicatedStorage:WaitForChild("DisableGuiEvent")
local setStandValueRemoveEvent = ReplicatedStorage:WaitForChild("SetStandValueRemoveEvent")
local swapStandValueRemoveEvent = ReplicatedStorage:WaitForChild("SwapStandValueRemoveEvent")
local Player = game:GetService("Players").LocalPlayer

function removeStand(player)
	if Player:FindFirstChild("stand") then
		local StandScript = Player:FindFirstChildOfClass("PlayerGui")[Player.Name.."'s "..Player.stand.Value]
		StandScript.Disabled = true
		StandScript:Destroy()
		Player.Character.StandValue:Destroy()
		local standModel = Player.Character.Head:FindFirstChild(Player.stand.Value) 
		if Player.Character:FindFirstChild("CanDodge") then
			Player.Character.CanDodge:Destroy()
		end
		if Player.Character:FindFirstChild("IsTSImmune") then
			Player.Character.IsTSImmune:Destroy()
		end
		if Player.Character:FindFirstChild("CanDodgeInTS") then
			Player.Character.CanDodgeInTS:Destroy()
		end
		if standModel then
			standModel:Destroy()
		end
		Player.Character.StandInputClient.Disabled = true
		setStandValueRemoveEvent:FireServer("")
		disableGuiEvent:Fire(Player)
	end
end

function giveStand(player, Give)
	setStandValueRemoveEvent:FireServer(Give)
	require(StandRequire)(Give, Player.Name)
end

function onSwapStand(player, Give)
	removeStand(Player)
	giveStand(Player, Give)
end

giveStandEvent.Event:Connect(giveStand)
removeStandEvent.Event:Connect(removeStand)
swapStandEvent.Event:Connect(onSwapStand)
swapStandValueRemoveEvent.OnClientEvent:Connect(onSwapStand)
