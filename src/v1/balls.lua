local c = require('../constants')
local u = require('../utils')
-- testing
local envkey = require('../../env.lua')

balls = {}

---@param init string
-- Sets the api key for the client.
balls.client = function(init)
	-- assert(type(init) == 'string', 'parameter must be a string')

	local self = {
		token = init,
		header = { { 'Content-Type', 'application/json' }, { 'api-key', init } },
	}

	v1 = {

		url = c.API_URL .. '/v1',

		---@param path string
		---@type table
		raw = function(path)
			return coroutine.create(u.request('GET', v1.url .. path, self.header, '')) -- ('GET', v1.url .. path, self.header, '')
			-- return coro.request('GET', v1.url .. path, self.header, '')
		end,
	}

	return {
		v1 = v1,
	}
end

print(balls.client(envkey).v1.raw('/time/recent'))
