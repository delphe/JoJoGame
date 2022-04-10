local Player = script:WaitForChild("Player").Value
local Give = script:WaitForChild("ToGive").Value
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local swapStandValueRemoveEvent = ReplicatedStorage:WaitForChild("SwapStandValueRemoveEvent")

swapStandValueRemoveEvent:FireClient(Player,Player,Give)
