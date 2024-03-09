local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Scarlet = require(ReplicatedStorage.Scarlet)

local Gui = Scarlet.element("GUIEXAMPLE")

function Gui:draw()
	return {
		class = "ScreenGui",
		props = {
			Enabled = true,
		},
	}
end

return Gui
