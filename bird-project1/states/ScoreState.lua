--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local bronze = love.graphics.newImage('arts/bronze.png')
local silver = love.graphics.newImage('arts/silver.png')
local gold = love.graphics.newImage('arts/gold.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 60, VIRTUAL_WIDTH, 'center')

    -- Score: 0 - Bronze Medal
    if self.score >= 0 and self.score < 1 then
        love.graphics.draw(bronze, VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 30)
    -- Score: 1 - Silver Medal
    elseif self.score >= 1 and self.score < 2 then
        love.graphics.draw(silver, VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 30)
    -- Score: 2 - Gold Medal
    elseif self.score >= 2 then
        love.graphics.draw(gold, VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 30)
    end
    
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 158, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end