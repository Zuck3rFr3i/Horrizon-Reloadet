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
			local str_lastlogout = account_data[1]["lastlogout"]
			local int_banned = account_data[1]["banned"]
			local rows = 1
			local userdata = {
				{user=str_account, lastlogout=str_lastlogout, status=int_banned}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows, int_banned)
			end
			userdata = nil
		elseif int_rows == 2 then
			local str_account = account_data[1]["username"]
			local str_lastlogout = account_data[1]["lastlogout"]
			local str_account2 = account_data[2]["username"]
			local str_lastlogout2 = account_data[2]["lastlogout"]
			local int_banned = account_data[1]["banned"]
			local int_banned2 = account_data[2]["banned"]
			local rows = 2
			local userdata = {
				{user=str_account, lastlogout=str_lastlogout, status=int_banned},
				{user=str_account2, lastlogout=str_lastlogout2, status=int_banned2}
			}
			if userdata then
				triggerClientEvent("System_Player:login", client, userdata, rows)
				userdata = nil
			end
		elseif int_rows == 3 then
			local str_account = account_data[1]["username"]
			local str_lastlogout = account_data[1]["lastlogout"]
			local str_account2 = account_data[2]["username"]
			local str_lastlogout2 = account_data[2]["lastlogout"]
			local str_account3 = account_data[3]["username"]
			local str_lastlogout3 = account_data[3]["lastlogout"]
			local int_banned = account_data[1]["banned"]
			local int_banned2 = account_data[2]["banned"]
			local int_banned3 = account_data[3]["banned"]
			local rows = 3
			local userdata = {
				{user=str_account, lastlogout=str_lastlogout, status=int_banned},
				{user=str_account2, lastlogout=str_lastlogout2, status=int_banned2},
				{user=str_account3, lastlogout=str_lastlogout3, status=int_banned3}
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
--[[
	Todo: Enable Admins to Ban every account of a player or just some of them!
]]
