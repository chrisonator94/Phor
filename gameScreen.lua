
numCol = 7
numRow = 6


local function load()

	isRed = true
	win = false
	--winner = false
	colChoice = nil
	numChoices = 0
	moved = false
	--creates 2d array that represents the board--
	--should probably move into "createBoard function"
	board = {}
	for i = 0, numRow - 1 do
		board[i] = {} --creates rows
		for j = 0, numCol - 1 do
			board[i][j] = ' ' --creates 2d array of blanks
		end 
	end
	--------------------------------------------------
end

local function update(dt)
	if win == false then
		if isRed and colChoice ~= nil then
			moved = move(board, colChoice, isRed)
		end
		if isRed == false and colChoice ~= nil then
			moved = move(board, colChoice, isRed)
		end

		if moved then 
			if checkWinner() then
				win = true
			else 
				isRed = not isRed
				moved = false
			end
		end
	end
end

local function draw()
	local x = 50
	local y = 50
	for i = 0, numRow - 1 do
		for j = 0, numCol - 1 do
			love.graphics.rectangle("line", x, y, 50, 50 )
			if board[i][j] == 'R' then 
				love.graphics.setColor(255, 0, 0)
				love.graphics.circle("fill", x + 25, y + 25, 20)
			elseif board[i][j] == 'Y' then
				love.graphics.setColor(255, 255, 0)
				love.graphics.circle("fill", x + 25, y + 25, 20)
			end 
			love.graphics.setColor(255, 255, 255)
			x = x + 50
		end 
		y = y + 50
		x = 50
	end

	--tells players whose turn it is and announces the winner (if there is one)
	if win == false then
		if isRed then
			love.graphics.print("It's Red's Turn! Pick a column!")
		else 
			love.graphics.print("It's yellows Turn! Pick a column!")
		end
	else 
		if isRed then
			love.graphics.print("Red is the Winner!")
		else 
			love.graphics.print("Yellow is the Winner!")
		end
	end
	----------------------------------------------

end

function move(matrix, col, color)
	--checks if the column is already full
	if matrix[0][col] ~= ' ' then
		colChoice = nil
		return false
	end
	---------------------------------------


	--checks the col for other peices and puts peice in correct spot
	for i = 0, numRow - 1 do
		if matrix[i][col] ~= ' ' then
			if color then --red
				matrix[i - 1][col] = 'R'
			else --yellow
				matrix[i - 1][col] = 'Y'
			end
			colChoice = nil
			numChoices = numChoices + 1
			return true
		end
	end
	----------------------------------------------

	--place peice at the bottom if no other peices in that column found
	if color then --red
		matrix[numRow - 1][col] = 'R'
	else --yellow
		matrix[numRow - 1][col] = 'Y'
	end
	colChoice = nil
	numChoices = numChoices + 1
	return true
	-----------------------------------------------
end

function checkWinner()
	if checkWinRows(board) then
		print("I am here")
		return true
	elseif checkWinCols(board) then
		return true
	elseif checkWinDiag(board) then
		return true
	elseif numChoices == 42 then
		return false
	end
	return false
end

function checkWinRows(matrix)
	for i = 0, numRow - 1 do 
		local count = 0
		for j = 1, numCol - 1 do
			if matrix[i][j] ~= ' ' and matrix[i][j] == matrix[i][j - 1] then
				count = count + 1
			else 
				count = 1
			end
			if count >= 4 then
				return true
			end
		end
	end
	return false
end

function checkWinCols(matrix)
	for i = 0, numCol - 1 do 
		local count = 0
		for j = 1, numRow - 1 do
			if matrix[j][i] ~= ' ' and matrix[j][i] == matrix[j - 1][i] then
				count = count + 1
			else 
				count = 1
			end
			if count >= 4 then
				return true
			end
		end
	end
	return false
end

function checkWinDiag(matrix)
	return false
end

local function mousepressed(x, y, button)
	if x > 50 and x < 100 then
		colChoice = 0
	elseif x > 100 and x < 150 then
		colChoice = 1
	elseif x > 150 and x < 200 then
		colChoice = 2
	elseif x > 200 and x < 250 then
		colChoice = 3
	elseif x > 250 and x < 300 then
		colChoice = 4
	elseif x > 300 and x < 350 then
		colChoice = 5
	elseif x > 350 and x < 400 then
		colChoice = 6
	end
	print(colChoice)
end

return {
	load = load,
	update = update,
	draw = draw,
	mousepressed = mousepressed
}