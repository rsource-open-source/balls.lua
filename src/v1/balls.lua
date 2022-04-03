local Err = require('src.utils').Err
local Ok = require('src.utils').Ok

-- selene: allow(unscoped_variables)
balls = {}

balls.new = function(key)
	if key == nil then
		return Err('')
	end
end
