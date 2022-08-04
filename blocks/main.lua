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
end

function love.draw()
  for y = 1, gridYCount do
    for x = 1, gridXCount do
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
      local block = inert[y][x]
      local color = colors[block]
      love.graphics.setColor(color)
      
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
  
  for y = 1, 4 do
    for x = 1, 4 do
      local block = pieceStructures[pieceType][pieceRotation][y][x]
      if block ~= ' ' then
        local colors = {
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
    end
  end
end