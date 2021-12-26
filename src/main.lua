local j = require('utils')

print('Hello World')
j.utils:request('http://www.google.com', function(req)
	print(req)
end)
