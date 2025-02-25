require 'Dependencies'

debug = true

function love.load()
    currentRow = 11 -- keep track of where the current segment is
    currentSize = 3 -- keep track of segment size (starts at 3, then 2, then 1)

    segments = {}
    table.insert(segments, Segment(2, currentRow, currentSize))

    sounds = {
        ['place'] = love.audio.newSource('audio/place.wav', 'static'),
        ['wall_hit'] = love.audio.newSource('audio/wall_hit.wav', 'static'),
    }

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
        -- todo: check that previous segment in table was placed underneath the current segment
        sounds['place']:play()
        segments[#segments]:place()
        checkStacked()
        currentRow = currentRow - 1
        if currentRow == 3 then reduceSize() end
        if currentRow == 6 then reduceSize() end
        local col = math.random(1, 4)
        table.insert(segments, Segment(col, currentRow, currentSize))

    end
end

function displayFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1)
end

function checkStacked()
    if #segments > 1 then
        local topSegment = segments[#segments]
        local bottomSegment = segments[#segments - 1]
        local topCols = {}
        local bottomCols = {}

        for i = 1, topSegment.size do
            table.insert(topCols, topSegment.col + i - 1)
        end

        for i = 1, bottomSegment.size do
            table.insert(bottomCols, bottomSegment.col + i - 1)
        end

        if topCols[1] == bottomCols[1] then
            print("All good")
            -- all good
        elseif contains(bottomCols, topCols[1]) then
            print("safe")
            -- todo: reduce size by unaligned pieces
            -- todo: animate unaligned pieces falling
            -- safe but not all segments are aligned
        elseif contains(bottomCols, topCols[2]) then
            print("safe")
            -- todo: reduce size by unaligned pieces
            -- todo: animate unaligned pieces falling
            -- safe, some segments are aligned
        elseif contains(bottomCols, topCols[3]) then
            print("safe")
            -- todo: reduce size by unaligned pieces
            -- todo: animate unaligned pieces falling
            -- safe, last segment is aligned
        else
            print("GAME OVER")
        end
    end
end


function reduceSize()
    if currentSize > 1 then currentSize = currentSize - 1 end
end


function contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end