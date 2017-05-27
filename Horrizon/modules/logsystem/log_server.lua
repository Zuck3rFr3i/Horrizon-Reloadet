addEvent("server:handeldebug", true)
addEventHandler("server:handeldebug", root, function(str_message, int_level, str_file, int_line, str_src_name)
	local hours, minutes, _, day, month, year = getRealTimeOnMyServer()
	local loadlevelfile
	if not fileExists("logs/debuglogs/level"..int_level.."/"..day.."."..month.."."..year..".xml") then
		loadlevelfile = fileCreate("logs/debuglogs/level"..int_level.."/"..day.."."..month.."."..year..".xml")
	else
		loadlevelfile = fileOpen("logs/debuglogs/level"..int_level.."/"..day.."."..month.."."..year..".xml")
	end
	if loadlevelfile then
		local str_string = "<msg time=\""..day.."."..month.."."..year.." - "..hours..":"..minutes.."\" name=\""..str_src_name.."\" message=\""..str_message.."\" file=\""..str_file.."\" line=\""..int_line.."\"/>\n"
		local size = fileGetSize(loadlevelfile)
		fileSetPos(loadlevelfile, size)
		fileWrite(loadlevelfile, str_string)
		fileFlush(loadlevelfile)
	end
end)

local function server_handlechatmsg(message, sourceElement)
	local tag
	local tagcolor
	if getSaveElementData(sourceElement, "loggedin") == 1 then
		if not message or message == "" then return end
		local chatlogfile
		local hours, minutes, seconds, day, month, year = getRealTimeOnMyServer()
		if not fileExists("logs/chatlogs/chatlog_"..day.."."..month.."."..year..".xml") then
			chatlogfile = fileCreate("logs/chatlogs/chatlog_"..day.."."..month.."."..year..".xml")
		else
			chatlogfile = fileOpen("logs/chatlogs/chatlog_"..day.."."..month.."."..year..".xml")
		end
		if chatlogfile then
			local strName = getPlayerName(sourceElement)
			local strSerial = getPlayerSerial(sourceElement)
			local strmessage = "<msg time=\""..day.."."..month.."."..year.." - "..hours..":"..minutes..":"..seconds.."\" name=\""..strName.."\" serial=\""..strSerial.."\" Message=\""..message.."\"/>\n"
			local size = fileGetSize(chatlogfile)
			fileSetPos(chatlogfile, size)
			fileWrite(chatlogfile, strmessage)
			fileFlush(chatlogfile)
		end
		outputChatBox(getSaveElementData(sourceElement, "tagcolor")..""..getSaveElementData(sourceElement, "tag").."#00FFF7"..getPlayerName(sourceElement)..": #F8FEF8"..message, root, 0, 0, 0, true)
	else
		outputChatBox("#FF4000[Horrizon]: #FFAF00Sie sind nicht eingeloggt! Loggen sie sich ein oder Registrieren sie sich um Nachrichten schreiben zu können.", sourceElement, 0, 0, 0, true)
	end
end

addEventHandler("onPlayerChat",  root, function(message)
	server_handlechatmsg(message, source)
	cancelEvent(true)
end)

addEventHandler("onDebugMessage", root, function(str_message, int_level, str_file, int_line)
	if getElementType(source) == "player" then
		str_src_name = getPlayerName(source)
	elseif getElementType(source) == "vehicle" or getElementType(source) == "object" then
		str_src_name = getElementModel(source)
	elseif getElementType(source) ~= "player" or getElementType(source) ~= "vehicle" or getElementType(source) == "object" then
		str_src_name = "Unknown"
	end
	if str_message == "" then
		str_message = "N/A"
	end
	if int_level == nil then
		int_level = "N/A"
	end
	if str_file == "" then
		str_file = "N/A"
	end
	if int_line == nil then
		int_line = "N/A"
	end
	if str_src_name then
		triggerEvent("server:handeldebug", root, str_message, int_level, str_file, int_line, str_src_name)
	end
end)
