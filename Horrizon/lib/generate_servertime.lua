function getRealTimeOnMyServer()
	local time = getRealTime()
	local hours = time.hour
	local seconds = time.second
	local minutes = time.minute
	local year = time.year+1900
	local months = time.month+1
	local monthdays = time.monthday
	if(time.month <= 9) then 
		months = "0"..time.second 
	else 
		months = time.second 
	end
	if(time.month <= 9) then 
		months = "0"..time.month+1 
	else 
		months = time.month+1 
	end
	if(time.monthday <= 9) then 
		monthdays = "0"..time.monthday 
	else 
		monthdays = time.monthday 
	end
	if(time.minute <= 9) then 
		minutes = "0"..time.minute 
	else 
		minutes = time.minute 
	end
	if(time.hour <= 9) then 
		hours = "0"..time.hour 
	else 
		hours = time.hour 
	end
	return hours,minutes,seconds,monthdays,months,year
end