function mousePressed(x, y, button)
	if button == 'l' then
		if gameState == 'ingame' then
			if view.strat == "open" and view.info == "closed" then
				view.info = "open"
				view.infox = math.floor(1 + ((x + relative_x) / blockSize))
				view.infoy = math.floor(1 + ((y + relative_y) / blockSize))
			end
		end
		if gameState == 'mainmenu' then
			if checkMouseClick(rectStartGame.x + 10, rectStartGame.x + 10 + 330, rectStartGame.y + 10, rectStartGame.y + 10 + 80, x, y) then
			--if checkMouseClick(1, 10, 1, 10, 5, 5) then
				gameState = 'ingame'
				view.strat = 'open'
				view.info = 'closed'
			end
		end
	end
end

function checkMouseClick(x1, x2, y1, y2, mx, my)
	if mx > x1 and mx < x2 and
	my > y1 and my < y2 
	then
		return true
	else
		return false
	end
end
