local Scarlet = {}

function Scarlet.element(name: string)
	local element = {
		_name = name,
		_tag = name,

		props = {},
		children = {},
		state = {},
		events = {},

		start = function() end,
		draw = function() end,
		init = function() end,
	}

	function element:mount(root)
		local elementProps = table.clone(root.props)
		elementProps.Parent = root

		local elementData = {
			_tag = table.concat({ root._name, name }, "/"),
			props = elementProps,
		}

		for i, v in elementData do
			element[i] = v
		end

		root.children[element._name] = element

		element:init()

		return element
	end

	function element:render()
		if element.component then
			element.component:Destroy()
		end

		local elementProps = element.props
		local sketch = element:draw()
		local object = Instance.new(sketch.class)
		object.Parent = if elementProps.Parent then elementProps.Parent.component else nil

		for property, value in sketch.props do
			object[property] = value
			elementProps[property] = value
		end

		for event, callback in element.events do
			object[event]:Connect(callback)
		end

		return object
	end

	return element
end

function Scarlet.init(root, parent)
	local children = {}

	for _, child in root:GetChildren() do
		children[child.Name] = require(child)
		Scarlet.init(child, root)
	end

	local tree = Scarlet._construct(require(root), children)
	tree.component.Parent = parent

	return tree
end

function Scarlet._construct(element, children)
	element.component = element:render(element.props)
	element:start()

	for _, child in children do
		Scarlet._construct(child:mount(element), child.children)
	end

	return element
end

return Scarlet
