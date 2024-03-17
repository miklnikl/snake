field = {}

function field.load(fieldWidth, fieldHeight, cellSize, topMargin, leftMargin)
    cellSize = cellSize
    width = fieldWidth
    height = fieldHeight
    topMargin = topMargin
    leftMargin = leftMargin
end

function field.update(dt)
end

function field.draw()
    for i = 0, width do
        for j = 0, height do
            drawCell(i * cellSize, j * cellSize, cellSize)
        end
    end
end


function drawCell(x, y, size)
    -- love.graphics.setColor(255, 255, 255, 1)
    -- love.graphics.rectangle("line", x + leftMargin, y + topMargin, size, size)
end