import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

local speed = 8

local sprite = nil

local playTimer = nil
local playTime = 10000

local function resetTimer()
    playTimer = pd.timer.new(playTime, playTime, 0, pd.easingFunctions.linear)
end

local function initialize()
    local image = gfx.image.new("images/celrage_icon")
    sprite = gfx.sprite.new(image)
    sprite:moveTo(200, 120)
    sprite:add()

    resetTimer()
end

initialize()

function pd.update()
    gfx.clear()
    if playTimer.value == 0 then
        if pd.buttonJustPressed(pd.kButtonA) then
            resetTimer()
        end
        gfx.drawText("Press A to restart", 5, 5)
    else
        if pd.buttonIsPressed(pd.kButtonUp) then
            sprite:moveBy(0, -speed)
        end
        if pd.buttonIsPressed(pd.kButtonDown) then
            sprite:moveBy(0, speed)
        end
        if pd.buttonIsPressed(pd.kButtonLeft) then
            sprite:moveBy(-speed, 0)
        end
        if pd.buttonIsPressed(pd.kButtonRight) then
            sprite:moveBy(speed, 0)
        end

        gfx.sprite.update()

        gfx.drawText("Time: " .. math.ceil(playTimer.value / 1000), 5, 5)
    end

    pd.timer.updateTimers()
end