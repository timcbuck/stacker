require 'Dependencies'

function love.load()
    segment = Segment(2, 11, 3)
end

function love.update(dt)
    segment:update(dt)
end

function love.draw()
    segment:render()
end