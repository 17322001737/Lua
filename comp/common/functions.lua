function Class(...)
	local obj = {}
	local __comps = ... and {...} or {}
	obj.New = function()
		local self = {}
		self.__comps = __comps
		self.__comps[#self.__comps + 1] = obj
		setmetatable(self, {__index = function(t, k) return Loot(self.__comps, k) end})

		return self
	end

	return obj
end

function Loot(bag, key)
	for _, v in ipairs(bag) do
		if v[key] then return v[key] end
	end
end

function Component()
	local self = {}
	self.__index = self

	return self
end