addEvent("server:initplayer", true)
addEventHandler("server:initplayer", root, function()
	if source ~= client then return end
	local playerSerial = getPlayerSerial(client)
	local getAccountstateplayer, rows = mysql_get("SELECT * FROM accountdata WHERE serial=?", playerSerial)
	if rows >= 1 then
		triggerClientEvent("system:resumedPlayer", client)
		triggerClientEvent("server:setbackground", client)
	else
		triggerClientEvent("system:newPlayer", client)
		triggerClientEvent("server:setbackground", client)
	end
end)
