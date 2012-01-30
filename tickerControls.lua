function tickerPause()
	tickerPaused = not tickerPaused
end

function tickDo(dt)
	if tickerPaused ~= true then
		tickDt = tickDt + dt * tickSpeed
		if tickDt >= 1 then
			-- do game calculations here
			
			tickDt = 0
			lastTick = lastTick + 1
		end
	end
end

function tickerSpeedUp()
	tickSpeed = tickSpeed + 0.5
end

function tickerSpeedDown()
	tickSpeed = tickSpeed - 0.5
	if tickSpeed < 0 then
		tickSpeed = 0
		tickerPaused = true
	end
end
	