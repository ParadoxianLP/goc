function drawInGame()
	--draw mouse location for debugging purposes
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255, 255, 255, 255 )
	
	drawMap()
	
	love.graphics.setColor(255,0, 0, 255 )
	love.graphics.print("x/y " .. love.mouse.getX() .. "/" .. love.mouse.getY() .. "\nRelative x/y " .. math.floor(relative_x) .. "/" .. math.floor(relative_y) .. "\nx/y" .. view.infox .. "/" .. view.infoy .. "\ntick: " .. lastTick, 10, 10)
	love.graphics.setColor(255, 255, 255, 255 )
	love.graphics.draw(topBar, love.graphics.getWidth() - topBar:getWidth(), 0)
end

function updateInGame(dt)
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

function drawMainMenu()
	
	love.graphics.setBackgroundColor(128,128,128) 
	rectStartGame.x = (love.graphics.getWidth() / 2) - (350/2)
	rectStartGame.y = (love.graphics.getHeight() / 2) - (500/2)
	love.graphics.setColor(0, 0, 0, 255 )
	love.graphics.rectangle( 'fill', rectStartGame.x, rectStartGame.y,  350, 500)
	love.graphics.setColor(0, 0, 255, 255 )
	love.graphics.rectangle( 'fill', rectStartGame.x + 10, rectStartGame.y + 10,  330, 80)  -- 'button'
	love.graphics.setColor(255, 255, 255, 255 )
	love.graphics.print("Start A New Game",  rectStartGame.x + 60, rectStartGame.y + 40, 0, 2)
end

function updateMainMenu(dt)

end