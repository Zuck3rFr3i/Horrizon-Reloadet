aeh("onPlayerConnect", root, function(str_pname, str_pip, _, str_pserial)
	local str_lower_pname = string.lower(str_pname)
	for i=1, #banned_names do
		if string.find(str_lower_pname, banned_names[i]) then
			cancelEvent(true,"Der SpielerName: "..str_pname.." Ist nicht erlaubt.")	
			return
		end
	end
end)