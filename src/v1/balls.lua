-- local u = require('src.utils')
local c = require('src.constants')

-- selene: allow(unscoped_variables)
balls = {}
balls.__index = balls

---@param key string
-- Sets the api key for the client.
balls.new = function(key)
	assert(type(key) == 'string', 'parameter must be a string')
	local instance = setmetatable({}, balls)
	instance.key = key
	instance.header = c[2].insert_header(instance, key)
	return instance
end

print(balls.new('asdas').header)
