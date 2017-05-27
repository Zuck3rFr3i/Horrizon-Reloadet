addEvent("system:getPlayerLogin", true)
addEventHandler("system:getPlayerLogin", root, function(username, pass)
  local pSerial = getPlayerSerial(client)
  local data, rows = mysql_get("SELECT * FROM accountdata WHERE username=?", username)
  if data and rows >= 1 then
    local dbpass = data[1]["password"]
    if dbpass then
      if dbpass == pass then
        local playerElem = client
        triggerEvent("system:setupPlayerData", client, playerElem, pSerial)
        triggerClientEvent("system:closelogin", client)
      else
        outputChatBox("#FF4000[Horrizon]: #FFAF00Das angegebene #FF0000Passwort #FFAF00stimmt mit dem Account nicht überrein!", client, 0, 0, 0, true)
      end
    end
  else
    outputChatBox("#FF4000[Horrizon]: #FFAF00Der angegebene #FF0000Account #FFAF00Existiert nicht!", client, 0, 0, 0, true)
  end
end)
