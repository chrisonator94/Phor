

local function create(obj, image, selectedImage, x, y, rotation, scale, width, height)

	obj.image = love.graphics.newImage(image)

	--highlight the selected Image--
	if (selectedImage == nil) then
		obj.selectedImage = obj.image
	else
		obj.selectedImage = love.graphics.newImage(selectedImage)
	end	
	----------------------------------

	obj.x = x
	obj.y = y
	
	obj.scale = scale or 1
	obj.rotation = rotation or 0
	
	obj.w = width or obj.image:getWidth()
	obj.h = height or obj.image:getHeight()

	obj.offsetX = obj.w / 2
	obj.offsetY = obj.h / 2
	
	obj.selected = false


	--checks to see if button is currently selected
	function obj:checkButton(x, y, move)
		if (math.abs(x - self.x) < self.offsetX * self.scale and math.abs(y - self.y) < self.offsetY * self.scale) then
			local temp = self.selected
			if (move == nil) then
				self.selected = true
			end
			return {[1] = true, [2] = temp}
		else
			local temp = self.selected
			if (move == nil) then
				self.selected = false
			end
			return {[1] = false, [2] = temp}
		end
	end
	
	--draws the button
	function obj:drawButton()
		if (self.selected) then
			love.graphics.draw(
				self.selectedImage, -- what to draw
				self.x, self.y, -- where to draw it
				self.rotation, -- rotation
				self.scale, self.scale, -- scale
				self.offsetX, self.offsetY -- origin
			)
		else
			love.graphics.draw(
				self.image, -- what to draw
				self.x, self.y, -- where to draw it
				self.rotation, -- rotation
				self.scale, self.scale, -- scale
				self.offsetX, self.offsetY -- origin
			)
		end
	end
	
	function obj:unselect()
		self.selected = false
	end
	
	function obj:select()
		self.selected = true
	end
	
	return obj
end

return {
	create = create
}