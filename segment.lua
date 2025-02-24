Segment = Class{}

segmentSprite = love.graphics.newImage("sprites/segment.png")

function Segment:init(col, row, size)
    self.col = col
    self.row = row
    self.size = size or 1
    self.direction = 1
    self.canMove = false
    self.timer = 0.6
    self.maxTimer = self.timer
    self.minTimer = 0.1
end

function Segment:update(dt)
    self:updateTimer(dt)

    if self.canMove then
        if self.col == 0 or self.col + self.size == 7 then
            self.direction = -self.direction
        end
        self.col = self.col + 1 * self.direction
        self.canMove = false
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

function Segment:updateTimer(dt)
    self.timer = self.timer - dt
    if self.timer < 0 then
        self.timer = self.maxTimer
        self.canMove = true
    end
end