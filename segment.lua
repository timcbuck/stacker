Segment = Class{}

segmentSprite = love.graphics.newImage("sprites/segment.png")

function Segment:init(col, row, size)
    self.col = col
    self.row = row
    self.size = size or 1
    self.direction = 1
end

function Segment:update(dt)
    self.col = self.col + 1 * self.direction
    if self.col == 0 or self.col + self.size == 7 then
        self.direction = self.direction * -1
    end
end

function Segment:render()
    if self.size == 1 then
        love.graphics.draw(segmentSprite, 64 * self.col, 64 * self.row)
    end

    if self.size == 2 then
        love.graphics.draw(segmentSprite, 64 * self.col, 64 * self.row)
        love.graphics.draw(segmentSprite, 64 * (self.col + 1), 64 * self.row)
    end

    if self.size == 3 then
        love.graphics.draw(segmentSprite, 64 * self.col, 64 * self.row)
        love.graphics.draw(segmentSprite, 64 * (self.col + 1), 64 * self.row)
        love.graphics.draw(segmentSprite, 64 * (self.col + 2), 64 * self.row)
    end
end