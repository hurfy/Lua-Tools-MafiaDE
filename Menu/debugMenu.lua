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

local function testFunctions()
	-- Print here
end

local function DebugMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Debug Menu")
	
    menu:AddButton("Player Stats")
	menu:AddButton("Vehicle Stats", vehicleUtils.Info)
	menu:AddButton("Test Function")
	menu:AddButton("Teleport Menu")

	return menu
end
table.insert(ToolsMenuItems, { "Debug Menu", "Tools", ScriptHook.CurrentScript():CacheMenu(DebugMenu) })