local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:WaitForChild("ShopRemoteEvent")

-- Give player a particle from ServerStorage
local function onGiveParticle(player, particle)
	--print(player.Name .. " fired the remote event")
	--print("particle: " .. particle)
	local Character = player.Character
	if Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		game.ServerStorage[particle]:Clone().Parent = Character.RightLowerArm
		game.ServerStorage[particle]:Clone().Parent = Character.RightLowerArm
		game.ServerStorage[particle]:Clone().Parent = Character.RightLowerArm
		game.ServerStorage[particle]:Clone().Parent = Character.LeftLowerArm
		game.ServerStorage[particle]:Clone().Parent = Character.LeftLowerArm
		game.ServerStorage[particle]:Clone().Parent = Character.LeftLowerArm
	else
		game.ServerStorage[particle]:Clone().Parent = Character['Right Arm']
		game.ServerStorage[particle]:Clone().Parent = Character['Right Arm']
		game.ServerStorage[particle]:Clone().Parent = Character['Right Arm']
		game.ServerStorage[particle]:Clone().Parent = Character['Left Arm']
		game.ServerStorage[particle]:Clone().Parent = Character['Left Arm']
		game.ServerStorage[particle]:Clone().Parent = Character['Left Arm']
	end
	
end

-- Call "onCreatePart()" when the client fires the remote event
remoteEvent.OnServerEvent:Connect(onGiveParticle)