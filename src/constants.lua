local constants = {
	API_URL = 'https://api.strafes.net/',
	API_BASE_HEADER = {
		{ 'Content-Type', 'application/json' },
		{ 'api-key', nil },
	},
}

local insert_constants = {
	insert_header = function(self, key)
		assert(type(key) == 'string', 'parameter must be a string')
		self.header = constants.API_BASE_HEADER
		self.header[2][2] = key
	end,
}

return { constants, insert_constants }
