--[[
+-----------------------------------------------------------------------------
 Effect switching on and off

	To switch on:
			triggerEvent( "switchCarPaintRefLite", root, true )
	To switch off:
			triggerEvent( "switchCarPaintRefLite", root, false )
	By default, players can hit F10 to switch off/on, the above is for your custom export integrations.
+-----------------------------------------------------------------------------
]]--


-- Switch effect on or off
function switchVeh(bool)
	outputDebugString("switchCarPaintRefLite: " .. tostring(bool))
	if bool then
		startCarPaintRefLite()
	else
		stopCarPaintRefLite()
	end
end