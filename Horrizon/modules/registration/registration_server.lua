addEvent("system:setupPlayerData", true)
addEventHandler("system:setupPlayerData", root, function(username, hashedpw, email, securo)
  if source ~= client then
    writesystemlog("Registration failed, source is not the Client!", client)
    return
  end
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
      -- Setup other playerdata.
    else
      writesystemlog("Registration failed, dbExec error!", client)
    end
  end
end)
