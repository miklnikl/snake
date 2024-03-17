apple = {}

function apple.load(maxX, maxY, defaultX, defaultY, cellSize, topMargin, leftMargin)
    cellSize = cellSize
    x = defaultX
    y = defaultY
    appleMaxX = maxX
    appleMaxY = maxY
    topMargin =topMargin
    leftMargin = leftMargin
end

function apple.update(dt)
end

function apple.draw()
    drawAppleCell()
end

function apple.updateAppleCoordinates()
    x = love.math.random( appleMaxX )
    y = love.math.random( appleMaxY )
    return {x, y}
end


function drawAppleCell()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("fill", x*cellSize + leftMargin, y*cellSize + topMargin, cellSize, cellSize)
end