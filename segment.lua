Segment = Class{}

segmentSprite = love.graphics.newImage("sprites/segment.png")

function Segment:init(col, row, size)
    self.col = col
    self.row = row
    self.size = size
    self.direction = 1 -- randomly have direction as 1 or -1
    self.moveTimer = Timer(0.6)
    self.placed = false
end

function Segment:update(dt)
    if not self.placed then
        -- Decrease timer time
        self.moveTimer:update(dt)

        -- If timer has reached zero, move the segment
        if self.moveTimer.complete then
            -- Ensure segment moves back and forth when reaching edge of the window
            if self.col == 0 or self.col + self.size == 7 then
                sounds['wall_hit']:play()
                self.direction = -self.direction
            end
            -- Increase/decrease column position by 1
            self.col = self.col + 1 * self.direction
        end
    else

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

function Segment:place()
    self.placed = true
end