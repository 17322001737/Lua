SORT_TYPE = {
	Upper = 1,
	Lower = 2,
}
local tab = {{id = 4, can_get = 1}, {id = 1, can_get = 0}, {id = 3,  can_get = 1}, {id = 5,  can_get = 0}, {id = 2,  can_get = 1}, {id = 6, can_get = 0}}
SortTools = {}
function SortTools.Sort(tab, ...)
	local params = (...)
	local sort_fun = function (a, b)
		local left = 1000
		local right = 1000
		local sort_type, sort_key
		for k, v in pairs(params) do
			sort_type = v[1]
			sort_key = v[2]
			if sort_type == SORT_TYPE.Upper then
				if a[v[2]] > b[sort_key] then
					left = left + (100 - k)
				elseif a[sort_key] < b[sort_key] then
					right = right + (100 - k)
				end
			elseif sort_type == SORT_TYPE.Lower then
				if a[sort_key] < b[sort_key] then
					left = left + (100 - k)
				elseif a[sort_key] > b[sort_key] then
					right = right + (100 - k)
				end
			end
		end

		return left > right
	end

	table.sort(tab, sort_fun)
end

SortTools.Sort(tab, {{SORT_TYPE.Upper, "can_get"}, {SORT_TYPE.Upper, "id"}})
for _, v in pairs(tab) do
	print(v.id .. " ---- " .. v.can_get)
end