local c = require('../constants')
local u = require('../utils')

-- selene: allow(unscoped_variables)
balls = {}

---@param init string
-- Sets the api key for the client.
balls.new = function(init)
	-- assert(type(init) == 'string', 'parameter must be a string')

	local self = {
		token = init,
		header = { { 'Content-Type', 'application/json' }, { 'api-key', init } },
	}

	local v1 = {

		url = c.API_URL .. '/v1',

		raw = function(path)
			return u.request(c.API_URL .. path, self.header)
			-- return self.header, path
		end,
	}

	return {
		v1 = v1,
	}
end

-- print(u.table_to_string(balls.new('FAKE_API_KEY').v1.raw('s')))
