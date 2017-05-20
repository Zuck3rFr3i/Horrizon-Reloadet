local settings_file = xmlLoadFile("settings_server.xml")
local maxplayers
local maxfps
local serverpass
local lockserverwhileinit

local function server_mysqlgenerate()
	outputServerLog("[Horrizon]: Setting up Mysql Structure!")
	mysql_write("CREATE TABLE IF NOT EXISTS `accountdata` (`uid` INT NOT NULL AUTO_INCREMENT,`serial` VARCHAR(255) NOT NULL DEFAULT '0',`characktername` VARCHAR(255) NOT NULL DEFAULT '0',`email` VARCHAR(255) NOT NULL DEFAULT '0',`gender` VARCHAR(255) NOT NULL DEFAULT '0',PRIMARY KEY (`uid`))COLLATE='latin1_swedish_ci'")
	mysql_write("CREATE TABLE IF NOT EXISTS `userdata` (`uid` INT NOT NULL DEFAULT '0',`serial` VARCHAR(255) NOT NULL DEFAULT '0',`spawn` VARCHAR(255) NOT NULL DEFAULT '|0|0|0|0',`licences` VARCHAR(255) NOT NULL DEFAULT '|0|0|0|0|0|0',`inventory` VARCHAR(255) NOT NULL DEFAULT '|0|0',PRIMARY KEY (`uid`))COLLATE='latin1_swedish_ci'")
	-- More mysql Structure.
	outputServerLog("[Horrizon]: Mysqlstructure loadet!")
end

local function setup_lockedstate()
	outputServerLog("[Horrizon]: Settingup Server in Lockedmode!")
	local randompass = generateString(15)
	if randompass then
		setServerPassword(randompass)
		server_mysqlgenerate()
	end
end

local function setup_openstate()
	outputServerLog("[Horrizon]: Settingup Server in Openmode!")
	server_mysqlgenerate()
end

local function server_setsettings()
	setMaxPlayers(maxplayers)
	setFPSLimit(maxfps)
	if tonumber(lockserverwhileinit) == 1 then
		setup_lockedstate()
	else
		setup_openstate()
	end
end

if settings_file then
	local childs = xmlNodeGetChildren(settings_file)
	for i, v in pairs(childs) do
		local settingname = xmlNodeGetName(v)
		if settingname == "maxplayers" then
			maxplayers = xmlNodeGetValue(v)
		end
		if settingname == "maxfps" then
			maxfps = xmlNodeGetValue(v)
		end
		if settingname == "serverpass" then
			serverpass = xmlNodeGetValue(v)
		end
		if settingname == "initserverinlockdown" then
			lockserverwhileinit = xmlNodeGetValue(v)
		end
	end
	if maxplayers and maxfps and serverpass and lockserverwhileinit then
		server_setsettings()
	else
		outputServerLog("[Horrizon]: Something went Wrong while Setting up Serverside settingsvariables!")
	end
else
	outputServerLog("[Horrizon]: Could not load Serverside Settingsfile in server_init.lua Line: 1 and 8!")
end
