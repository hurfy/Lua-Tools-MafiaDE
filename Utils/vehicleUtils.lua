vehicleUtils = {}

function vehicleUtils.Vehicle()
    local player = getp()
    local vehicle = player:GetOwner()

    if vehicle ~= nil then
        return vehicle
    else
        return nil
    end
end

function vehicleUtils.Info()
    local veh = vehicleUtils.Vehicle()

    local vehPosition = veh:GetPos()
    local vehDirection = veh:GetDir()
    local vehName = veh:GetVehicleModelName()
    local vehId = veh:GetCarTableId()
    local vehDamage = veh:GetDamage()
    local vehMotorDamage = veh:GetMotorDamage()
    local vehActualGear = veh:GetGear()
    local vehGearCount = veh:GetGearCount()
    local vehActualFuel = veh:GetActualFuel()
    local vehFuelCop = veh:GetFuelTankCapacity()
    local vehWheelsF = veh:GetWheel(1)
    local vehWheelsR = veh:GetWheel(2)
    local vehDirty = veh:GetDirty()
    local vehColorF = veh:GetColor(1)
    local vehColorS = veh:GetColor(2)

    if veh ~= nil then
        print("<--------------------------------------Vehicle-Info------------------------------------->")
        print("Name: ".. vehName .."(".. vehId ..")")
        print("Damage: ".. vehDamage .. " | Motor Damage: ".. vehMotorDamage)
        print("Dirty: ".. vehDirty)
        print("Gear: ".. vehActualGear .."/".. vehGearCount)
        print("Fuel: ".. vehActualFuel .."/".. vehFuelCop)
        print("Front Wheels: ".. vehWheelsF .. " | Rare Wheels: ".. vehWheelsR)
        print("First Color: ".. vehColorF .. " | Second Color: ".. vehColorS)
        print("Position: ".. tostring(vehPosition.x) .. ", " .. tostring(vehPosition.y) .. ", " .. tostring(vehPosition.z))
        print("Direction: ".. tostring(vehDirection.x) .. ", " .. tostring(vehDirection.y) .. ", " .. tostring(vehDirection.z))
        print("<--------------------------------------Vehicle-Info------------------------------------->")
    else
        return
    end
end