local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")

shared["onGiveParticle"] = function(player, particle)
	onGiveParticle(player, particle)
end

-- Give player a particle from ServerStorage
function onGiveParticle(player, particle)
	--print(player.Name .. " fired the remote event")
	--print("particle: " .. particle)
	local Character = player.Character
	local rightArm
	local leftArm
	if Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		rightArm = Character:WaitForChild("RightLowerArm")
		leftArm = Character:WaitForChild("LeftLowerArm")

	else
		rightArm = Character:WaitForChild("Right Arm")
		leftArm = Character:WaitForChild("Left Arm")
	end
	game.ServerStorage[particle]:Clone().Parent = rightArm
	game.ServerStorage[particle]:Clone().Parent = rightArm
	game.ServerStorage[particle]:Clone().Parent = rightArm
	game.ServerStorage[particle]:Clone().Parent = leftArm
	game.ServerStorage[particle]:Clone().Parent = leftArm
	game.ServerStorage[particle]:Clone().Parent = leftArm

	player.inventory.Hamon.Value = true
end

remoteEvent.OnServerEvent:Connect(onGiveParticle)