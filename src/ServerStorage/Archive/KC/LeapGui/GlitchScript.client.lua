local Glitch = script.Parent:WaitForChild("KC")

local Images = {4573462670, 4573463247, 4573464191, 4573465237, 4573466633, 4573467848, 4573468665, 4573469255, 4573469861, 4573470481, 4573472230, 4573472712, 4573473408, 4573474618, 4573475743, 4573476483, 4573476928, 4573477493}
--Thanks to Player_57 ^

for i = 1, #Images do
	Glitch.Image = "rbxassetid://"..Images[i]
	wait(0.014)
	if i == #Images then
		coroutine.resume(coroutine.create(function()
			wait(0.06)
			Glitch.Image = ""
		end))
	end
end


