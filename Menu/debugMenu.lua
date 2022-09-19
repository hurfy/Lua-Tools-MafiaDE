local vehicle = getp():GetOwner()

local function playerStats()
	if vehicle == nil then
		
	else
		print("You are in a vehicle!")
	end
end

local function vehicleStats()
	if vehicle ~= nil then

	else
		print("You are not in the vehicle!")
	end
end

local function firstTestFunctions()
	-- Print here
	-- coreStats.checkDistanceToPointThread(Math:newVector(1, 1, 1))
end

local function secondTestFunction()
	-- Print here
	-- coreStats.killThread(coreStats.statsData.distanceToPointThread)
end

local function DebugMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Debug Menu")
	
    menu:AddButton("Player Stats", playerUtils.Info)
	menu:AddButton("Vehicle Stats", vehicleUtils.Info)
	menu:AddButton("Test Function #1", firstTestFunctions)
	menu:AddButton("Test Function #2", secondTestFunction)

	return menu
end
table.insert(ToolsMenuItems, { "Debug Menu", "Tools", ScriptHook.CurrentScript():CacheMenu(DebugMenu) })