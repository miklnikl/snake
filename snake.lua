snake = {}

directions = {
    up = "up",
    down = "down",
    left = "left",
    right = "right"
}

function snake.load(maxX, maxY, defaultX, defaultY, defaultDirection, cellSize, topMargin, leftMargin)
    cellSize = cellSize
    snakeLength = 1
    snakeHeadX = defaultX
    snakeHeadY = defaultY
    snakeMaxX = maxX
    snakeMaxY = maxY
    topMargin =topMargin
    leftMargin = leftMargin
    snakeCellsArray = {{snakeHeadX, snakeHeadY}}
    snakeDirection = defaultDirection;
end

function snake.update(dt)
    moveSnake()
end

function snake.draw()
    for i = 1, snakeLength do
        drawSnakeCell(snakeCellsArray[i][1], snakeCellsArray[i][2])
    end
end

function growSnake()
    table.insert(snakeCellsArray, {snakeHeadX, snakeHeadY})
    snakeLength = snakeLength + 1
end

function love.keypressed( key, scancode, isrepeat )
    if key == "up" then
        snakeDirection = directions.up
    elseif key == "down" then
        snakeDirection = directions.down
    elseif key == "left" then
        snakeDirection = directions.left
    elseif key == "right" then
        snakeDirection = directions.right
    end
 end

function drawSnakeCell(x, y)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle("fill", x*cellSize + leftMargin, y*cellSize + topMargin, cellSize, cellSize)
end

function checkCollision(x, y)
    if x < 0 or x > snakeMaxX or y < 0 or y > snakeMaxY then
        return true
    end

    for i = 1, snakeLength do
        if snakeCellsArray[i][1] == x and snakeCellsArray[i][2] == y then
            return true
        end
    end
    
    return false
end

function snake.checkAppleCollision()
    if snakeHeadX == appleX and snakeHeadY == appleY then
        growSnake()
        return true
    end
    return false
end

function moveSnake()
    
    if snakeDirection == directions.up and checkCollision(snakeHeadX, snakeHeadY - 1) then
        snake.death()
    elseif snakeDirection == directions.down and checkCollision(snakeHeadX, snakeHeadY + 1) then
        snake.death()
    elseif snakeDirection == directions.left and checkCollision(snakeHeadX - 1, snakeHeadY) then
        snake.death()
    elseif snakeDirection == directions.right and checkCollision(snakeHeadX + 1, snakeHeadY) then
        snake.death()
    end

    if snakeDirection == directions.up and not checkCollision(snakeHeadX, snakeHeadY - 1) then
        snakeHeadY = snakeHeadY - 1
    elseif snakeDirection == directions.down and not checkCollision(snakeHeadX, snakeHeadY + 1) then
        snakeHeadY = snakeHeadY + 1
    elseif snakeDirection == directions.left and not checkCollision(snakeHeadX - 1, snakeHeadY) then
        snakeHeadX = snakeHeadX - 1
    elseif snakeDirection == directions.right and not checkCollision(snakeHeadX + 1, snakeHeadY) then
        snakeHeadX = snakeHeadX + 1
    end

    table.insert(snakeCellsArray, {snakeHeadX, snakeHeadY})
    table.remove(snakeCellsArray, 1)
end

function snake.death()
    lives = lives - 1
    if lives == 0 then
        gameStarted = false
    end
end
