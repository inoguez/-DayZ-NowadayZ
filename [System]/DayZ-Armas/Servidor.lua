weapsAccuracy = { -- [ид пушки] = размер прицела (1 по DEFAULT не увеличивается на весь экран),
  [30] = 1, -- ак-47
  [31] = 1, -- М4 
}

addEventHandler("onResourceStart", root, function()
	for k, v in ipairs(getElementsByType("player")) do
		setStats(v)
	end

  for i, v in ipairs ( weapsAccuracy ) do
  setWeaponProperty (i,"poor","accuracy",v)
  setWeaponProperty (i,"std","accuracy",v)
  setWeaponProperty (i,"pro","accuracy",v)
  end
end)

addEventHandler("onPlayerJoin", root, function()
	setStats(source)
end)

function setStats(Player)
	for i = 69, 79 do
		setPedStat(Player, i, 1000)
	end
end
--


--[[
--Armas Ligeras
setWeaponProperty("m4", "pro", "weapon_range", 220)
setWeaponProperty("m4", "std", "weapon_range", 220)
setWeaponProperty("m4", "poor", "weapon_range", 220)


setWeaponProperty("m4", "pro", "target_range", 220)
setWeaponProperty("m4", "std", "target_range", 220)
setWeaponProperty("m4", "poor", "target_range", 220)
--Armas Pesadas 
setWeaponProperty(30, "pro", "weapon_range", 300)
setWeaponProperty(30, "std", "weapon_range", 300) 
setWeaponProperty(30, "poor", "weapon_range", 300)

setWeaponProperty("ak-47", "pro", "target_range", 190)
setWeaponProperty("ak-47", "std", "target_range", 190)
setWeaponProperty("ak-47", "poor", "target_range", 190)

setWeaponProperty("ak-47", "pro", "damage", 60)


setWeaponProperty("mp5", "pro", "weapon_range", 200)
setWeaponProperty("mp5", "pro", "target_range", 200)

setWeaponProperty("mp5", "pro", "flags", 0x000010)

setWeaponProperty("deagle", "pro", "weapon_range", 200)
setWeaponProperty("deagle", "pro", "target_range", 200)

setWeaponProperty("silenced", "pro", "weapon_range", 200)
setWeaponProperty("silenced", "pro", "target_range", 200)

setWeaponProperty("colt 45", "pro", "weapon_range", 200)
setWeaponProperty("colt 45", "pro", "target_range", 200)

setWeaponProperty("rifle", "pro", "weapon_range", 350)
setWeaponProperty("rifle", "pro", "target_range", 350)

setWeaponProperty("sniper", "pro", "weapon_range", 350)
setWeaponProperty("sniper", "pro", "target_range", 350)

setWeaponProperty("tec-9", "pro", "weapon_range", 200)
setWeaponProperty("tec-9", "pro", "target_range", 200)

setWeaponProperty("uzi", "pro", "weapon_range", 150)
setWeaponProperty("uzi", "pro", "target_range", 150)

setWeaponProperty("combat shotgun", "pro", "weapon_range", 80)
setWeaponProperty("combat shotgun", "pro", "target_range", 80)

setWeaponProperty("shotgun", "pro", "weapon_range", 70)
setWeaponProperty("shotgun", "pro", "target_range", 70)]]




local Municion = {


  --AR-15
  {"currentweapon_1","AR-15",30,31, 250},
  --Tipo AK
  {"currentweapon_1","ACR",30,31, 230},
  {"currentweapon_1","AK-47 Vulcan",30,31, 230},
  {"currentweapon_1","AK-74",30,31, 220},
  {"currentweapon_1","AK-74 GP-25",30,31, 230},
  {"currentweapon_1","AK-107",30,31, 230},
  {"currentweapon_1","AK-107 GL",30,31, 230},
  {"currentweapon_1","AK-107 GL PSO",30,31, 230},
  {"currentweapon_1","AK-107 PSO",30,31, 230},
  {"currentweapon_1","AKM",30,31, 220},
  {"currentweapon_1","AKS",30,31, 220},
  {"currentweapon_1","AKS-74 Kobra",30,31, 230},
  {"currentweapon_1","AKS Gold",30,31, 230},
  --STANAG
  {"currentweapon_1","G36",30,31, 220},
  {"currentweapon_1","G36A",100,31, 220},
  {"currentweapon_1","G36C",30,31, 220},
  {"currentweapon_1","G36C SD",30,31, 220},
  {"currentweapon_1","G36K",30,31, 220},
  {"currentweapon_1","M4A1",30,31, 230},
  {"currentweapon_1","M4A1 CCO",30,31, 230},
  {"currentweapon_1","M4A1 CCO SD",30,31, 210},
  {"currentweapon_1","M4A3 CCO",30,31, 250},
  {"currentweapon_1","RPK",30,31, 250},

  --Tipos secundarias
  {"currentweapon_2","Desert Eagle",7,24, 190},
  {"currentweapon_2","G17", 17, 23, 150},
  {"currentweapon_2","M9", 17, 23, 150},
  {"currentweapon_2","M9 SD", 17, 23, 150},
  {"currentweapon_2","M1911", 17, 23, 150},
  {"currentweapon_2","MP5A5", 12, 22, 220},
  {"currentweapon_2","MP5SD6", 12, 23, 220},
  {"currentweapon_2","Bizon PP-19 SD", 30, 29, 220},
  {"currentweapon_2","P90", 30, 29, 180},
  --Tipos Shotguns
  {"currentweapon_1","AA-12",20,27, 100},
  --Tipos Machine Guns
  {"currentweapon_1","M240", 100,30, 270},
  {"currentweapon_1","M249 Saw", 100, 30, 250},
  {"currentweapon_1","Mk48", 100, 30, 250},
  {"currentweapon_1","PKP", 100, 30, 250},
  {"currentweapon_1","PKM", 100, 30, 250},
  {"currentweapon_1","RPD", 100, 30, 230}
}

function WeaponProperty(previousWeaponID,currentWeaponID)
  for index, weapon in pairs(Municion) do
    if currentWeaponID == weapon[4] and getElementData(source,weapon[1]) == weapon[2] then
      setWeaponProperty(weapon[4],"poor","maximum_clip_ammo",weapon[3])
      setWeaponProperty(weapon[4],"std","maximum_clip_ammo",weapon[3])
      setWeaponProperty(weapon[4],"pro","maximum_clip_ammo",weapon[3])  
      setWeaponProperty(weapon[4], "pro", "weapon_range", 270)
      setWeaponProperty(weapon[4], "std", "weapon_range", 270) 
      setWeaponProperty(weapon[4], "poor", "weapon_range", 270) 

      setWeaponProperty(weapon[4], "pro", "target_range", weapon[5])
      setWeaponProperty(weapon[4], "std", "target_range", weapon[5]) 
      setWeaponProperty(weapon[4], "poor", "target_range", weapon[5])
    end
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), WeaponProperty)