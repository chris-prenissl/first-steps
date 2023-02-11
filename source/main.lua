import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

local sprite = nil

local function initialize()
    local image = gfx.image.new("images/celrage_icon")
    sprite = gfx.sprite.new(image)
    sprite:moveTo(200, 120)
    sprite:add()
end

initialize()

function pd.update()
    sprite:moveBy(1,0)

    gfx.sprite.update()    
end