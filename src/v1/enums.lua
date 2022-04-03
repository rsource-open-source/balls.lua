---@param p string
---@return string
-- Used to reverse search an enum.
-- ```lua
-- local aonly = un_sexy(STYLES.SEXY[6])
-- -- returns "aonly"
-- ```
function un_sexy(p)
	return p:lower():gsub('[ _]', '')
end

local GAMES = { ['bhop'] = 1, ['surf'] = 2, [1] = 'bhop', [2] = 'surf' }
local STATES = { [0] = 'default', [1] = 'whitelisted', [2] = 'blacklisted', [3] = 'pending' }

local RANKS = {
	SEXY = {
		'New',
		'Newb',
		'Bad',
		'Okay',
		'Not Bad',
		'Decent',
		'Getting There',
		'Advanced',
		'Good',
		'Great',
		'Superb',
		'Amazing',
		'Sick',
		'Master',
		'Insane',
		'Majestic',
		'Baby Jesus',
		'Jesus',
		'Half God',
		'God',
	},
	ENUM = {
		['new'] = 1,
		['newb'] = 2,
		['bad'] = 3,
		['okay'] = 4,
		['not_bad'] = 5,
		['decent'] = 6,
		['getting_there'] = 7,
		['advanced'] = 8,
		['good'] = 9,
		['great'] = 10,
		['superb'] = 11,
		['amazing'] = 12,
		['sick'] = 13,
		['master'] = 14,
		['insane'] = 15,
		['majestic'] = 16,
		['baby_jesus'] = 17,
		['jesus'] = 18,
		['half god'] = 19,
		['god'] = 20,
	},
}

local STYLES = {
	SEXY = { 'Autohop', 'Scroll', 'Sideways', 'Half-Sideways', 'W-Only', 'A-Only', 'Backwards' },
	ENUM = {
		['autohop'] = 1,
		['scroll'] = 2,
		['sideways'] = 3,
		['half_sideways'] = 4,
		['wonly'] = 5,
		['aonly'] = 6,
		['backwards'] = 7,
	},
}

-- Note on reverse searching enums, use the un_sexy function.
return {
	FUNCTIONS = {
		un_sexy = un_sexy,
	},
	GAMES = GAMES,
	STATES = STATES,
	RANKS = RANKS,
	STYLES = STYLES,
}
