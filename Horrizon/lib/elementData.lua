local playerElementData = {}

function setSaveElementData(element, key, data)
  if element then
	if not playerElementData[element] then
		playerElementData[element] = {}
	end
	if key ~= "" and data ~= "" then
		playerElementData[element][key] = data
		return true
	end
  end
end

function getSaveElementData(element, key)
	if element then
		if key ~= "" then
			if playerElementData[element] then
				local data = playerElementData[element][key]
				if data then
					return data
				else
					return false
				end
			end
		end
	end
end
