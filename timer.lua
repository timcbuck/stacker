Timer = Class{}

function Timer:init(t)
    self.current = math.max(t, 0.05)
    self.max = self.current
    self.complete = false
end

function Timer:update(dt)
    self.complete = false
    -- Decrease the timer
    self.current = self.current - dt
    if self.current <= 0 then
        -- Set boolean to true to show that timer reached zero
        self.complete = true
        -- Reset the timer
        self.current = self.max
    end
end
