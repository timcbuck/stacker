require 'Dependencies'

debug = true

function love.load()
    col = 11
    segments = {}
    table.insert(segments, Segment(2, col, 3))
end

function love.update(dt)
    for _, s in pairs(segments) do
        s:update(dt)
    end
end

function love.draw()
    if debug then displayFPS() end

    for _, s in pairs(segments) do
        s:render()
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "space" then
        -- Place the current segment in play, which will be the last element in the segments table
        segments[#segments]:place()
        col = col - 1
        local row = math.random(1, 4)
        table.insert(segments, Segment(row, col, 3))
    end
end

function displayFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1)
end