-- Menu
include("menu/menu.lua")

-- Core
include("Core/coreStats.lua")

-- Data
include("Data/animsData.lua")
include("Data/carTuneData.lua")
include("Data/checkpointsData.lua")
include("Data/colorsData.lua")
include("Data/componentsData.lua")
include("Data/vehiclesData.lua")
include("Data/weaponsData.lua")
include("Data/weatherData.lua")
include("Data/wheelsData.lua")

-- Main
local script = ScriptHook.CurrentScript()
script.Entities = {}

function script:OnLoad()
	print("Script tools loaded!")
end