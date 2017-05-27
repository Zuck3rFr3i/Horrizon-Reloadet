addEvent("system:setupPlayerData", true)
addEventHandler("system:setupPlayerData", root, function(username, hashedpw, email, securo)
  if source ~= client then return end
  local pName = getPlayerName(client)
  local pSerial = getPlayerSerial(client)
  if pName and pSerial then
    local registerplayer = mysql_write("INSERT INTO accountdata VALUES(?,?,?,?,?,?,?)",
      _,
      pSerial,
      username,
      hashedpw,
      email,
      "n/a",
      securo
    )
    if registerplayer then
      local saveddata = mysql_get("SELECT * FROM accountdata WHERE serial=?", pSerial)
	  if saveddata then
		local uid = saveddata[1]["uid"]
		local spawn = "|0|0|5"
		if uid then
			local userdata = mysql_write("INSERT INTO userdata VALUES(?,?,?,?,?,?,?)",
				uid,
				pSerial,
				spawn,
				"|0|0|0|0|0|0",
				"|0|0|0|0|0|0",
				0,
				15000
			)
			if userdata then
        local playerElem = client
				triggerEvent("system:setupPlayerData", client, playerElem, pSerial)
				triggerClientEvent("system:closeregistration", client)
			end
		end
	  end
    else
      writesystemlog("Registration failed, dbExec error!", client)
    end
  end
end)
