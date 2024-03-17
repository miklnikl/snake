menu = {}

function menu.load()
    menuBackground = love.graphics.newImage("scoreBackground.png")
    font = love.graphics.newFont(28)

end

function menu.draw(score)
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(menuBackground, 0, 550)

    love.graphics.setColor(0,0,0)
    love.graphics.setFont(font)
    love.graphics.print( "Score: " .. score, love.graphics.getWidth()/2 - 60, 565 )

end