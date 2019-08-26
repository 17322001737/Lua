function BaseClass(super)
	if super ~= nil then
		super.__index = super
	else
		super = {}
		-- super.New = function(...) end
		super.Constructor = function(obj, ...) end
		super.Destructor = function(obj, ...) end
		super.__index = super
	end

	local obj = {
		Constructor = function(obj, ...) end,
		Destructor = function(obj, ...) end,
		super = super
	}

	obj.New = function(...)
		if obj.super.Constructor ~= nil then
			obj.super:Constructor(obj, ...)
		end
		obj:Constructor()

		return obj
	end
	setmetatable(obj, super)

	return obj
end