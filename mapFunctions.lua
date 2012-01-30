function mapMoveRight(dt)
	relative_x = relative_x + (scroll_speed * dt)
end

function mapMoveLeft(dt)
	relative_x = relative_x - (scroll_speed * dt)
end

function mapMoveUp(dt)
	
	relative_y = relative_y - (scroll_speed * dt)
end

function mapMoveDown(dt)
	relative_y = relative_y + (scroll_speed * dt)
end

function makeMap()
		math.randomseed(os.time())
		for y = 1, mapMaxY do
		map[y] = {}
		for x = 1, mapMaxX do
			map[y][x] = math.random(1,3)
		end
	end
end