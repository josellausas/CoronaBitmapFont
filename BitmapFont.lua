-- SpecialBitmapFont by jose@josellausas.com on March 5, 2014

local SpecialBitmapFont = {}


function SpecialBitmapFont.new(filename)
	local instance = {}
	
	-- This function builds a dictionary with all the coordinates for the letters in the bitmap font
	function instance.buildFrames(tileWidth, tileHeight)
		local frames = {}
		-- Populates the fraames
		
		for y=0, 9 do
			for x=0, 9 do
				local optionsForFrame = {}
				optionsForFrame.x 	    = x * tileWidth
				optionsForFrame.y 		= y * tileHeight
				optionsForFrame.width   = tileWidth
				optionsForFrame.height  = tileHeight

				table.insert(frames, optionsForFrame)
			end
		end 


		return frames
	end

	local options =
	{
		frames = instance.buildFrames(64,64)
	}
	-- Create a sprite sheet
	instance.spriteSheet = graphics.newImageSheet( filename, options )

	

	function instance:getLetter(asciiCode)

		local frameNum = asciiCode - 31
		print(frameNum)
		return display.newImage(self.spriteSheet, frameNum)
	end

	function instance:newBitmapString(x,y,myString)
		-- An object we are creating that contains all the images
		-- This object can make visible/invisible and remove its objects
		local imagesForString = {}
		local cursorPosition = x

		for i=1, #myString do
			local letter = myString:sub(i,i)
			local ascii = string.byte(letter)
			local letterImage = self:getLetter(ascii)

			letterImage.x = cursorPosition
			letterImage.y = y

			table.insert(imagesForString, letterImage)

			local rightOffset = 32
			cursorPosition = cursorPosition + (letterImage.contentWidth - rightOffset)
		end

		function imagesForString:isVisible(isIt)
			for i=1, #self do
				self[i].isVisible = isIt   
			end
		end

		function imagesForString:removeSelf( )
			for i=1, #self do
				self[i]:removeSelf()
			end
		end

		return imagesForString
	end


	return instance
end


return SpecialBitmapFont