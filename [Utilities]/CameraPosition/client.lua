

addCommandHandler( "campos", function ()
local cx, cy, cz, lx, ly, lz = getCameraMatrix() 
outputChatBox(""..cx..","..cy..","..cz..","..lx..","..ly..","..lz..",")

end )