local ButtonManager = require('simplebutton')

local screen = { w = love.graphics.getWidth(), h = love.graphics.getHeight() }

startMenu = {}

function startMenu.load()

    -- Create new button
   startButton = ButtonManager.new("Start Game", screen.w/2 - 100, screen.h/2 - 20, 100, 40)
   -- Set text alignment
   startButton:setAlignment('center')
   -- Set onClick function
   startButton.onClick = function()
        if score > 0 then
            score = 0
            lives = 1
            apple.load(fieldWidth, fieldHeight, appleX, appleY, cellSize, topMargin, leftMargin)
            field.load(fieldWidth, fieldHeight, cellSize, topMargin, leftMargin)
            snake.load(fieldWidth, fieldHeight, snakeDefaultX, snakeDefaultY, snakeDefaultDirection, cellSize, topMargin, leftMargin)
        end
        gameStarted = true
   end
	
   quitButton = ButtonManager.new("Quit", screen.w/2 - 100, screen.h/2 + 30, 100, 40)
   quitButton:setAlignment('center')
   quitButton.onClick = function()
      love.event.quit()
   end
	
end

function startMenu.draw()
    love.graphics.setColor(0, 0, 0, 128/255) -- 128/255 is equivalent to 0.5 opacity
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    ButtonManager.draw()
end

function love.mousepressed( x, y, msbutton, istouch, presses )
    ButtonManager.mousepressed(x,y,msbutton)
 end
 
 function love.mousereleased( x, y, msbutton, istouch, presses )
    ButtonManager.mousereleased(x,y,msbutton)
 end