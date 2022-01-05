
setTrafficLightState(9)
setWeather(15)

function checkSetTime()
    local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
	setTrafficLightState(9)
end
--setTimer(checkSetTime,60000,0)
checkSetTime()

function night_check()
	local hour, minutes = getTime()
		setSkyGradient(65,80,83,65,80,84)
		setFarClipDistance(350)
		setFogDistance(15)
	if hour >= 5 and hour < 12 then
		setSkyGradient(65,80,83,65,80,84)
		setWeather (15)
	elseif hour >= 12 and hour < 13 then
		setSkyGradient(65,80,83,65,60,64)
		--setWeather (8)
		setWeather (15)
	elseif hour >= 13 and hour < 18 then
		setSkyGradient(65,80,83,65,60,64)
		setWeather (15)
	elseif hour >= 18 and hour < 21 then
		setSkyGradient(65,80,83,55,70,74)
		setWeather (15)
	elseif hour >= 21 and hour < 22 then
		setSkyGradient(65,80,83,35,40,44)
		--setWeather (8)
		setWeather (15)
	elseif hour >= 22 and hour < 5 then
		setSkyGradient(65,80,83,35,40,44)
		setWeather (15)
	else
		setSkyGradient( 0, 0, 0, 10, 10, 10 )
		setFarClipDistance(450)
		setFogDistance(35)
	end
end
--setTimer(night_check,1000,0)
--night_check()