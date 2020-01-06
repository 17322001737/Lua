function BaseClass(super)
	if super ~= nil then
		super.__index = super
	else
		super = {}
		-- super.New = function(...) end
		super.Ctor = function(obj, ...) end
		super.Dtor = function(obj, ...) end
		super.__index = super
	end

	local obj = {
		Ctor = function(obj, ...) end,
		Dtor = function(obj, ...) end,
		super = super
	}

	obj.New = function(...)
		if obj.super.Ctor ~= nil then
			obj.super:Ctor(obj, ...)
		end
		obj:Ctor()

		return obj
	end
	setmetatable(obj, super)

	return obj
end