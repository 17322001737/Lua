function dump_t(t)
    if next(t) == nil then return "table -> {}" end
    local str
    for k, v in pairs(t) do
        if str then
            str = str .. ", "
        else
            str = "table -> { "
        end
        str = str .. "[" .. k .. "]" .. " = " .. get_value(v)
    end
    str = str .. " }"

    return str
end

function dump_s(s)
    local ts = getmetatable(s)
    if next(ts) == nil then return "userdata -> {}" end
    local str
    for k, v in pairs(ts) do
        if string.match(k, "__") == nil and type(s[k]) ~= "userdata" then
            if str then
                str = str .. ", "
            else
                str = "userdata -> { "
            end
            str = str .. "[" .. k .. "]" .. " = " .. get_value(s[k])
        end
    end
    str = str .. " }"

    return str
end

function get_value(param)
    if param == nil then return "nil" end
    local p_type = type(param)
    if p_type == "table" then
        return dump_t(param)
    elseif p_type == "userdata" then
        return dump_s(param)
    elseif p_type == "function" then
        return "function"
    end

    return tostring(param)
end

function print_error(...)
    local params = {...}
    local str
    for k = 1, select("#", ...) do
        if str then
            str = str .. ", "
        else
            str = ""
        end

        str = str .. get_value(params[k])
    end

    print(str)
end

local tab = {1, 2, 3, {po = "123", 1, 2, 3}}
print_error("===============", true, tab)