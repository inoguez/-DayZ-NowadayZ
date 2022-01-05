-----------------------PING KICKER BY /)ssasin#~> -----------------------------------------------
local pingFails = 0
function playerPingCheck()
  if getPlayerPing(getLocalPlayer()) > gameplayVariables.ping then
    pingFails = pingFails + 1
    if pingFails == 3 then
      triggerServerEvent("kickPlayerOnHighPing", getLocalPlayer())
      return
    end
	outputChatBox("[NowaDayZ] Tu ping es muy alto "..gameplayVariables.ping.." ["..pingFails.."/3]", source, 255, 0, 0)
    if isTimer(pingTimer) then
      return
    end
    pingTimer = setTimer(function()
      pingFails = 0
    end, 30000, 1)
  end
end
setTimer(playerPingCheck, 4000, 0)
----------------------------FAST SPRINT--------------------------------------------------

---------------------------
-- FAST SPRINT --------------
----------------------------
--
local r, g, b, a = 155, 68, 68, 255 -- color iconos

local disallowedSlots = {
  [3] = true,
  [5] = true,
  [6] = true,
  [7] = true,
}

local blockedTasks = {
  ["TASK_SIMPLE_IN_AIR"] = true,
  ["TASK_SIMPLE_JUMP"] = true,
  ["TASK_SIMPLE_LAND"] = true,
  ["TASK_SIMPLE_GO_TO_POINT"] = true,
  ["TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE"] = true,
  ["TASK_SIMPLE_CAR_GET_IN"] = true,
  ["TASK_SIMPLE_CLIMB"] = true, 
  ["TASK_SIMPLE_SWIM"] = true,
  ["TASK_SIMPLE_HIT_HEAD"] = true, 
  ["TASK_SIMPLE_FALL"] = true, 
  ["TASK_SIMPLE_GET_UP"] = true, 
}

local screenW,screenH = guiGetScreenSize()
local vel = 0.01
local spd = 1.2 -- скорость спринта (1.0 = стандартное значение)
function startSprint(_,state)
  if not disallowedSlots[getPedWeaponSlot(localPlayer)] and not blockedTasks[getPedSimplestTask(localPlayer)] then
    setElementData(localPlayer, "run",state)
  end 
end
bindKey ( "space", "both", startSprint )

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(90 - angle);
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
    return x+dx, y+dy;
end

function fanbox()
  if isElement(localPlayer) then
    if getElementData(localPlayer, "run") == "down" then
      if not disallowedSlots[getPedWeaponSlot(localPlayer)] and not blockedTasks[getPedSimplestTask(localPlayer)] then
        local x, y, z = getElementPosition(localPlayer)
        local prot = getPedRotation(localPlayer)
        local nx, ny = getPointFromDistanceRotation(x, y, vel, (prot)*-1)
        local clear = isLineOfSightClear( x, y, z, nx, ny, z, true, true, true, true, true, true, true)
        if clear == true then
          local lx, ly = getPointFromDistanceRotation(x, y, 1, (prot-8)*-1)
          local rx, ry = getPointFromDistanceRotation(x, y, 1, (prot+8)*-1)
          local clearl = isLineOfSightClear( x, y, z, lx, ly, z, true, true, true, true, true, true, true)
          local clearr = isLineOfSightClear( x, y, z, rx, ry, z, true, true, true, true, true, true, true)
          if clearl == true and clearr == true then
            local W = getPedControlState ( "forwards" )
            local S = getPedControlState ( "backwards" )
            local A = getPedControlState ( "left" )
            local D = getPedControlState ( "right" )
            local jump = getPedControlState ( "jump" )
            if jump then return end
            local nz = getGroundPosition ( nx, ny, z+1 )
            if  getDistanceBetweenPoints3D( x, y, z, nx, ny, nz) < 2 then
            --dxDrawImage(sW-240, sH-90, 45, 45, "Imagenes/fastrun.png", 0, 0, 0, tocolor(r, g, b, a))
              if W or S or A or D then
                setGameSpeed(spd)
              end
            end
          end
        end
        else
        setGameSpeed(1)
      end
      else
      setGameSpeed(1)
    end
  end
end
addEventHandler("onClientRender", root, fanbox)



-------------------------------------------DAMAGE SHOW SCREEN DX-----------------------------------------------

gRoot = getRootElement()
gLPlayer = getLocalPlayer()
gResourceRoot = getResourceRootElement()
gDamageSources = {}
gDamageAlpha = 0
gDamageAlpha2 = 0
gScreenX, gScreenY = guiGetScreenSize()
gTick = nil

gSourceAlpha = 255
gDamageAlpha_head = 255
gDamageAlpha_nothead = 159

fadeOutDirection = 255  -- per second
fadeOutDamaged = 255  -- per second

function displayDamageSources()
  local tx, ty = getWorldFromScreenPosition(gScreenX * 0.5, gScreenY * 0.5, 100)
  local cx, cy = getCameraMatrix()
  local px, py = getElementPosition(gLPlayer)
  local cameraAngle = findRotation(cx, cy, tx, ty)
  
  for index, value in pairs(gDamageSources) do
    if value.a < 0 then
      gDamageSources[index] = nil
    else
      if value.x ~= false then
        local targetAngle = findRotation(px, py, value.x, value.y)
        local realAngle = targetAngle - cameraAngle + 180
        
        if realAngle < 0 then
          realAngle = realAngle + 360
        end
        
        if realAngle > 360 then
          realAngle = realAngle - 360
        end
        
        for i = -9, 9, 2 do
          local disW, disH = (gScreenX * 0.5) + math.sin(math.rad(realAngle + i)) * (gScreenY * 0.25), (gScreenY * 0.5) + math.cos(math.rad(realAngle + i)) * (gScreenY * 0.25)
          
          dxDrawImage(disW - 8, disH - 8, 16, 16, "Imagenes/dmg.png", 0, 0, 0, tocolor(255, 255, 255, value.a))
        end
      end
      
      if getTickCount() - value.c >= 1000 then
        if value.aa == nil then
          value.aa = value.a
        end
        
        if value.cc == nil then
          value.cc = getTickCount()
        end
        
        value.a = math.floor(value.aa - (fadeOutDirection * (getTickCount() - value.cc) / 1000))
      end
    end
  end
end
addEventHandler("onClientRender", gRoot, displayDamageSources)

function displayDamageEffect()
  if gDamageAlpha > 0 and gTick ~= nil then
    dxDrawRectangle(0, 0, gScreenX, gScreenY, tocolor(0, 0, 0, gDamageAlpha))
    gDamageAlpha = math.floor(gDamageAlpha2 - (fadeOutDamaged * (getTickCount() - gTick) / 1000))
    
    if gDamageAlpha < 0 then
      gDamageAlpha = 0
      gDamageAlpha2 = 0
      gTick = nil
    end
  end
end
addEventHandler("onClientRender", gRoot, displayDamageEffect)

function afterDamage_damage(attacker, weapon, bodypart)
  local ax, ay, az = nil, nil, nil
  if not attacker then
    return
  end
  
  if isElement(attacker) == true  then
    ax, ay, az = getElementPosition(attacker)
  else
    ax, ay, az = false, false, false
  end
  
  ---[[
  if weapon == 35 or weapon == 36 or weapon == 37 or weapon == 16 or weapon == 17 or weapon == 18 or weapon == 39 then
    ax, ay, az = false, false, false
  end
  --]]
  
  local idx = #gDamageSources + 1
  
  if idx > 30 then
    local idx2 = idx % 30
    idx = idx - idx2 * 30
  end
  
  gDamageSources[idx] = {}
  gDamageSources[idx].x = ax
  gDamageSources[idx].y = ay
  gDamageSources[idx].z = az
  gDamageSources[idx].a = gSourceAlpha
  gDamageSources[idx].c = getTickCount()
  
  if bodypart == 9 then -- headshot
    gDamageAlpha = gDamageAlpha_head
    gDamageAlpha2 = gDamageAlpha_head
  else  -- not headshot
    if gDamageAlpha < 159 then
      gDamageAlpha = gDamageAlpha_nothead
      gDamageAlpha2 = gDamageAlpha_nothead
    end
  end
  
  gTick = getTickCount()
end
addEventHandler("onClientPlayerDamage", gLPlayer, afterDamage_damage)

function damagedFunc(ax, ay, az)
  local idx = #gDamageSources + 1
  
  gDamageSources[idx] = {}
  gDamageSources[idx].x = ax
  gDamageSources[idx].y = ay
  gDamageSources[idx].z = az
  gDamageSources[idx].a = 255
end
addEvent("damaged", true)
addEventHandler("damaged", gRoot, damagedFunc)

function findRotation(startX, startY, targetX, targetY) -- Doomed-Space-Marine
  local t = -math.deg(math.atan2(targetX - startX, targetY - startY))
  
  if t < 0 then
    t = t + 360
  end
  
  return t
end

-------------------------SUPERMAN-----------------------------------------------------------------
--volar_c
local Superman = {}
 
local ZERO_TOLERANCE = 0.00001
local MAX_ANGLE_SPEED = 8 
local MAX_SPEED = 6.5
local EXTRA_SPEED_FACTOR = 1.85
local LOW_SPEED_FACTOR = 0.40
local ACCELERATION = 0.025
local EXTRA_ACCELERATION_FACTOR = 1.8
local LOW_ACCELERATION_FACTOR = 0.85
local TAKEOFF_VELOCITY = 1.75
local TAKEOFF_FLIGHT_DELAY = 750
local SMOKING_SPEED = 0.1
local GROUND_ZERO_TOLERANCE = 0.18
local LANDING_DISTANCE = 3.2
local FLIGHT_ANIMLIB = "swim"
local FLIGHT_ANIMATION = "Swim_Dive_Under"
local FLIGHT_ANIM_LOOP = false
local IDLE_ANIMLIB = "cop_ambient"
local IDLE_ANIMATION = "Coplook_loop"
local IDLE_ANIM_LOOP = true
local MAX_Y_ROTATION = 55
local ROTATION_Y_SPEED = 3.8
local thisResource = getThisResource()
local rootElement = getRootElement()
local localPlayer = getLocalPlayer()
local serverGravity = getGravity()
local function isPlayerFlying(player)
  local data = getElementData(player, "superman:flying")
  if not data or data == false then return false
  else return true end
end
local function setPlayerFlying(player, state)
  if state == true then state = true
  else state = false end
  setElementData(player, "superman:flying", state)
end
local function iterateFlyingPlayers()
  local current = 1
  local allPlayers = getElementsByType("player")
  return function()
    local player
   
    repeat
      player = allPlayers[current]
      current = current + 1
    until not player or (isPlayerFlying(player) and isElementStreamedIn(player))
 
    return player
  end
end
 
function Superman:restorePlayer(player)
  setPlayerFlying(player, false)
  setPedAnimation(player, false)
  setElementVelocity(player, 0, 0, 0)
  setElementRotation(player, 0, 0, 0)
  --setPedRotation(player, getPedRotation(player))
  setElementCollisionsEnabled(player, true)
  --self:destroySmokeGenerators(player)
  self.rotations[player] = nil
  self.previousVelocity[player] = nil
end
 
function angleDiff(angle1, angle2)
  angle1, angle2 = angle1 % 360, angle2 % 360
  local diff = (angle1 - angle2) % 360
  if diff <= 180 then
    return diff
  else
    return -(360 - diff)
  end
end
 
local function isElementInWater(ped)
  local pedPosition = Vector3D:new(getElementPosition(ped))
  if pedPosition.z <= 0 then return true end
 
  local waterLevel = getWaterLevel(pedPosition.x, pedPosition.y, pedPosition.z)
  if not isElementStreamedIn(ped) or not waterLevel or waterLevel < pedPosition.z then
    return false
  else
    return true
  end
end
 
local function isnan(x)
    math.inf = 1/0
    if x == math.inf or x == -math.inf or x ~= x then
        return true
    end
    return false
end
 
local function getVector2DAngle(vec)
  if vec.x == 0 and vec.y == 0 then return 0 end
  local angle = math.deg(math.atan(vec.x / vec.y)) + 90
  if vec.y < 0 then
    angle = angle + 180
  end
  return angle
end
 
--
-- Initialization and shutdown functions
--
function Superman.Start()
  local self = Superman
 
  -- Register events
  addEventHandler("onClientResourceStop", getResourceRootElement(thisResource), Superman.Stop, false)
  addEventHandler("onPlayerJoin", rootElement, Superman.onJoin)
  addEventHandler("onPlayerQuit", rootElement, Superman.onQuit)
  addEventHandler("onClientRender", rootElement, Superman.processControls)
  addEventHandler("onClientRender", rootElement, Superman.processFlight)
  addEventHandler("onClientPlayerDamage", localPlayer, Superman.onDamage, false)
  addEventHandler("onClientElementDataChange", rootElement, Superman.onDataChange)
  addEventHandler("onClientElementStreamIn", rootElement, Superman.onStreamIn)
  addEventHandler("onClientElementStreamOut", rootElement, Superman.onStreamOut)
 
  -- Initializate attributes
  --self.smokeGenerators = {}
  self.rotations = {}
  self.previousVelocity = {}
end
addEventHandler("onClientResourceStart", getResourceRootElement(thisResource), Superman.Start, false)
 
function Superman.Stop()
  local self = Superman
 
  setGravity(serverGravity)
 
  -- Restore all players animations, collisions, etc
  for player in iterateFlyingPlayers() do
    self:restorePlayer(player)
  end
end
 
 
 
--
-- Join/Quit
--
function Superman.onJoin(player)
  local self = Superman
  local player = player or source
 
  setPlayerFlying(player, false)
end
 
function Superman.onQuit(reason, player)
  local self = Superman
  local player = player or source
 
  if isPlayerFlying(player) then
    self:restorePlayer(player)
  end
end
 
 
--
-- onDamage: superman is invulnerable
--
function Superman.onDamage()
  local self = Superman
 
  if isPlayerFlying(localPlayer) then
    cancelEvent()
  end
end
 
 
--
-- onStreamIn: Reset rotation attribute for player
--
function Superman.onStreamIn()
  local self = Superman
end
 
function Superman.onStreamOut()
  local self = Superman
 
  if source and isElement(source) and getElementType(source) == "player" and isPlayerFlying(source) then
    self.rotations[source] = nil
    self.previousVelocity[source] = nil
  end
end
 
--
-- onDataChange: Check if somebody who is out of stream stops being superman
--
function Superman.onDataChange(dataName, oldValue)
  local self = Superman
 
  if dataName == "superman:flying" and isElement(source) and getElementType(source) == "player" and
     oldValue ~= getElementData(source, dataName) and oldValue == true and getElementData(source, dataName) == false then
    self:restorePlayer(source)
  end
end
 
--
-- onJump: Combo to start flight without any command
--
function Superman.onJump(key, keyState)
  local self = Superman
 
  local task = getPedSimplestTask(localPlayer)
  if not isPlayerFlying(localPlayer) then
    if task == "TASK_SIMPLE_IN_AIR" then
      setElementVelocity(localPlayer, 0, 0, TAKEOFF_VELOCITY)
      setTimer(Superman.startFlight, 100, 1)
    end
  end
end
addEvent( "startSuperman2", true )
addEventHandler( "startSuperman2", getRootElement(),Superman.onJump)
 
--
-- Commands
--
function Superman.cmdSuperman()
  local self = Superman
 
  if isPedInVehicle(localPlayer) or isPlayerFlying(localPlayer) then return end
  setElementVelocity(localPlayer, 0, 0, TAKEOFF_VELOCITY)
  setTimer(Superman.startFlight, TAKEOFF_FLIGHT_DELAY, 1)
end
addEvent( "startSuperman", true )
addEventHandler( "startSuperman", getRootElement(),Superman.cmdSuperman)
 
function Superman.startFlight()
  local self = Superman
 
  if isPlayerFlying(localPlayer) then return end
 
  triggerServerEvent("superman:start", rootElement)
  setPlayerFlying(localPlayer, true)
  setElementVelocity(localPlayer, 0, 0, 0)
  self.currentSpeed = 0
  self.extraVelocity = { x = 0, y = 0, z = 0 }
end
 
 
--
-- Controls processing
--
function Superman.processControls()
  local self = Superman
 
  if not isPlayerFlying(localPlayer) then return end
 
  -- Calculate the requested movement direction
  local Direction = Vector3D:new(0, 0, 0)
  if getPedControlState("forwards") then
    Direction.y = 1
  elseif getPedControlState("backwards") then
    Direction.y = -1
  end
 
  if getPedControlState("left") then
    Direction.x = 1
  elseif getPedControlState("right") then
    Direction.x = -1
  end
  Direction:Normalize()
 
  -- Calculate the sight direction
  local cameraX, cameraY, cameraZ, lookX, lookY, lookZ = getCameraMatrix()
  local SightDirection = Vector3D:new((lookX - cameraX), (lookY - cameraY), (lookZ - cameraZ))
  SightDirection:Normalize()
  if getPedControlState("look_behind") then
    SightDirection = SightDirection:Mul(-1)
  end
 
  -- Calculate the current max speed and acceleration values
  local maxSpeed = MAX_SPEED
  local acceleration = ACCELERATION
  if getPedControlState("sprint") then
    maxSpeed = MAX_SPEED * EXTRA_SPEED_FACTOR
    acceleration = acceleration * EXTRA_ACCELERATION_FACTOR
  elseif getPedControlState("walk") then
    maxSpeed = MAX_SPEED * LOW_SPEED_FACTOR
    acceleration = acceleration * LOW_ACCELERATION_FACTOR
  end
 
  local DirectionModule = Direction:Module()
 
  -- Check if we must change the gravity
  if DirectionModule == 0 and self.currentSpeed ~= 0 then
    setGravity(0)
  else
    setGravity(serverGravity)
  end
 
  -- Calculate the new current speed
  if self.currentSpeed ~= 0 and (DirectionModule == 0 or self.currentSpeed > maxSpeed) then
    -- deccelerate
    self.currentSpeed = self.currentSpeed - acceleration
    if self.currentSpeed < 0 then self.currentSpeed = 0 end
 
  elseif DirectionModule ~= 0 and self.currentSpeed < maxSpeed then
    -- accelerate
    self.currentSpeed = self.currentSpeed + acceleration
    if self.currentSpeed > maxSpeed then self.currentSpeed = maxSpeed end
 
  end
 
  -- Calculate the movement requested direction
  if DirectionModule ~= 0 then
    Direction = Vector3D:new(SightDirection.x * Direction.y - SightDirection.y * Direction.x,
                             SightDirection.x * Direction.x + SightDirection.y * Direction.y,
                             SightDirection.z * Direction.y)
    -- Save the last movement direction for when player releases all direction keys
    self.lastDirection = Direction
  else
    -- Player is not specifying any direction, use last known direction or the current velocity
    if self.lastDirection then
      Direction = self.lastDirection
      if self.currentSpeed == 0 then self.lastDirection = nil end
    else
      Direction = Vector3D:new(getElementVelocity(localPlayer))
    end
  end
  Direction:Normalize()
  Direction = Direction:Mul(self.currentSpeed)
 
  -- Applicate a smooth direction change, if moving
  if self.currentSpeed > 0 then
    local VelocityDirection = Vector3D:new(getElementVelocity(localPlayer))
    VelocityDirection:Normalize()
 
    if math.sqrt(VelocityDirection.x^2 + VelocityDirection.y^2) > 0 then
      local DirectionAngle = getVector2DAngle(Direction)
      local VelocityAngle = getVector2DAngle(VelocityDirection)
 
      local diff = angleDiff(DirectionAngle, VelocityAngle)
      local calculatedAngle
 
      if diff >= 0 then
        if diff > MAX_ANGLE_SPEED then
          calculatedAngle = VelocityAngle + MAX_ANGLE_SPEED
    else
      calculatedAngle = DirectionAngle
    end
      else
        if diff < MAX_ANGLE_SPEED then
          calculatedAngle = VelocityAngle - MAX_ANGLE_SPEED
    else
          calculatedAngle = DirectionAngle
        end
      end
      calculatedAngle = calculatedAngle % 360
 
      local DirectionModule2D = math.sqrt(Direction.x^2 + Direction.y^2)
      Direction.x = -DirectionModule2D*math.cos(math.rad(calculatedAngle))
      Direction.y = DirectionModule2D*math.sin(math.rad(calculatedAngle))
    end
  end
 
  if Direction:Module() == 0 then
    self.extraVelocity = { x = 0, y = 0, z = 0 }
  end
 
  -- Set the new velocity
  setElementVelocity(localPlayer, Direction.x + self.extraVelocity.x,
                                  Direction.y + self.extraVelocity.y,
                                  Direction.z + self.extraVelocity.z)
 
  if self.extraVelocity.z > 0 then
    self.extraVelocity.z = self.extraVelocity.z - 1
    if self.extraVelocity.z < 0 then self.extraVelocity.z = 0 end
  elseif self.extraVelocity.z < 0 then
    self.extraVelocity.z = self.extraVelocity.z + 1
    if self.extraVelocity.z > 0 then self.extraVelocity.z = 0 end
  end
end
 
 
 
--
-- Players flight processing
--
function Superman.processFlight()
  local self = Superman
 
  for player in iterateFlyingPlayers() do
    local Velocity = Vector3D:new(getElementVelocity(player))
    local distanceToBase = getElementDistanceFromCentreOfMassToBaseOfModel(player)
    local playerPos = Vector3D:new(getElementPosition(player))
    playerPos.z = playerPos.z - distanceToBase
 
    local distanceToGround
    if playerPos.z > 0 then
      local hit, hitX, hitY, hitZ, hitElement = processLineOfSight(playerPos.x, playerPos.y, playerPos.z,
                                                                   playerPos.x, playerPos.y, playerPos.z - LANDING_DISTANCE - 1,
                                                                   true, true, true, true, true, false, false, false)
      if hit then distanceToGround = playerPos.z - hitZ end
    end
 
    if distanceToGround and distanceToGround < GROUND_ZERO_TOLERANCE then
      self:restorePlayer(player)
      if player == localPlayer then
        setGravity(serverGravity)
        triggerServerEvent("superman:stop", getRootElement())
      end
    elseif distanceToGround and distanceToGround < LANDING_DISTANCE then
      self:processLanding(player, Velocity, distanceToGround)
    elseif Velocity:Module() < ZERO_TOLERANCE then
      self:processIdleFlight(player)
    else
      self:processMovingFlight(player, Velocity)
    end
  end
end
 
function Superman:processIdleFlight(player)
  -- Set the proper animation on the player
  local animLib, animName = getPedAnimation(player)
  if animLib ~= IDLE_ANIMLIB or animName ~= IDLE_ANIMATION then
    setPedAnimation(player, IDLE_ANIMLIB, IDLE_ANIMATION, -1, IDLE_ANIM_LOOP, false, false)
  end
 
  setElementCollisionsEnabled(player, false)
 
  -- If this is myself, calculate the ped rotation depending on the camera rotation
  if player == localPlayer then
    local cameraX, cameraY, cameraZ, lookX, lookY, lookZ = getCameraMatrix()
    local Sight = Vector3D:new(lookX - cameraX, lookY - cameraY, lookZ - cameraZ)
    Sight:Normalize()
    if getPedControlState("look_behind") then
      Sight = Sight:Mul(-1)
    end
 
    Sight.z = math.atan(Sight.x / Sight.y)
    if Sight.y > 0 then
      Sight.z = Sight.z + math.pi
    end
    Sight.z = math.deg(Sight.z) + 180
 
    setPedRotation(localPlayer, Sight.z)
    setElementRotation(localPlayer, 0, 0, Sight.z)
  else
    local Zangle = getPedCameraRotation(player)
    setPedRotation(player, Zangle)
    setElementRotation(player, 0, 0, Zangle)
  end
end
 
function Superman:processMovingFlight(player, Velocity)
  -- Set the proper animation on the player
  local animLib, animName = getPedAnimation(player)
  if animLib ~= FLIGHT_ANIMLIB or animName ~= FLIGHT_ANIMATION then
    setPedAnimation(player, FLIGHT_ANIMLIB, FLIGHT_ANIMATION, -1, FLIGHT_ANIM_LOOP, true, false)
  end
 
  if player == localPlayer then
    setElementCollisionsEnabled(player, true)
  else
    setElementCollisionsEnabled(player, false)
  end
 
  -- Calculate the player rotation depending on their velocity
  local Rotation = Vector3D:new(0, 0, 0)
  if Velocity.x == 0 and Velocity.y == 0 then
    Rotation.z = getPedRotation(player)
  else
    Rotation.z = math.deg(math.atan(Velocity.x / Velocity.y))
    if Velocity.y > 0 then
      Rotation.z = Rotation.z - 180
    end
    Rotation.z = (Rotation.z + 180) % 360
  end
  Rotation.x = -math.deg(Velocity.z / Velocity:Module() * 1.2)
 
  -- Rotation compensation for the self animation rotation
  Rotation.x = Rotation.x - 40
 
  -- Calculate the Y rotation for barrel rotations
  if not self.rotations[player] then self.rotations[player] = 0 end
  if not self.previousVelocity[player] then self.previousVelocity[player] = Vector3D:new(0, 0, 0) end
 
  local previousAngle = getVector2DAngle(self.previousVelocity[player])
  local currentAngle = getVector2DAngle(Velocity)
  local diff = angleDiff(currentAngle, previousAngle)
  if isnan(diff) then
    diff = 0
  end
  local calculatedYRotation = -diff * MAX_Y_ROTATION / MAX_ANGLE_SPEED
 
  if calculatedYRotation > self.rotations[player] then
    if calculatedYRotation - self.rotations[player] > ROTATION_Y_SPEED then
      self.rotations[player] = self.rotations[player] + ROTATION_Y_SPEED
    else
      self.rotations[player] = calculatedYRotation
    end
  else
    if self.rotations[player] - calculatedYRotation > ROTATION_Y_SPEED then
      self.rotations[player] = self.rotations[player] - ROTATION_Y_SPEED
    else
      self.rotations[player] = calculatedYRotation
    end
  end
  if self.rotations[player] > MAX_Y_ROTATION then
    self.rotations[player] = MAX_Y_ROTATION
  elseif self.rotations[player] < -MAX_Y_ROTATION then
    self.rotations[player] = -MAX_Y_ROTATION
  elseif math.abs(self.rotations[player]) < ZERO_TOLERANCE then
    self.rotations[player] = 0
  end
  Rotation.y = self.rotations[player]
  setPedRotation(player, Rotation.z)
  setElementRotation(player, Rotation.x, Rotation.y, Rotation.z)
  self.previousVelocity[player] = Velocity
end
 
function Superman:processLanding(player, Velocity, distanceToGround)
  local animLib, animName = getPedAnimation(player)
  if animLib ~= FLIGHT_ANIMLIB or animName ~= FLIGHT_ANIMATION then
    setPedAnimation(player, FLIGHT_ANIMLIB, FLIGHT_ANIMATION, -1, FLIGHT_ANIM_LOOP, true, false)
  end
  if player == localPlayer then
    setElementCollisionsEnabled(player, true)
  else
    setElementCollisionsEnabled(player, false)
  end
  local Rotation = Vector3D:new(0, 0, 0)
  if Velocity.x == 0 and Velocity.y == 0 then
    Rotation.z = getPedRotation(player)
  else
    Rotation.z = math.deg(math.atan(Velocity.x / Velocity.y))
    if Velocity.y > 0 then
      Rotation.z = Rotation.z - 180
    end
    Rotation.z = (Rotation.z + 180) % 360
  end
  Rotation.x = -(85 - (distanceToGround * 85 / LANDING_DISTANCE))
  Rotation.x = Rotation.x - 40 
  setPedRotation(player, Rotation.z)
  setElementRotation(player, Rotation.x, Rotation.y, Rotation.z)
end
Vector3D = {
  new = function(self, _x, _y, _z)
    local newVector = { x = _x or 0.0, y = _y or 0.0, z = _z or 0.0 }
    return setmetatable(newVector, { __index = Vector3D })
  end,
  Copy = function(self)
    return Vector3D:new(self.x, self.y, self.z)
  end,
  Normalize = function(self)
    local mod = self:Module()
    if mod ~= 0 then
      self.x = self.x / mod
      self.y = self.y / mod
      self.z = self.z / mod
    end
  end,
  Dot = function(self, V)
    return self.x * V.x + self.y * V.y + self.z * V.z
  end,
  Module = function(self)
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
  end,
  AddV = function(self, V)
    return Vector3D:new(self.x + V.x, self.y + V.y, self.z + V.z)
  end,
  SubV = function(self, V)
    return Vector3D:new(self.x - V.x, self.y - V.y, self.z - V.z)
  end,
  CrossV = function(self, V)
    return Vector3D:new(self.y * V.z - self.z * V.y,
                        self.z * V.x - self.x * V.z,
                        self.x * V.y - self.y * V.z)
  end,
  Mul = function(self, n)
    return Vector3D:new(self.x * n, self.y * n, self.z * n)
  end,
  Div = function(self, n)
    return Vector3D:new(self.x / n, self.y / n, self.z / n)
  end,
  MulV = function(self, V)
    return Vector3D:new(self.x * V.x, self.y * V.y, self.z * V.z)
  end,
  DivV = function(self, V)
    return Vector3D:new(self.x / V.x, self.y / V.y, self.z / V.z)
  end,
}
--//PING/FPS DXDRAWs
local dxfontWorkSans = dxCreateFont("Fuentes/WorkSans.ttf", 8)
local sx,sy=guiGetScreenSize() 
local ax,ay = 1280,1024  
--//TickFPS
local player = getLocalPlayer()
local counter = 0
local starttick
local currenttick

addEventHandler("onClientRender",root,
  function()
    if not starttick then
      starttick = getTickCount()
    end
    counter = counter + 1
    currenttick = getTickCount()
    if currenttick - starttick >= 1000 then
      setElementData(player,"FPS",counter)
      counter = 0
      starttick = false
    end
  end
)
--////////////
addEventHandler("onClientRender", root,
    function() 
    	if getElementData( getLocalPlayer(), "MostrarHUD" ) then return end
      if getElementData( getLocalPlayer(), "OcultarFPSPING") then return end
      if getElementData( getLocalPlayer(  ), "Iniciado" ) then

        local ping = getPlayerPing ( getLocalPlayer(), "ping2") 
          ping2= ' PING: ' ..ping

          fps = 'FPS: '..getElementData(getLocalPlayer(),"FPS") 

        --dxDrawLine(sx*(4/ax) - 1,sy*(1003/ay) - 1,sx*(4/ax) - 1, sy*(1021/ay), tocolor(240, 255, 240, 170), 1, false)
        --dxDrawLine(sx*(114/ax), sy*(1003/ay) - 1, sx*(4/ax) - 1, sy*(1003/ay) - 1, tocolor(240, 255, 240, 170), 1, false)
        --dxDrawLine(sx*(4/ax) - 1, sy*(1021/ay), sx*(114/ax), sy*(1021/ay), tocolor(240, 255, 240, 170), 1, false)
        --dxDrawLine(sx*(114/ax), sy*(1021/ay), sx*(114/ax), sy*(1003/ay) - 1, tocolor(240, 255, 240, 170), 1, false)
        --dxDrawRectangle(sx*(4/ax), sy*(1003/ay), sx*(110/ax), sy*(18/ay), tocolor(0, 0, 0, 170), false)
        dxDrawText(tostring(fps)..tostring(ping2), sx*(18/ax), sy*(1006/ay), sx*(118/ax), sy*(1017/ay), colorBlanco, 1.00, dxfontWorkSans, "left", "center", false, false, false, false, false)
      end
    end)
--[[
addEventHandler( "onClientResourceStart", resourceRoot, function()
  

setWeather ( 43 )     
setSkyGradient( 80, 80, 80, 80, 80, 80 )   
setFarClipDistance(250)
setFogDistance(80)

  end)]]
--[[
setWeather ( 43 )     
setSkyGradient( 80, 80, 80, 80, 80, 80 )              
resetFarClipDistance() ]]

--
--
function onClientResourceStart()
	setPedWalkingStyle(localPlayer,0) 
end
addEventHandler("onClientResourceStart",resourceRoot, onClientResourceStart)






local damages = {}
local Max = 4
local dis = 35
local damage = ''
local nW, nH = guiGetScreenSize()
local scaleX = nW/1280
local scaleY = nH/1024
local localPlayer = getLocalPlayer()
local r,g,b = 0,0,0
function damages.Agregar (lost)
  table.insert(damages,{lost,getTickCount()})
end

function damages.Render()
  for k, v in ipairs(damages) do
    if k <= Max then
      dxDrawText(v[1], scaleX*750, scaleY*(674 - (dis*k)), scaleX*300, scaleY*706, tocolor( 255, 255, 255),1 ,"default", "center", "center",false, false, false, true, false)
      --outputChatBox( v[1] )
    end
    if (getTickCount() - v[2] > 5000) then
      table.remove(damages,1)
    end
  end
   
end
addEventHandler( "onClientRender", root, damages.Render)

function showAttacker ( attacker, weapon, bodypart, loss )
  if attacker and attacker == getLocalPlayer() then
      damage = 100
      if weapon == 37 then
        return
      end
      if weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
        local Slot = getPedWeaponSlot(attacker)
        if Slot == 3 or Slot == 5 or Slot == 6 then
          Arma = 'currentweapon_1'
        elseif Slot == 1 or Slot == 2 or Slot == 4 then
          Arma = 'currentweapon_2'
        elseif Slot == 8 then
          Arma = 'currentweapon_3'
        elseif Slot == 11 then
          return
        else
          Arma = false
        end

        if weapon then
            Data = getWeaponData(attacker:getData(Arma))
            damage = Data[5]
        end
      end
      if bodypart == 9 then
        damages.Agregar("#00ff00Headshot!")
      end
      damages.Agregar("#00ff00+"..math.floor(damage))
  end 
end
addEventHandler ( "onClientPedDamage", getRootElement(), showAttacker )

function showLocal ( attacker, weapon, bodypart, loss )
    lost = loss *10
    if attacker and attacker.type == 'ped' then
      lost = attacker:getData("damage")
    end
    damages.Agregar("#ff0000-"..math.floor(lost))
end
addEventHandler ( "onClientPlayerDamage", localPlayer, showLocal )

--MIRA NUEVA-------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

addEventHandler ("onClientResourceStop", getResourceRootElement (getThisResource ()),function ()
  unbindKey ("aim_weapon", "both", on_weapon_aimed); 
  if not isPlayerHudComponentVisible ("crosshair") then
    setPlayerHudComponentVisible ("crosshair", true);
  end;
end)

local sx, sy = guiGetScreenSize()
local size = 40
local sizes = 40
local cursorX, cursorY = 0, 0
Path = ":DayZ/Imagenes/Crosshairs/CrosshairDefault.png"


function drawCrosshair(value) 
  setPlayerHudComponentVisible ("crosshair",false) 
  local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
  local screenX1, screenY1 = getScreenFromWorldPosition ( hX,hY,hZ )
  if screenX1 == false or nil or screenY == false or nil then return end
  local weapon = getPedWeapon ( localPlayer )
  if weapon then
    --print(Path)
    dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, Path,0,0,0,tocolor(167, 245, 103,255))   
  end
end
function visibleDraw (key, state)        
    local weapon = getPedWeapon(getLocalPlayer())
    
    if weapon ~= 0 and weapon ~=1 and weapon ~= 34 then
        if state == "down" then
            if getElementData( localPlayer, "Mira" ) then
              Path = getElementData( localPlayer, "Mira" )
            end
            addEventHandler("onClientRender", root, drawCrosshair)
        else
            removeEventHandler("onClientRender", root, drawCrosshair) 
        end 
    end
end
bindKey("aim_weapon", "both", visibleDraw)