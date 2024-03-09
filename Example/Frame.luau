local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Scarlet = require(ReplicatedStorage.Scarlet)

local Frame = Scarlet.element("FRAMEEXAMPLE")

function Frame:draw()
	return {
		class = "Frame",
		props = {
			Size = UDim2.fromScale(0.2, 0.2),
			BackgroundColor3 = Color3.new(0.5, 0.2, 0.9),
		},
	}
end

return Frame
