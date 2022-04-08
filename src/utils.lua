local http = require('coro-http')
local json = require('json')

-- stylua: ignore start
function Err(err) return err, nil end
function Ok(res)  return nil, res end
-- stylua: ignore end

---@param tb table
---@return string
function parse_to_url_args(tb)
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
	local res, body = http.request(method, url, headers, params)
	return res, json.decode(body)
end

-- https://gist.github.com/justnom/9816256
-- Convert a lua table into a lua syntactically correct string
function table_to_string(tbl)
	local result = '{'
	for k, v in pairs(tbl) do
		-- Check the key type (ignore any numerical keys - assume its an array)
		if type(k) == 'string' then -- head hurt i stop reading text sorry i will still answer discord if there is anything jajaja
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
	parse_to_url_args = parse_to_url_args,
	Err = Err,
	Ok = Ok,
	request = request,
	table_to_string = table_to_string,
}
