local Player = script:WaitForChild("Player").Value
local Give = script:WaitForChild("ToGive").Value
local StandRequire = game.ReplicatedStorage.MainJoJoModule

require(StandRequire)(Give, Player.Name)