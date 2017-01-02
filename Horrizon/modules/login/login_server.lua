ae("System_Player:checklogin", true)
aeh("System_Player:checklogin", root, function(str_pass, str_user)
	local str_userserial = getPlayerSerial(client)
	local user_tbldata = msql_gettbl("SELECT * FROM account_data WHERE serial=? AND username=?", str_userserial, str_user)
	if user_tbldata then
		local str_writtenpass = user_tbldata[1]["password"]
		if str_writtenpass == str_pass then
			-- set Player Datas / spawn player etc.
		else
			-- wrong password
		end
	end
end)