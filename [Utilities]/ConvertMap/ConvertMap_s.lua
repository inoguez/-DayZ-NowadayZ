----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 09 Jan 2014
-- Resource: GTIdevTools/mapConvert.slua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Convert Map to lua File
--------------------------->>

function convertMapToFile(player)
	local time1 = getTickCount()
	
	local mapFile = xmlLoadFile("convert.map")
	if (not mapFile) then 
		outputChatBox("Warning: Failed to load map file, 'convert.map' does not exist. Rename your map 'convert.map' and place it in the root of this resource.", player, 255, 125, 0)
	return end
	
	local security = "if (getElementData(root, \"mapSecurity\") ~= \"G32MdAZtHJ9Ajmm9GkuvtFQh\") then return end\n\n"
	
	local objects = xmlNodeGetChildren(mapFile)
	local output = "local INTERIOR = 0\nlocal DIMENSION = 0\n\nlocal mapObjects = {"
	local lodOutput
	local doubSided
	local scaleText
	local remWorObject
	local objIntDim
	local lodIntDim
	local lodAssociation = {}
	local objIndex = 0
	for i,node in ipairs(objects) do
		local nodeName = xmlNodeGetName(node)
		if (nodeName == "vehicle") then
			objIndex = objIndex + 1
			
			local model = xmlNodeGetAttribute(node, "model")
			local posX = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posX") ) )
			local posY = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posY") ) )
			local posZ = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posZ") ) )
			local rotX = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "rotX") ) )
			local rotY = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "rotY") ) )
			local rotZ = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "rotZ") ) )
			local plate = tostring(xmlNodeGetAttribute(node, "plate"))
			output = output.."\n\tcreateVehicle("..model..", "..posX..", "..posY..", "..posZ..", "..rotX..", "..rotY..", "..rotZ..", ".."'"..plate.."'".."),"
			
			objIntDim = "-- Set Interior/Dimension\n-------------------------->>\n\n"..
				"for i,object in ipairs(mapObjects) do\n\tsetElementInterior(object, INTERIOR)\n\tsetElementDimension(object, DIMENSION)\nend"
		end
	end
	
	output = output.."\n}"
	if (lodOutput) then
		lodOutput = lodOutput.."\n}"
	end
	
	local postMapOutput
	for i,j in ipairs(lodAssociation) do
		if (not postMapOutput) then
			postMapOutput = "-- LOD Object Association\n-------------------------->>\n"
		end
		postMapOutput = postMapOutput.."\nsetLowLODElement(mapObjects["..j.."], lodObjects["..i.."])"
	end
	
	local file = fileCreate("convertedMap.lua")
	fileWrite(file, security..output.."\n\n"..(lodOutput or "").."\n\n"..(postMapOutput or "").."\n\n"..(doubSided or "").."\n\n"
		..(scaleText or "").."\n\n"..(objIntDim or "").."\n\n"..(lodIntDim or "").."\n\n"..(remWorObject or ""))
	fileClose(file)
	xmlUnloadFile(mapFile)
	
	local time2 = getTickCount()
	outputChatBox("Map successfully converted! Conversion Time: "..( (time2-time1)/1000 ).." seconds.", player, 255, 255, 0)
end
addCommandHandler("convert", convertMapToFile)

-- Convert Map to Coordinates Table
------------------------------------>>

function convertMapToCoordinatesTable(player)
	local time1 = getTickCount()
	
	local mapFile = xmlLoadFile("convert.map")
	if (not mapFile) then 
		outputChatBox("Warning: Failed to load map file, 'convert.map' does not exist. Rename your map 'convert.map' and place it in the root of this resource.", player, 255, 125, 0)
	return end
	
	local objects = xmlNodeGetChildren(mapFile)
	local output = "local coordsTable = {"
	for i,node in ipairs(objects) do
		local nodeName = xmlNodeGetName(node)
		if (nodeName == "marker") then
			local posX = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posX") ) )
			local posY = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posY") ) )
			local posZ = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "posZ") ) )
			local rotZ = tonumber( string.format("%.4f", xmlNodeGetAttribute(node, "rotZ") ) )
			output = output.."\n\t{"..posX..", "..posY..", "..posZ..", "..rotZ.."},"
		end
	end
	
	output = output.."\n}"
	
	local file = fileCreate("coordLocations.lua")
	fileWrite(file, output)
	fileClose(file)
	xmlUnloadFile(mapFile)
	
	local time2 = getTickCount()
	outputChatBox("Map successfully converted! Conversion Time: "..( (time2-time1)/1000 ).." seconds.", player, 255, 255, 0)
end
addCommandHandler("convert-coords", convertMapToCoordinatesTable, true)