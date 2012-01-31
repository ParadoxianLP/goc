function tickerPause()
	if gameState == 'ingame' then
		tickerPaused = not tickerPaused
	end
end

function tickDo(dt)
	if gameState == 'ingame' then
		if tickerPaused ~= true then
			tickDt = tickDt + dt * tickSpeed
			if tickDt >= 1 then
				-- do game calculations here
				
				tickDt = 0
				lastTick = lastTick + 1
			end
		end
	end
end

function tickerSpeedUp()
	if gameState == 'ingame' then
		tickSpeed = tickSpeed + 0.5
	end
end

function tickerSpeedDown()
	if gameState == 'ingame' then
		tickSpeed = tickSpeed - 0.5
		if tickSpeed < 0 then
			tickSpeed = 0
			tickerPaused = true
		end
	end
end
	