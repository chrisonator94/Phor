

local function load()
	menuTime = 0
end

local function update(dt)

	--Game Intro-------------------------------------
	menuTime = menuTime + dtime
	if menuTime > 1 then
		gameStateIndex = 2
		currentState = gameStates[gameStateIndex]
		currentState:load()
	end
	--------------------------------------------------
end

local function draw()
	love.graphics.print("This is a test")
	love.graphics.print(dtime, 50, 50)
end

local function mousepressed(x, y, button)
	gameStateIndex = 2 
	currentState = gameStates[gameStateIndex]
	currentState:load()
end

return {
	load = load,
	update = update,
	draw = draw,
	mousepressed = mousepressed
}