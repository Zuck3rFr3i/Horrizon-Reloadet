addEvent("system:setupPlayerData", true)
addEventHandler("system:setupPlayerData", root, function(playerElem, pSerial)
  local getData, rows = mysql_get("SELECT * FROM userdata WHERE serial=?", pSerial)
  if getData and rows >= 1 then
    local uid = getData[1]["uid"]
    local money = getData[1]["money"]
    local bankMoney = getData[1]["bankmoney"]
    local pkw
    local lkw
    local bike
    local heli
    local weapon
    local plane
    local xspawn
    local yspawn
    local zspawn
    for i, v in pairs(getData) do
      pkw, lkw, bike, heli, weapon, plane = tonumber(gettok(v.licences, 1, "|")), tonumber(gettok(v.licences, 2, "|")), tonumber(gettok(v.licences, 3, "|")), tonumber(gettok(v.licences, 4, "|")), tonumber(gettok(v.licences, 5, "|")), tonumber(gettok(v.licences, 6, "|"))
      xspawn, yspawn, zspawn = tonumber(gettok(v.spawn, 1, "|")), tonumber(gettok(v.spawn, 2, "|")), tonumber(gettok(v.spawn, 3, "|"))
    end
    if pkw and plane and money then
      setSaveElementData(playerElem, "uid", uid)
      setSaveElementData(playerElem, "money", money)
      setSaveElementData(playerElem, "bankmoney", bankmoney)
      setSaveElementData(playerElem, "pkw", pkw)
      setSaveElementData(playerElem, "lkw", lkw)
      setSaveElementData(playerElem, "bike", bike)
      setSaveElementData(playerElem, "heli", heli)
      setSaveElementData(playerElem, "weapon", weapon)
      setSaveElementData(playerElem, "plane", plane)
      setSaveElementData(playerElem, "adminlv", 2)
      setSaveElementData(playerElem, "loggedin", 1)
      -- Setup Tags and Colors for the chat!
      if getSaveElementData(playerElem, "adminlv") == 0 then
  			setSaveElementData(playerElem, "tag", "[Spieler]")
  			setSaveElementData(playerElem, "tagcolor", "#0DFF00")
  		elseif getSaveElementData(playerElem, "adminlv") == 1 then
  			setSaveElementData(playerElem, "tag", "[VIP]")
  			setSaveElementData(playerElem, "tagcolor", "#F7FF00")
  		elseif getSaveElementData(playerElem, "adminlv") == 2 then
  			setSaveElementData(playerElem, "tag", "[GameMaster]")
  			setSaveElementData(playerElem, "tagcolor", "#A700DA")
  		elseif getSaveElementData(playerElem, "adminlv") == 3 then
  			setSaveElementData(playerElem, "tag", "[GameAdmin]")
  			setSaveElementData(playerElem, "tagcolor", "#FFBC00")
  		elseif getSaveElementData(playerElem, "adminlv") == 4 then
  			setSaveElementData(playerElem, "tag", "[ServerAdmin]")
  			setSaveElementData(playerElem, "tagcolor", "#FF0004")
  		end
      -- end
      spawnPlayer(playerElem, xspawn, yspawn, zspawn)
      setCameraTarget(playerElem, playerElement)
      outputChatBox("#FF4000[Horrizon]: #FFAF00Server meldet: #0066FF"..getPlayerName(playerElem)..", #FFAF00wurde eingeloggt, momentaner adminrang: "..getSaveElementData(playerElem, "adminlv"), source, 0, 0, 0, true)
    end
  end
end)
