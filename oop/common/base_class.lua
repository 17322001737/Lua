function BaseClass(super)
	if super ~= nil then
		super.__index = super
	else
		super = {}
		super.New = function(self, ...)
		end
		super.__index = super
	end

	local self = {
		Constructor = function() end,
		Destructor = function() end,
	}
	self.New = function(...)
		super.New(self, ...)
		self:Constructor()

		return self
	end
	setmetatable(self, super)

	return self
end