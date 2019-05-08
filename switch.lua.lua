function Switch(index, ...)
	local calls = (...)
	if index ~= nil and calls ~= nil and calls[index] ~= nil then
		if calls[index] ~= nil and type(calls[index]) == "function" then
			calls[index]()
		end
	end
end

local block = {
	[1] = function ()
		print("111111111111111")
	end,
	[2] = function ()
		print("222222222222222")
	end
}

local result = 1
Switch(result, block)