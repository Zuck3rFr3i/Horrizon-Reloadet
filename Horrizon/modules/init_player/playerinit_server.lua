addEvent("server:initplayer", true)
addEventHandler("server:initplayer", root, function()
	if source ~= client then
		writesystemlog("Playerinit Failed! Source is not the CLient!", source)
	end
	local playerSerial = getPlayerSerial(source)
	local getAccountstateplayer, rows = mysql_get("SELECT * FROM accountdata WHERE serial=?", playerSerial)
	if rows >= 1 then
		-- login
	else
		triggerClientEvent("system:newPlayer", source)
		triggerClientEvent("server:setbackground", source)
	end
end)