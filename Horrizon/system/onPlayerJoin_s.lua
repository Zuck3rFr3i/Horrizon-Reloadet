ae("System_Player:CheckAccountStat", true)
aeh("System_Player:CheckAccountStat", root, function(elem_player)
	local str_pname = getPlayerName(elem_player)
	local str_pserial = getPlayerSerial(elem_player)
	local server_settings_tbl = msql_gettbl("SELECT * FROM server_settings")
	if server_settings_tbl then
		local int_whitelist = server_settings_tbl[1]["mode_whitelist"]
		local account_data, int_rows = msql_gettbl("SELECT * FROM account_data WHERE serial=?", str_pserial)
		if int_rows == 1 then
			local str_account = account_data[1]["username"]
			local strlastlogout = account_data[1]["lastlogout"]
			local rows = 1
			local userdata = {
				{user=str_account, lastlogout=strlastlogout}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows)
			end
			userdata = nil
		elseif int_rows == 2 then
			local str_account = account_data[1]["username"]
			local strlastlogout = account_data[1]["lastlogout"]
			local str_account2 = account_data[2]["username"]
			local strlastlogout2 = account_data[2]["lastlogout"]
			local rows = 2
			local userdata = {
				{user=str_account, lastlogout=strlastlogout},
				{user=str_account2, lastlogout=strlastlogout2}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows)
				userdata = nil
			end
		elseif int_rows == 3 then
			local str_account = account_data[1]["username"]
			local strlastlogout = account_data[1]["lastlogout"]
			local str_account2 = account_data[2]["username"]
			local strlastlogout2 = account_data[2]["lastlogout"]
			local str_account3 = account_data[3]["username"]
			local strlastlogout3 = account_data[3]["lastlogout"]
			local rows = 3
			local userdata = {
				{user=str_account, lastlogout=strlastlogout},
				{user=str_account2, lastlogout=strlastlogout2},
				{user=str_account3, lastlogout=strlastlogout3}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows)
				userdata = nil
			end
		else
			local rows = 0
			local userdata = {
				{user="N/A", lastlogout="N/A"}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows)
			end
		end
	end
end)