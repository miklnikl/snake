background = {}

function background.load()
    backgroundImage = love.graphics.newImage("background.png")
end

function background.draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(backgroundImage)
end
