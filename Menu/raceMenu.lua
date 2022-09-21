raceMenu = {}

local function raceCheck()
    local veh = getp():GetOwner()
    if veh ~= nil then
        raceMenu.hide()
        raceScr.enterRace()
    else
        print("You are not in the vehicle!")
    end
end

function raceMenu.RaceMenu()
	menu = UI.SimpleMenu()
	menu:SetTitle("Race Menu")
	
    menu:AddButton("Start Race", raceCheck)
	menu:AddButton("Show Stats", raceScr.showStats)

	return menu
end

function raceMenu.hide()
    menu:Deactivate()
end

table.insert(ToolsMenuItems, { "Race Menu", "Race", ScriptHook.CurrentScript():CacheMenu(raceMenu.RaceMenu) })