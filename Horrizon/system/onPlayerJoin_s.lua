ae("System_Player:CheckAccountStat", true)
aeh("System_Player:CheckAccountStat", root, function(elem_player)
	local str_pname = getPlayerName(elem_player)
	local str_pserial = getPlayerSerial(elem_player)
	local server_settings = msql_gettbl("SELECT * FROM server_settings")
	local int_whitelist = server_settings[1]["mode_whitelist"]
	local account_data, int_rows = msql_gettbl("SELECT * FROM account_data WHERE serial=?", str_pserial)
	
end)