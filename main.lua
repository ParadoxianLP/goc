beholder = require 'beholder'
mapFunctions = require 'mapFunctions'
mouseControls = require 'mousecontrols'
tickerControls = require 'tickerControls'
states = require 'states'

function love.mousepressed(x, y, button)
	mousePressed(x, y, button)
end

function love.keypressed(key)
  beholder.trigger("KEYPRESSED", key)
end

function love.keyreleased(key)
  beholder.trigger("KEYRELEASED", key)
end

function gameOver()
 love.event.push('q') 
 end

 function love.load()
	rectStartGame = { 
		x = 0,
		y = 0
		}
	gameState = 'mainmenu'
	lastTick = 1
	tickDt = 0
	tickSpeed = 0.5
	tickerPaused = true
	cityBlock = {}
	cityBlock[1] = love.graphics.newImage("art/block1.png")
	cityBlock[2] = love.graphics.newImage("art/block2.png")
	cityBlock[3] = love.graphics.newImage("art/block3.png")
	topBar = love.graphics.newImage("art/topbar.png")
	scroll_speed = 500
	blockSize = 32
	
	--beholder stuff
	beholder.observe("KEYPRESSED", "escape", gameOver)
	beholder.observe("KEYPRESSED", "r", makeMap) -- debugging, redraws the map
	beholder.observe("KEYPRESSED", " ", tickerPause)
	beholder.observe("KEYPRESSED", "kp+", tickerSpeedUp)
	beholder.observe("KEYPRESSED", "kp-", tickerSpeedDown)
	
	relative_x = 0
	relative_y = 0
	math.randomseed(os.time())
	local x = 0
	local y = 0
	map = { }
	view = { }
	view.info = "closed"
	view.strat = "closed"
	view.infox = "lol"
	view.infoy = "lol"
	
	 
	
	mapMaxY = 50
	mapMaxX = 50
	
	makeMap()
end

function love.draw()
	if gameState == 'ingame' then
		drawInGame()
	end
	if gameState == 'mainmenu' then
		drawMainMenu()
	end
end

function love.update(dt)
	if gameState == 'ingame' then
		updateInGame(dt)
	end
	if gameState == 'mainmenu' then
		updateMainMenu(dt)
	end
end

