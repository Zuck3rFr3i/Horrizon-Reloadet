--[[
	Author: Zuck3rFr3i
]]
mysqlCon = dbConnect( "mysql", "dbname="..msql_dbase..";host="..msql_dhost, msql_duser, msql_dpass )
function msql_gettbl(handler, ...)
	local GetDataset = dbQuery(mysqlCon, handler, ...)
	if GetDataset then
		local result, rows = dbPoll(GetDataset, -1)
		if result then
			return result, rows
		else
			return false
		end
	else
		return false
	end
end

function msql_settbl(handler, ...)
	local WriteDat = dbExec(mysqlCon, handler, ...)
	if WriteDat then
		return true
	else
		return false
	end
end