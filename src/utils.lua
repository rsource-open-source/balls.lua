--# selene: allow(multiple_statements)
-- stylua: ignore start
function Err(err)	return err, nil end
function Ok(res) return nil, res end
-- stylua: ignore end

return {
	Err = Err,
	Ok = Ok,
}
