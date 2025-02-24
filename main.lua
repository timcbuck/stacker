require 'Dependencies'

function love.load()
    segment = Segment(0, 10, 3)
end

function love.update(dt)
    segment:update()
end

function love.draw()
    segment:render()
end