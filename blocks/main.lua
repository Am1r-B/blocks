function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
  
  gridXCount = 10
  gridYCount = 18
  
  inert = {}
  for y = 1, gridYCount do
    inert[y] = {}
    for x = 1, gridXCount do
      inert[y][x] = ' '
    end
  end
end

function love.draw()
  for y = 1, gridYCount do
    for x = 1, gridXCount do
      love.graphics.setColor(.87, .87, .87)
      local pieceSize = 20
      local pieceDrawSize = pieceSize - 1
      love.graphics.rectangle(
        'fill',
        (x - 1) * pieceSize,
        (y - 1) * pieceSize,
        pieceDrawSize,
        pieceDrawSize
      )
    end
  end
end