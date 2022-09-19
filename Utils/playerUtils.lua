playerUtils = {}

function playerUtils.Info()
    local player = getp()

    local playerPosition = player:GetPos()
    local playerDirection = player:GetDir()

    if vehicleUtils.Vehicle() == nil then
        print("<--------------------------------------Player-Info------------------------------------->")
        print("Position: ".. tostring(playerPosition.x) .. ", " .. tostring(playerPosition.y) .. ", " .. tostring(playerPosition.z))
        print("Direction: ".. tostring(playerDirection.x) .. ", " .. tostring(playerDirection.y) .. ", " .. tostring(playerDirection.z))
        print("<--------------------------------------Player-Info------------------------------------->")
    else
        print("Are you in the car?")
        return
    end
end