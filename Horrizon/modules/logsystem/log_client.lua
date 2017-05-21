addEventHandler("onClientDebugMessage", root, function(str_message, int_level, str_file, int_line)
	if getElementType(source) == "player" then
		str_src_name = getPlayerName(source)
	elseif getElementType(source) == "vehicle" or getElementType(source) == "object" then
		str_src_name = getElementModel(source)
	else
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
		triggerServerEvent("server:handeldebug", localPlayer, str_message, int_level, str_file, int_line, str_src_name)
	end
end)