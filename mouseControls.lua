function mousePressed(x, y, button)
	--if view.strat == "open" and view.info == "closed" then
		view.info = "open"
		view.infox = math.floor(1 + ((x + relative_x) / blockSize))
		view.infoy = math.floor(1 + ((y + relative_y) / blockSize))
	--end
end
