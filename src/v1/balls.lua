local u = require('./../utils')
-- local Err = u.Err
-- local Ok = u.Ok
-- local printTable = u.printTable

-- selene: allow(unscoped_variables)
balls = {}
balls.__index = balls

balls.new = function(key)
	assert(type(key) == 'string', 'key must be a string')
	local instance = setmetatable({}, balls)
	instance.key = key
	return instance
end

function balls:base_function()
	return 's'
end

local j = balls.new('asda'):base_function()

print(j)
