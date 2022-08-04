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
  
  pieceStructures = {
    {
      {
        {' ', ' ', ' ', ' '},
        {'i', 'i', 'i', 'i'},
        {' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 'i', ' ', ' '},
        {' ', 'i', ' ', ' '},
        {' ', 'i', ' ', ' '},
        {' ', 'i', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {' ', 'o', 'o', ' '},
        {' ', 'o', 'o', ' '},
        {' ', ' ', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {'j', 'j', 'j', ' '},
        {' ', ' ', 'j', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 'j', ' ', ' '},
        {' ', 'j', ' ', ' '},
        {'j', 'j', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {'j', ' ', ' ', ' '},
        {'j', 'j', 'j', ' '},
        {' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 'j', 'j', ' '},
        {' ', 'j', ' ', ' '},
        {' ', 'j', ' ', ' '},
        {' ', ' ', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {'l', 'l', 'l', ' '},
        {'l', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 'l', ' ', ' '},
        {' ', 'l', ' ', ' '},
        {' ', 'l', 'l', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', ' ', 'l', ' '},
        {'l', 'l', 'l', ' '},
        {' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {'l', 'l', ' ', ' '},
        {' ', 'l', ' ', ' '},
        {' ', 'l', ' ', ' '},
        {' ', ' ', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {'t', 't', 't', ' '},
        {' ', 't', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 't', ' ', ' '},
        {' ', 't', 't', ' '},
        {' ', 't', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 't', ' ', ' '},
        {'t', 't', 't', ' '},
        {' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 't', ' ', ' '},
        {'t', 't', ' ', ' '},
        {' ', 't', ' ', ' '},
        {' ', ' ', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {' ', 's', 's', ' '},
        {'s', 's', ' ', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {'s', ' ', ' ', ' '},
        {'s', 's', ' ', ' '},
        {' ', 's', ' ', ' '},
        {' ', ' ', ' ', ' '}
      }
    },
    {
      {
        {' ', ' ', ' ', ' '},
        {'z', 'z', ' ', ' '},
        {' ', 'z', 'z', ' '},
        {' ', ' ', ' ', ' '}
      },
      {
        {' ', 'z', ' ', ' '},
        {'z', 'z', ' ', ' '},
        {'z', ' ', ' ', ' '},
        {' ', ' ', ' ', ' '}
      }
    }
  }
  
  pieceType = 1
  pieceRotation = 1
  pieceX = 3
  pieceY = 0
  
  timer = 0
end

function love.update(dt)
  timer = timer + dt
  if timer >= 0.5 then
    timer = 0
    pieceY = pieceY + 1
  end
end

function love.keypressed(key)
  if key == 'x' then
    pieceRotation = pieceRotation + 1
    if pieceRotation > #pieceStructures[pieceType] then
      pieceRotation = 1
    end
    
  elseif key == 'z' then
    pieceRotation = pieceRotation - 1
    if pieceRotation < 1 then
      pieceRotation = #pieceStructures[pieceType]
    end
    
  elseif key == 'left' then
    pieceX = pieceX - 1
    
  elseif key == 'right' then
    pieceX = pieceX + 1
    
  -- Temporary
  elseif key == 'down' then
    pieceType = pieceType + 1
    if pieceType > #pieceStructures then
      pieceType = 1
    end
    pieceRotation = 1
    
  -- Temporary
  elseif key == 'up' then
    pieceType = pieceType - 1
    if pieceType < 1 then
      pieceType = #pieceStructures
    end
    pieceRotation = 1
  end
end

function love.draw()
  function drawBlock(block, x, y)
    local colors = {
      [' '] = {.87, .87, .87},
      i = {.47, .76, .94},
      j = {.93, .91, .42},
      l = {.49, .85, .76},
      o = {.92, .69, .47},
      s = {.83, .54, .93},
      t = {.97, .58, .77},
      z = {.66, .83, .46}
    }
    local color = colors[block]
    love.graphics.setColor(color)
    
    local blockSize = 20
    local blockDrawSize = blockSize - 1
    love.graphics.rectangle(
      'fill',
      (x - 1) * blockSize,
      (y - 1) * blockSize,
      blockDrawSize,
      blockDrawSize
    )
  end
  
  for y = 1, gridYCount do
    for x = 1, gridXCount do
      drawBlock(inert[y][x], x, y)
    end
  end
  
  for y = 1, 4 do
    for x = 1, 4 do
      local block = pieceStructures[pieceType][pieceRotation][y][x]
      if block ~= ' ' then
        drawBlock(block, x + pieceX, y + pieceY)
      end
    end
  end
end