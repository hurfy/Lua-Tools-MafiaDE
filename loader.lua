loader = {}

loader._luas = {
    "Core/coreStats.lua",
    "Core/coreThreads.lua",

    "menu.lua",
    
    "Data/animsData.lua",
    "Data/carTuneData.lua",
    "Data/checkpointsData.lua",
    "Data/colorsData.lua",
    "Data/componentsData.lua",
    "Data/raceData.lua",
    "Data/vehiclesData.lua",
    "Data/weaponsData.lua",
    "Data/weatherData.lua",
    "Data/wheelsData.lua",

    "Scripts/race.lua",
    "Scripts/debug.lua",

    "Utils/playerUtils.lua",
    "Utils/vehicleUtils.lua"
}

function loader.ImportLua(luas)
    for _,lua in ipairs(luas) do
        if game then
            include(lua)
        else
            require(lua)
        end
    end
end