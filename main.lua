beholder = require 'beholder'
mapFunctions = require 'mapFunctions'
mouseControls = require 'mousecontrols'
tickerControls = require 'tickerControls'

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
	view.strat = "open"
	view.infox = "lol"
	view.infoy = "lol"
	
	 
	
	mapMaxY = 50
	mapMaxX = 50
	
	makeMap()
end

function love.draw()
	--draw mouse location for debugging purposes
	love.graphics.setColor(255, 255, 255, 255 )
	
	drawMap()
	
	love.graphics.setColor(255,0, 0, 255 )
	love.graphics.print("x/y " .. love.mouse.getX() .. "/" .. love.mouse.getY() .. "\nRelative x/y " .. math.floor(relative_x) .. "/" .. math.floor(relative_y) .. "\nx/y" .. view.infox .. "/" .. view.infoy .. "\ntick: " .. lastTick, 10, 10)
	love.graphics.setColor(255, 255, 255, 255 )
	love.graphics.draw(topBar, love.graphics.getWidth() - topBar:getWidth(), 0)

end

function love.update(dt)

-- map movement
 if love.keyboard.isDown("right") then
      mapMoveRight(dt)
   elseif love.keyboard.isDown("left") then
      mapMoveLeft(dt)
   end
   if love.keyboard.isDown("down") then
      mapMoveDown(dt)
   elseif love.keyboard.isDown("up") then
      mapMoveUp(dt)
   end
   
   tickDo(dt)
end

