CoronaBitmapFont
================

## Corona Bitmap Font

An implementation of a Bitmap Font that allows for using spritesheet images as letters.

## Getting Started

```lua
local BFont = require("BitmapFont")

-- Easy as pie!
local myFont = BFont.new("resource/letras.png")

local coordX, coordY = 100, display.contentHeight * 0.5
local aString = myFont:newBitmapString(coordX,coordY, "Hello Cool Font!!!" )

local function screenWasTouched(event)
	if event.phase == "ended" then
		aString:setPos(event.x, event.y)
		aString:fadeInAnimation(100)
	end
end

Runtime:addEventListener( "touch", screenWasTouched )
```

