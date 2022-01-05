--By Fanbox 

fast_blood = 10000 -- Sangre Zombie Rapido
sold_blood = 20000 -- Sangre Zombie Soldado
zomb_blood = 5000 -- Sangre Zombie 

fast_damage = 3500 -- Daño Zombies Rapidos
sold_damage = 4500 -- Daño Zombies Soldado
zomb_damage = 1200 -- Daño Zombies 

--Animales
bear_blood = 20000 
wolf_blood = 7000 
fox_blood = 5000 

bear_damage = 6111 
wolf_damage = 3112 
fox_damage = 1121 


animal_blood = 2000 
animal_damage = 100 

boss_blood_blood = 75000 
boss_blood_damage = 5123

boss_all_blood = 50000 
boss_all_damage = 4212


function chasedStartAttack (zomb)
	if isElement ( zomb ) and not getElementData ( zomb, "target" ) then
		if getElementData ( zomb, "zHeared" ) then
			setElementData ( zomb, "zHeared", false ) 
		end
		setElementSyncer ( zomb, source )
		setPedAnimation ( zomb )
		if not exports.npc_hlc:isHLCEnabled ( zomb ) then
			exports.npc_hlc:enableHLCForNPC( zomb, getElementData ( zomb,"speed") or "sprint")
		end
		exports.npc_hlc:clearNPCTasks (zomb)
		exports.npc_hlc:addNPCTask ( zomb, {"killPed", source, 2, 2} )
		setElementData ( zomb, "target", source )
		setElementAlpha ( zomb, 255 )
	end
end
addEvent( "chasedStartAttackC", true )
addEventHandler( "chasedStartAttackC", getRootElement(), chasedStartAttack )

local stats = {
	[ 160 ] = 999,
	[ 229 ] = 999,
	[ 230 ] = 999
}

function applyStats(player)
	for stat,value in pairs(stats) do
		setPedStat(player, stat, value)
	end
end


function spawnNewZombie(x, y, z, creator, ztype, skin)
	local zomb = createPed(skin,x,y,z+0.5,math.random(0,360),true)
	setElementData(zomb,"spawn_x",x)
	setElementData(zomb,"spawn_y",y)
	setElementData(zomb,"spawn_z",z)
	setElementData(zomb,"spawn_ztype",ztype)
	setElementData(zomb,"spawn_skin",skin)
	if isElement ( zomb ) then
		if not isElementInWater ( zomb ) then 
			setTimer ( activateZombie, 1000, 1, zomb, x, y, z, ztype )
			setElementData ( zomb, "creator", creator )
			return true
		else
			destroyElement ( zomb )
			return false
		end
	end
	return false
end




function activateZombie (zomb, x, y, z, ztype)
	if isElement ( zomb ) then
		local zSphere = createColSphere ( x, y, z, 50 ) 
		local zSphereFar = createColSphere ( x, y, z, 150 )
		local zSphereNear = createColSphere ( x, y, z, 3 )
		attachElements ( zSphere, zomb )
		attachElements ( zSphereFar, zomb )
		attachElements ( zSphereNear, zomb )	
		setElementData ( zSphere, 'shapeZomb', true )
		setElementData ( zSphereFar, 'shapeZomb', true )
		setElementData ( zSphereNear, 'shapeZomb', true )
		setElementData ( zomb, "zombieShape", zSphere )
		setElementData ( zSphere, "zombieShape", true )
		setElementData ( zSphere, "zombieElement", zomb )
		setElementData ( zomb, "shapeFar", zSphereFar )
		setElementData ( zomb, "shapeNear", zSphereNear )
		setElementData ( zSphereNear, "zShapeNear", true )
		
		--setElementData ( zomb, "zombie", true ) --Нападає радіус не великий (ЗОМБИ)
		--setElementData ( zomb, "animal", true ) --Втікає радіус великий (ЗДОБИЧ)
		--setElementData ( zomb, "killer", true ) --Нападає радіус великий (ХИЩНИК)
		--setElementData ( zomb, "boss", true ) --Нападає радіус великий (БОСС)
		
		if ztype == 3 then
		setElementData ( zomb, "zombie", true )
			setElementData ( zomb, "soldier", true )
			setElementData(zomb, "blood", sold_blood)
			setElementData(zomb, "damage", sold_damage)
			setElementData(zomb, "speed", "sprint")
		elseif ztype == 2 then
		setElementData ( zomb, "zombie", true )
			setElementData(zomb, "blood", fast_blood)
			setElementData ( zomb, "fast", true )
			setElementData(zomb, "damage", fast_damage)
			setElementData(zomb, "speed", "run")
		--Oso
		elseif ztype == 4 then
		setElementData ( zomb, "killer", true )
			setElementData(zomb, "blood", bear_blood)
			setElementData ( zomb, "bear", true )
			setElementData(zomb, "damage", bear_damage)
			setElementData(zomb, "speed", "run")
		--Lobo
		elseif ztype == 5 then
		setElementData ( zomb, "killer", true )
			setElementData(zomb, "blood", wolf_blood)
			setElementData ( zomb, "wolf", true )
			setElementData(zomb, "damage", wolf_damage)
			setElementData(zomb, "speed", "sprint")
		elseif ztype == 6 then
		--Zorro
		setElementData ( zomb, "killer", true )
			setElementData(zomb, "blood", fox_blood)
			setElementData ( zomb, "fox", true )
			setElementData(zomb, "damage", fox_damage)
			setElementData(zomb, "speed", "sprint")
			--Animal
		elseif ztype == 7 then
			setElementData ( zomb, "animal", true )
			setElementData(zomb, "blood", animal_blood)
			setElementData(zomb, "damage", animal_damage)
			setElementData(zomb, "speed", "sprint")
			--Bosses
			--ZombieBoss
		elseif ztype == 8 then
			setElementData ( zomb, "zombie", true )
			setElementData ( zomb, "boss_blood", true )
			setElementData(zomb, "blood", boss_blood_blood)
			setElementData(zomb, "damage", boss_blood_damage)
			setElementData(zomb, "speed", "sprint")
			setElementAlpha ( zomb, 5 )
		--Todos los Bosses
		elseif ztype == 9 then
			setElementData ( zomb, "zombie", true )
			setElementData ( zomb, "boss_all", true )
			setElementData(zomb, "blood", boss_all_blood)
			setElementData(zomb, "damage", boss_all_blood)
			setElementData(zomb, "speed", "sprint")
		elseif ztype == 10 then
			setElementData ( zomb, "zombie", true )
			setElementData ( zomb, "pila", true )
			setElementData(zomb, "blood", boss_all_blood)
			setElementData(zomb, "damage", boss_all_blood)
			setElementData(zomb, "speed", "run")			
			applyStats(zomb)
			giveWeapon(zomb, 9, 9999, true) 
		else
			setElementData ( zomb, "zombie", true )
			setElementData(zomb, "blood", zomb_blood)
			setElementData(zomb, "damage", zomb_damage)
			setElementData(zomb, "speed", "run")

		end
		wentZombieToWalk ( zomb )
	end
end

function wentZombieToWalk (zomb)
	if zomb then
		if isElement ( zomb ) then
			if not isPedDead ( zomb ) then
				if checkPlayersInView ( zomb ) then
					if not getElementData ( zomb, "target" ) and not getElementData ( zomb, 'rotating' ) then
						local rdmangle = math.random( 1, 359 )
						setPedRotation( zomb, rdmangle )
						setPedAnimation ( zomb, "PED", "WALK_fatold", -1, true, true, true)
						setTimer ( wentZombieToWalk, 10000, 1, zomb )
						if getElementData ( zomb, "boss_blood" ) then
						setElementAlpha ( zomb, 5 )
						end
					end
				else
					if isElement ( getElementData ( zomb, "zombieShape" ) ) then destroyElement ( getElementData ( zomb, "zombieShape" ) ) end
					if isElement ( getElementData ( zomb, "shapeFar" ) ) then destroyElement ( getElementData ( zomb, "shapeFar" ) ) end
					if isElement ( getElementData ( zomb, "shapeNear" ) ) then destroyElement ( getElementData ( zomb, "shapeNear" ) ) end
					local attaches = getAttachedElements ( zomb )
					if attaches then
						for ElementKey, ElementValue in ipairs ( attaches ) do
							if isElement ( ElementValue ) then
								if not getElementData ( ElementValue, "zRadZone" ) then
									destroyElement ( ElementValue )
								end
							end
						end
					end
					local creator = getElementData ( zomb, "creator" ) 
					if isElement ( creator ) then
						setElementData ( creator, "spawnedzombies", ( getElementData ( creator, "spawnedzombies" ) or 1 ) - 1 )
					end
					setElementData ( zomb, "target", false )
					setElementData ( zomb, "rotating", nil )
					if not getElementData ( zomb, "target" ) and not getElementData ( zomb, 'rotating' ) then
						local rdmangle = math.random( 1, 359 )
						setPedRotation( zomb, rdmangle )
						setPedAnimation ( zomb, "PED", "WALK_fatold", -1, true, true, true)
						setTimer ( wentZombieToWalk, 10000, 1, zomb )
						if getElementData ( zomb, "boss_blood" ) then
						setElementAlpha ( zomb, 5 )
						end
					end
				end
			end
		end
	end
end

function checkPlayersInView ( zomb ) 
	local shapeFar = getElementData ( zomb, "shapeFar" )
	if isElement(shapeFar) then
		if #getElementsWithinColShape ( shapeFar, 'player' ) == 0 then
			return false 
		else return true end
	end
end

function zombieKilledPlayer (task)
	if getElementData ( source, "zombie" ) then
		if task[1] == "walkToPos" then
			if getElementData ( source, "rotating" ) then
				setElementRotation ( source, 0, 0, task[6] )
				setTimer ( function ( zomb ) if isElement ( zomb ) then setElementData ( zomb, "rotating", false ); wentZombieToWalk ( zomb ) end end, 3000, 1, source )				
			end
		end
		if getElementData ( source, "target" ) then
			local diedPlayer = task[2]
			setElementData ( source, "target", nil )
			wentZombieToWalk ( source )
		end
	end
end

addEventHandler ( "npc_hlc:onNPCTaskDone", root, zombieKilledPlayer )


function killPlayerOfSick()
	for i, v in ipairs ( getElementsByType ("ped")) do
		if getElementData ( v, "zombie" ) then
			local target = getElementData ( v, "target" )
			if target and target == source then
				setElementData ( v, "target", false )
				exports.npc_hlc:clearNPCTasks(v)
				setTimer ( wentZombieToWalk, 3000, 1, v )
			end
		end
	end
end
addEvent("killPlayerOfSick",true)
addEventHandler("killPlayerOfSick",getRootElement(),killPlayerOfSick)

function checkUnactiveZombies ()
	for i, v in ipairs ( getElementsByType ("ped")) do
		if getElementData ( v, "zombie" ) then
			local target = getElementData ( v, "target" )
			if target and not isElement ( target ) then
				setElementData ( v, "target", false )
				wentZombieToWalk ( v )
			end
		end
	end
end
setTimer (checkUnactiveZombies,10000,0)--600000

function zombieWasAttackedS ( zomb )
	if not isPedDead ( zomb ) and not getElementData ( source, "isPlayerZombie" ) then
		setPedAnimation ( zomb )
		if not exports.npc_hlc:isHLCEnabled ( zomb ) then
			exports.npc_hlc:enableHLCForNPC( zomb, getElementData ( zomb,"speed") or "sprint")
		end
		exports.npc_hlc:clearNPCTasks (zomb)
		exports.npc_hlc:addNPCTask ( zomb, {"killPed", source, 2, 2} )
		setElementData ( zomb, "target", source )
		setTimer ( wentZombieToWalk, 1000, 1, zomb )
	end
end
addEvent( "zombieWasAttacked", true )
addEventHandler( "zombieWasAttacked", getRootElement(), zombieWasAttackedS )

function zombieHearedS ( zomb )
	if isElement ( zomb ) then
		if not isPedDead ( zomb ) then
			if not getElementData ( zomb, "target" ) and not getElementData ( source, "zHeared" ) and not getElementData ( source, "isPlayerZombie" ) then
				setPedAnimation ( zomb )
				if not exports.npc_hlc:isHLCEnabled ( zomb ) then
					exports.npc_hlc:enableHLCForNPC( zomb, getElementData ( zomb,"speed") or "sprint")
				end
				exports.npc_hlc:clearNPCTasks (zomb)
				setElementData ( zomb, "zHeared", source )
				local x,y,z = getElementPosition ( source )
				exports.npc_hlc:addNPCTask ( zomb, {"walkToPos", x, y, z, 2})
			end
		end
	end
end
addEvent( "zombieHeared", true )
addEventHandler( "zombieHeared", getRootElement(), zombieHearedS )


function rotateZombieToPlayer ( rotation, x, y, z )
	if not isPedDead ( source ) then
		if not getElementData ( source, "target" ) then
			setPedAnimation ( source )
			if not exports.npc_hlc:isHLCEnabled ( source ) then
				exports.npc_hlc:enableHLCForNPC( source, getElementData ( source,"speed") or "sprint")
			end
			exports.npc_hlc:clearNPCTasks (source)
			exports.npc_hlc:addNPCTask ( source, {"walkToPos", x, y, z, 1, rotation})
		end
	end
end

addEvent( "rotateZombieToPlayer", true )
addEventHandler( "rotateZombieToPlayer", getRootElement(), rotateZombieToPlayer )

function zombieNearLeave ( thePlayer )
	if getElementType ( thePlayer ) == "player" and getElementData ( source, "zombieShape" ) then
		local zomb = getElementData ( source, "zombieElement" )
		if isElement ( zomb ) and exports.npc_hlc:isHLCEnabled ( zomb ) then
			if getElementData ( zomb, "fast" ) then
				return true
			end
			local thistask = getElementData(zomb,"npc_hlc:thistask")
			if thistask then
				local task = getElementData(zomb,"npc_hlc:task."..thistask)
				if task then
					if task[1] == "killPed" and isElement ( task[2] ) then
						if task[2] == thePlayer then
							exports.npc_hlc:clearNPCTasks (zomb)
							setElementData(zomb,"target",false)
							wentZombieToWalk(zomb)
						end
					end
				end
			end
		end	
	end
end
addEventHandler ( "onColShapeLeave", root, zombieNearLeave )
--Якшо вас замітив звір
function PanicAnimals(zomb)
    if isElement(zomb) then
				local rdmangle = math.random( 1, 359 )
				setPedRotation( zomb, rdmangle )
				setPedAnimation ( zomb, "PED", "sprint_panic", -1, true, true, true)
				setTimer ( PanicAnimals, 20000, 1, zomb ) --Скільки біжить в один напрям
		end
	end

function animalStopFollow(zomb)
    PanicAnimals(zomb)
end
addEvent("animalStopFollow",true)
addEventHandler("animalStopFollow",getRootElement(),animalStopFollow)
--


