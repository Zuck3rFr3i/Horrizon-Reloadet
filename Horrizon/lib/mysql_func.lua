local host
local user
local pass
local db
local settings_file = xmlLoadFile("settings_server.xml")
local mysqlcon

if settings_file then
local childs = xmlNodeGetChildren(settings_file)
	for i, v in pairs(childs) do
		local settingname = xmlNodeGetName(v)
		if settingname == "host" then
			host = xmlNodeGetValue(v)
		end
		if settingname == "db" then
			db = xmlNodeGetValue(v)
		end
		if settingname == "user" then
			user = xmlNodeGetValue(v)
		end
		if settingname == "pass" then
			pass = xmlNodeGetValue(v)
		end
	end
	if host and user and pass and db then
		mysqlcon = dbConnect( "mysql", "dbname="..db..";host="..host, user, pass )
		if mysqlcon then
			outputServerLog("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
			outputServerLog("[Horrizon]: Mysql Connection etablished!")
		else
			outputServerLog("[Horrizon]: A Error occured while Connecting to Mysql-Server!")
		end
	end
else
	outputServerLog("File: settings_server.xml could not be loadet!")
	stopResource(getThisResource())
end

function mysql_get(sqlstring, ...)
	local dataset = dbQuery(mysqlcon, sqlstring, ...)
	if dataset then
		local result, rows = dbPoll(dataset, -1)
		if result then
			return result, rows
		else
			return false
		end
	else
		return false
	end
end

function mysql_write(sqlstring, ...)
	local dataset = dbExec(mysqlcon, sqlstring, ...)
	if dataset then
		return true
	else
		return false
	end
end