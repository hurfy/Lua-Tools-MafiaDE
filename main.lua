main = {}

include("loader.lua")

local script = ScriptHook.CurrentScript()
script.Entities = {}

function script:OnLoad()
	print("Script tools loaded!")
	loader.ImportLua(loader._luas)

	-- ScriptHook.RegisterKeyHandler("menu", function()
	-- end)
end