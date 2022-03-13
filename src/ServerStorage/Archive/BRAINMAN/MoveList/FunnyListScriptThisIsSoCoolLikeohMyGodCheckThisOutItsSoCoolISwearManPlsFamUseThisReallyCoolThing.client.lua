local Location = script.Parent:WaitForChild("Moves")

local H = {"h","H"}
local O = {"o","O","0"}
local W = {"w","W"}
local Bruh = {"!","?","!?","?!"}
local ColorFam = {
	Color3.fromRGB(255, 152, 220),
	Color3.fromRGB(255, 0, 191),
	Color3.fromRGB(107, 50, 124),
	Color3.fromRGB(255, 152, 220),
	Color3.fromRGB(170, 0, 170)
}

function Connect(Label)
	coroutine.resume(coroutine.create(function()
		local First = string.sub(Label.Text, 1, 4)
		while Label do
			game:GetService("RunService").RenderStepped:Wait()
			Label.Rotation = math.random(-7, 7)
			Label.Text = First..""..H[math.random(1,#H)]..""..O[math.random(1,#O)]..""..W[math.random(1,#W)]..""..Bruh[math.random(1,#Bruh)]
			Label.TextColor3 = ColorFam[math.random(1,#ColorFam)]
		end
	end))
end

for Index, Child in next, Location:GetChildren() do
	if Child:IsA("TextLabel") then
		coroutine.resume(coroutine.create(function()
			Connect(Child)
		end))
	end
end