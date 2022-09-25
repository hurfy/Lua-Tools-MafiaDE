local script = ScriptHook.CurrentScript()

function script:CacheMenu(menu_callback)
	local menu_cached = nil
	return function()
		menu_cached = menu_cached or menu_callback()
		return menu_cached
	end
end

menu = UI.SimpleMenu()
ToolsMenuItems = menu

menu:SetTitle("Lua Tools")

ToolsMenuItems = {}
include("Scripts/race.lua")
include("Scripts/debug.lua")

for _,data in ipairs(ToolsMenuItems) do
	menu:AddButton(unpack(data))
end

ScriptHook.RegisterKeyHandler("menu", function()
	menu:Toggle()
end)

function mainMenuHide()
	menu:Deactivate()
end