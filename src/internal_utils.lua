local http = require('http')
local utils = {}

function utils:request(url, callback)
	local req = http.request(url)
	if req then
		callback(req)
	else
		print('Error: ' .. url)
	end
end

return utils
