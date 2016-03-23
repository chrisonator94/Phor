
button = require("button")

local function load()

	--buttons-----------------------------
	playButton = {}
	highscoresButton = {}
	quitButton = {}

	button.create(playButton, "buttons/play.png", "buttons/Check.png", width / 2, 2 * height / 6, 0, .4)
	button.create(highscoresButton, "buttons/highscores.png", "buttons/Check.png", width / 2, 3 * height / 6, 0, .4)
	button.create(quitButton, "buttons/quit.png", "buttons/Check.png", width / 2, 4 * height / 6, 0, .4)
	----------------------------------------
end

local function update(dt)

	--if the user has not touched the screen, UNSELECT buttons
	if (love.touch.getTouches == nil) then
		playButton:unselect()
		highscoresButton:unselect()
		quitButton:unselect()
	end
	----------------------------------------------


end

local function draw()
	playButton:drawButton()
	highscoresButton:drawButton()
	quitButton:drawButton()
end

local function mousemoved(x, y, dx, dy)
end

local function mousepressed(x, y, button)
	playButton:unselect()
	highscoresButton:unselect()
	quitButton:unselect()
	a, b = love.mouse.getPosition()
	local results = {}
	results = playButton:checkButton(a, b)
	if (results[1]) then
		gameStateIndex = 3
		currentState = gameStates[gameStateIndex]
		currentState:load()
	end
	
	results = highscoresButton:checkButton(a, b)
	if (results[1]) then
		gameStateIndex = 4
		currentState = gameStates[gameStateIndex]
		currentState:load()
	end
	
	results = quitButton:checkButton(a, b)
	if (results[1]) then
		love.event.quit()
	end
end

local function touchpressed(id, x, y, pressure)
	-- Converting the touchscreen proximity coordinates
    -- to actual pixel coordinates
    local cx = x * width
    local cy = y * height

    love.graphics.rectangle( "fill", cx, cy, 20, 20 )

    -- Checking if touch is within an object/area
	playButton:checkButton(cx, cy)
	highscoresButton:checkButton(cx, cy)
	quitButton:checkButton(cx, cy)
end

local function touchreleased(id, x, y, pressure)
	-- Converting the touchscreen proximity coordinates
    -- to actual pixel coordinates
    local cx = x * width
    local cy = y * height
	playButton:unselect()
	highscoresButton:unselect()
	quitButton:unselect()
    -- Checking if touch is within an object/area
	local results = playButton:checkButton(cx, cy)
	if (results[1]) then
		
		gameStateIndex = 3
		currentState = gameStates[gameStateIndex]
		currentState:load()
	end
	
	results = highscoresButton:checkButton(cx, cy)
	if (results[1]) then
		
		gameStateIndex = 4
		currentState = gameStates[gameStateIndex]
		currentState:load()
	end
	
	results = quitButton:checkButton(cx, cy)
	if (results[1]) then
		love.event.quit()
	end
end

local function touchmoved(id, x, y, pressure)
	-- Converting the touchscreen proximity coordinates
    -- to actual pixel coordinates
    local cx = x * width
    local cy = y * height
	playButton:unselect()
	highscoresButton:unselect()
	quitButton:unselect()
    -- Checking if touch is within an object/area
	playButton:checkButton(cx, cy)
	highscoresButton:checkButton(cx, cy)
	quitButton:checkButton(cx, cy)
end

return {
	load = load,
	update = update,
	draw = draw,
	mousepressed = mousepressed,
	mousemoved = mousemoved,
	touchpressed = touchpressed,
	touchreleased = touchreleased,
	touchmoved = touchmoved
}