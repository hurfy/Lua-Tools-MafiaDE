mainMenu = {}

local script = ScriptHook.CurrentScript()

function script:CacheMenu(menu_callback)
	local menu_cached = nil
	return function()
		menu_cached = menu_cached or menu_callback()
		return menu_cached
	end
end

mainMenu.menu = UI.SimpleMenu()
ToolsMenuItems = mainMenu.menu

mainMenu.menu:SetTitle("Lua Tools")

ToolsMenuItems = {}
include("raceMenu.lua")
include("debugMenu.lua")

for _,data in ipairs(ToolsMenuItems) do
	mainMenu.menu:AddButton(unpack(data))
end

ScriptHook.RegisterKeyHandler("menu", function()
	mainMenu.menu:Toggle()
end)

function mainMenu.hide()
	mainMenu.menu:Deactivate()
end