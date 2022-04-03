---@diagnostic disable: undefined-global
--# selene: allow(almost_swapped, divide_by_zero, duplicate_keys, empty_if, global_usage, if_same_then_else, ifs_same_cond, multiple_statements, mismatched_arg_count, parenthese_conditions, roblox_incorrect_color3_new_bounds, roblox_incorrect_roact_usage, shadowing, incorrect_standard_library_use, suspicious_reverse_loop, type_check_inside_call, unbalanced_assignments, undefined_variable, unscoped_variables, unused_variable)
-- File used for experiementing developer experience while using the library; what should it look like?

-- local balls = require('balls').v1
-- local balls = require('balls/v1')

local err, response = some_function()
-- stylua: ignore
if err then handleBug(err) else handleSuccess(response) end
