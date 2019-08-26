function BaseClass(super)
	if super ~= nil then
		super.__index = super
	else
		super = {}
		super.New = function(...) end
		super.Constructor = function(self, ...) end
		super.Destructor = function(self, ...) end
		super.__index = super
	end

	local self = {
		Constructor = function(...) end,
		Destructor = function(...) end,
		super = super
	}

	self.New = function(...)
		if self.super.New ~= nil and self.super.Constructor ~= nil then
			self.super.New()
			self.super.Constructor(self, ...)
		end
		self:Constructor()

		return self
	end
	setmetatable(self, super)

	return self
end