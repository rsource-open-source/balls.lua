--# selene: allow(multiple_statements)
-- stylua: ignore start
function Err(err)	return err, nil end
function Ok(res) return nil, res end
-- stylua: ignore end

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

return {
	parseToURLArgs = parseToURLArgs,
	Err = Err,
	Ok = Ok,
}
