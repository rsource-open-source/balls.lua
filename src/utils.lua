local http = require('http')
local json = require('json')

-- stylua: ignore start
function Err(err)	return err, nil end
function Ok(res) return nil, res end
-- stylua: ignore end

---@param tb table
---@return string
function parseToURLArgs(tb)
	-- stylua: ignore
	if not tb then return Err('got nothing') end
	-- stylua: ignore
	if type(tb) ~= 'table' then return Err('expected table, got ' .. type(tb)) end
	local str = '?'
	local index = 1
	for key, value in pairs(tb) do
		if index == 1 then
			str = str .. key .. '=' .. tostring(value)
		else
			str = str .. '&' .. key .. '=' .. tostring(value)
		end
		index = index + 1
	end
	return Ok(str)
end

---@param method string
---@param url string
---@param headers table
---@param params string
function request(method, url, headers, params)
	local _, body = http.request(method, url, headers, params)
	return json.decode(body)
end

-- https://gist.github.com/justnom/9816256
-- Convert a lua table into a lua syntactically correct string
function table_to_string(tbl)
	local result = '{'
	for k, v in pairs(tbl) do
		-- Check the key type (ignore any numerical keys - assume its an array)
		if type(k) == 'string' then
			result = result .. '["' .. k .. '"]' .. '='
		end

		-- Check the value type
		if type(v) == 'table' then
			result = result .. table_to_string(v)
		elseif type(v) == 'boolean' then
			result = result .. tostring(v)
		else
			result = result .. '"' .. v .. '"'
		end
		result = result .. ','
	end
	-- Remove leading commas from the result
	if result ~= '' then
		result = result:sub(1, result:len() - 1)
	end
	return result .. '}'
end

return {
	parseToURLArgs = parseToURLArgs,
	Err = Err,
	Ok = Ok,
	request = request,
	table_to_string = table_to_string,
}
