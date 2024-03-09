local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Scarlet = require(ReplicatedStorage.Scarlet)

local Button = Scarlet.element("BUTTONEXAMPLE")

function Button:init()
	Button.state.counter = 0
end

function Button:draw()
	return {
		class = "TextButton",
		props = {
			Size = UDim2.fromScale(0.5, 0.5),
			Text = Button.state.counter,
		},
	}
end

function Button.events.MouseButton1Click()
	Button.state.counter += 1
	Button:render()
end

return Button
