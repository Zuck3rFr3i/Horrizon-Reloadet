function getPosition(pos, width, height)
  if pos == "middle" then
    if width and height then
      local x, y = (sx/2)-(width/2), (sy/2)-(height/2)
      if x and y then
        return x, y
      end
    end
  end
end
