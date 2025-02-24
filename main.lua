require 'Dependencies'

debug = true

function love.load()
    segment = Segment(2, 11, 3)
end

function love.update(dt)
    segment:update(dt)
end

function love.draw()
    if debug then displayFPS() end

    segment:render()
end

function love.keypressed(key)
    if key == "escape" then
        -- quit game
    end
end

function displayFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1)
end