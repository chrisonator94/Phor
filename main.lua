
titleScreen = require("titleScreen")
gameScreen = require("gameScreen")
highScoreScreen = require("highScoreScreen")
menuScreen = require("menuScreen")

currentState = {}
gameStates = { titleScreen, menuScreen, gameScreen, highScoreScreen }

dtime = 0

function love.load()
	width, height = love.window.getMode() --global

	currentState = titleScreen
	currentState:load()
end

function love.update(dt)
	dtime = dt
	currentState:update(dt)
end

function love.draw()
	currentState:draw()
end


function love.mousepressed(x, y, button) 
	currentState.mousepressed(x, y, button)
end

function love.mousemoved(x, y, dx, dy)
	if gameStateIndex == 2 then
		currentState.mousemoved(x, y, dx, dy)
	end
end


function love.touchpressed(id, x, y, pressure)
	currentState.touchpressed(id, x, y, pressure)
end

function love.touchreleased(id, x, y, pressure)
	currentState.touchreleased(id, x, y, pressure)
end

function love.touchmoved(id, x, y, pressure)
	currentState.touchmoved(id, x, y, pressure)
end