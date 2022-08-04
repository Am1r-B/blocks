function love.draw()
  for y = 1, 18 do
    for x = 1, 10 do
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