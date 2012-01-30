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

function drawMap()
	local y=0
	local x=0
	for y=1, #map do
        for x=1, #map[y] do
                love.graphics.draw(cityBlock[map[y][x]], (-32 + x * 32) - relative_x, (-32 + y * 32) - relative_y)
        end
	end
end