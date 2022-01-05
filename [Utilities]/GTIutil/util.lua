----------------------------------------->>
-- GTI: Grand Theft International Network
-- Date: 15 Dec 2013
-- Resource: GTIutil/util.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Get Element Speed
--------------------->>

function getElementSpeed(element, unit)
	if (unit == nil) then unit = 0 end
	if (not isElement(element) or type(unit) ~= "string") then return end
	
	local x,y,z = getElementVelocity(element)
	local MTASpeed = (x^2 + y^2 + z^2) ^ 0.5
	local mps = MTASpeed * 50
	
	if (unit=="mph") then
		return mps * 2.23694
	else
		return mps * 3.6
	end
end

-- tocomma
----------->>

function tocomma(number)
	while true do  
		number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return number
end

-- Team
-------->>

function isPlayerInTeam(player, teamName)
	local team = getPlayerTeam(player)
	if (not team) then return false end
	local team = getTeamName(team)
	if (team ~= teamName) then return false end
	return true
end

-- To Date
----------->>

function todate(timestamp)
	local year = math.floor(timestamp/31557600)+1970
	local isLeapYear = false
	if ((year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)) then
		isLeapYear = true
	end
	
	local daysLeft = math.floor((timestamp-((year-1970)*31557600))/86400)+1
	local month = 1
	if (daysLeft <= 31) then
		month = 1
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if ((daysLeft <= 28) or (isLeapYear and daysLeft <= 29)) then
		month = 2
		return daysLeft, month, year
	end
	if (not isLeapYear) then
		daysLeft = daysLeft - 28 else daysLeft = daysLeft - 29 end
	if (daysLeft <= 31) then
		month = 3
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 4
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 5
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 6
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 7
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 31) then
		month = 8
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 9
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 10
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 11
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	month = 12
	if (daysLeft > 31) then daysLeft = 31 end
	return daysLeft, month, year
end

-- Month Number to Text
------------------------>>

local monthTable = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
function getMonthName(month, digits)
	if (not monthTable[month]) then return end
	local month = monthTable[month]
	if (digits) then
		month = string.sub(month, 1, digits)
	end
	return month
end

-- Random Names
---------------->>

local randomNamesList = {
	"Lucia Tate", "Allen Edwards", "Joe Phillips", "John Frank", "Mario Erickson", "Leland Mann", "Kirk Wells", "Lila Mason", "Ruby Mendoza",
	"Alberta Mills", "Erika Diaz", "Janis Allen", "Paulette Gibbs", "Lillie Vargas", "Eunice Blake", "Rafael Figueroa", "Amy Bryan",
	"Stewart Holt", "Margie Hawkins", "Larry Holloway", "Florence Turner", "Christian Watkins", "Marjorie Thomas", "Joy Patton",
	"Janet Ruiz", "Jessie Bell", "Aubrey Boyd", "Brendan Roberts", "Eleanor Gregory", "Kellie Spencer", "Judy Shelton", "Lynda Ingram",
	"Deborah Singleton", "Robyn Lawson", "Josefina Brewer", "Olive Stevens", "Verna Beck", "Antoinette Todd", "Sheldon Cortez",
	"Lowell Glover", "Gerald Romero", "Jane Strickland", "Rodney Henry", "Shane Lewis", "Alfred Barnes", "Kurt Bates", "Rudy Hunter",
	"Javier Payne", "Kristine Mendez", "Ron Hayes", "Ralph Scott", "Jesse Morris", "James Ross", "Lawrence Murphy", "Larry Parker", 
	"Roger Green", "Patrick Hernandez", "Diana Jenkins", "Henry Kelly", "Julia Turner", "Nicholas Jones", "Beverly Williams", 
	"Jean Gonzalez", "Evelyn Long", "Jimmy Stewart", "Andrew Simmons", "Jeffrey Bennett", "Cheryl Henderson", "Martin Rivera", 
	"Brian Johnson", "Gloria Taylor", "Christina Garcia", "Wanda Russell", "Carol Anderson", "Sandra Smith", "Rebecca Brown", "Jane Young",
	"Laura Campbell", "Kathryn Gonzales", "Peter Washington", "Deborah Clark", "Victor Wood", "Raymond Roberts", "Phyllis Hill", 
	"Andrea Torres", "Howard Jackson", "Mildred Cox", "Margaret Walker", "Louise Thompson", "Roy Miller", "Juan Adams", "Philip Howard",
	"Lillian Rogers", "Albert Wilson", "Angela Perry", "Ruby Griffin", "Marilyn Diaz", "Irene Harris", "Bobby Perez", "Mark Bryant", 
	"Denise Price", "Kathleen Bell", "Samuel James", "Arthur Edwards", "Frank Alexander", "Phillip Cook", "Jacqueline Evans", 
	"Melissa Martin", "Alice Robinson", "Gerald Butler", "Janet Brooks", "Heather Thomas", "Eric Watson", "Billy Patterson", 
	"Steven Mitchell", "Joshua Wright", "Dennis Bailey", "Adam Baker", "Kevin Nelson", "Steve Powell", "Willie Lee", "Jack Allen", 
	"Kimberly Coleman", "Susan Phillips", "Christine Hall", "Wayne Hughes", "Thomas Gray", "Ashley Sanders", "Stephen Rodriguez", 
	"Janice Richardson", "Debra King", "Joyce Davis", "Kelly Martinez", "Craig Morgan", "Daniel Lopez", "Joan Cooper", "Gary Moore", 
	"Sara Sanchez", "Joseph White", "Annie Ward", "Martha Flores", "Johnny Carter", "Norma Collins", "Eugene Foster", "Carl Reed", 
	"Donna Peterson", "Paul Ramirez", "Diane Barnes", "Earl Lewis", "Dianne Feinstein", "Barbara Boxer", "Harry Reid", "Dean Heller",
}

function getGenericName()
	return randomNamesList[math.random(#randomNamesList)]
end

-- Find Rotation
----------------->>

function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end
	return t
end