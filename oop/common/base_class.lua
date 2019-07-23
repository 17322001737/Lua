function BaseClass(super)
	if super ~= nil then
		super.__index = super
	else
		super = {}
		super.__index = super
	end

	local self = {
		Constructor = function() end,
		Destructor = function() end,
	}
	self.New = function(view_name)
		if view_name ~= nil then
			ViewManager:RegisterView(view_name, self)
		end
		self:Constructor()

		return self
	end
	setmetatable(self, super)

	return self
end