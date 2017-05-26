local playerElementData = {}

function setSaveElementData(element, key, data)
  if element and key and data then
    if key ~= "" then
      if data ~= "" then
        if not playerElementData[element] then
          playerElementData[element] = {}
          if playerElementData[element] then
            playerElementData[element][key] = data
            return true
          end
        end
      end
    end
  end
end

function getSaveElementData(element, key)
  if element and key then
    if key ~= "" then
      if playerElementData[element] then
        if playerElementData[element][key] then
          local dataofKey = playerElementData[element][key]
          if dataofKey then
            return dataofKey
          else
            return false
          end
        end
      end
    end
  end
end
