--[[
	Author: Zuck3rFr3i
]]
local tbl_msglv_1 = {}
local tbl_msglv_2 = {}
local tbl_msglv_3 = {}

ae("logsystem:insertlogs", true)
aeh("logsystem:insertlogs", root, function(str_message, int_level, str_file, int_line, str_src_name)
	local int_hours, int_minutes, int_seconds, int_monthdays, int_months, int_years = getRealTimeOnMyServer()
	if int_monthdays and int_seconds then
		local str_string = "<msg time=\""..int_monthdays.."."..int_months.."."..int_years.." - "..int_hours..":"..int_minutes.."\" name=\""..str_src_name.."\" message=\""..str_message.."\" file=\""..str_file.."\" line=\""..int_line.."\"/>\n"
		if int_level == 1 then
			table.insert(tbl_msglv_1, str_string)
		elseif int_level == 2 then
			table.insert(tbl_msglv_2, str_string)
		elseif int_level == 3 then
			table.insert(tbl_msglv_3, str_string)
		end
	end
end)

aeh("onDebugMessage", root, function(str_message, int_level, str_file, int_line)
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
		triggerEvent("logsystem:insertlogs", root, str_message, int_level, str_file, int_line, str_src_name)
	end
end)

setTimer( function()
    if not fileExists("logs/debug_level1.xml") then
			fileCreate("logs/debug_level1.xml")
	end
	if not fileExists("logs/debug_level2.xml") then
			fileCreate("logs/debug_level2.xml")
	end
	if not fileExists("logs/debug_level3.xml") then
			fileCreate("logs/debug_level3.xml")
	end
	local file_txt_1 = fileOpen("logs/debug_level1.xml")
	local file_txt_2 = fileOpen("logs/debug_level2.xml")
	local file_txt_3 = fileOpen("logs/debug_level3.xml")
	
	for i, v_lv1 in pairs(tbl_msglv_1) do
		local size = fileGetSize(file_txt_1)
		fileSetPos(file_txt_1, size)
		fileWrite(file_txt_1, v_lv1)
	end
	
	for i, v_lv2 in pairs(tbl_msglv_2) do
		local size = fileGetSize(file_txt_2)
		fileSetPos(file_txt_2, size)
		fileWrite(file_txt_2, v_lv2)
	end
	
	for i, v_lv3 in pairs(tbl_msglv_3) do
		local size = fileGetSize(file_txt_3)
		fileSetPos(file_txt_3, size)
		fileWrite(file_txt_3, v_lv3)
	end
	
	tbl_msglv_1 = nil
	tbl_msglv_2 = nil
	tbl_msglv_3 = nil
	tbl_msglv_1 = {}
	tbl_msglv_2 = {}
	tbl_msglv_3 = {}
	
	fileClose(file_txt_1)
	fileClose(file_txt_2)
	fileClose(file_txt_3)
	
end, 9000000, 0)