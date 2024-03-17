
function love.load()
    require "field"
    require "snake"
    require "background"
    require "menu"
    require "apple"
    require "startMenu"


    fieldWidth = 11
    fieldHeight = 9
    cellSize = 49.7
    snakeDefaultX = 0;
    snakeDefaultY = 0;
    snakeDefaultDirection = "right";
    topMargin = 52
    leftMargin = 52
    snakeSpeed = 20

    time = 0
    score = 0
    lives = 1

    appleX = 2
    appleY = 2

    gameStarted = false

    updatedCoordinates = {}
    background.load()
    menu.load()
    apple.load(fieldWidth, fieldHeight, appleX, appleY, cellSize, topMargin, leftMargin)
    field.load(fieldWidth, fieldHeight, cellSize, topMargin, leftMargin)
    snake.load(fieldWidth, fieldHeight, snakeDefaultX, snakeDefaultY, snakeDefaultDirection, cellSize, topMargin, leftMargin)
    startMenu.load()

    love.window.setMode( 700, 600 )
end

function love.update(dt)
    if gameStarted then
        time = time + 1;
        if time%snakeSpeed == 0 then
            snake.update(dt, appleX, appleY)
            if snake.checkAppleCollision() then
                updatedCoordinates = apple.updateAppleCoordinates()
                appleX = updatedCoordinates[1]
                appleY = updatedCoordinates[2]
                score = score + 1
            end
        end
    end
end

function love.draw()
    background.draw()
    menu.draw(score, lives)
    field.draw()
    snake.draw()
    apple.draw()

    if not gameStarted then
        startMenu.draw()
    end

    -- love.graphics.print( "Score: " .. score, 0, 0 )
    -- love.graphics.circle( "fill", target.x, target.y, target.radius )
end

function getDistance( x1, y1, x2, y2 )
    -- return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end