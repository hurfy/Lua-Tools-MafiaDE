module("coreStats", package.seeall)

statsData = {
	-- Vars
	actualSpeed = nil,
	actualEngineRotations = nil,
	actualGear = nil,
	actualDirty = nil,
	distanceToPoint = nil,

	-- Threads
	threads = {},

	-- Stuff
	getVehicle = getp():GetOwner(),
	getPlayer = getp(),
	ifNotInTheVeh = "You are not in the vehicle!",
}

function checkCarSpeedThread(value)
	if statsData.threads.carSpeedThread == nil then
		statsData.threads.carSpeedThread = StartThread(function()
  			if statsData.getVehicle ~= nil then
  				while true do
    				if value == "km" then
    					statsData.actualSpeed = statsData.getVehicle:GetSpeedFloat()
    				elseif value == "mile" then
    					statsData.actualSpeed = statsData.getVehicle:GetSpeedFloat() / 1.6093
    				end
    				Sleep(1)
    			end
    		else
    			print(statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function checkCarActualEngineRotationsThread()
	if statsData.threads.carActualEngineRotationsThread == nil then
		statsData.threads.carActualEngineRotationsThread = StartThread(function()
  			if statsData.getVehicle ~= nil then
  				while true do
    				statsData.actualEngineRotations = statsData.getVehicle:GetEngineRotations()
    			Sleep(1)
    			end
    		else
    			print(statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function checkCarActualGearThread()
	if statsData.threads.carActualGearThread == nil then
		statsData.threads.carActualGearThread = StartThread(function()
  			if statsData.getVehicle ~= nil then
  				while true do
    				statsData.actualGear = statsData.getVehicle:GetGear()
    			Sleep(1)
    			end
    		else
    			print(statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function checkCarActualFuelThread()
	if statsData.threads.carActualFuelThread == nil then
		statsData.threads.carActualFuelThread = StartThread(function()
  			if statsData.getVehicle ~= nil then
  				while true do
    				statsData.actualFuel = statsData.getVehicle:GetActualFuel()
    			Sleep(1)
    			end
    		else
    			print(statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function checkCarActualDirtyThread()
	if statsData.threads.carActualDirtyThread == nil then
		statsData.threads.carActualDirtyThread = StartThread(function()
  			if statsData.getVehicle ~= nil then
  				while true do
    				statsData.actualDirty = statsData.getVehicle:GetDirty()
    			Sleep(1)
    			end
    		else
    			print(statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function checkDistanceToPointThread(pnt)
	if statsData.distanceToPointThread == nil then
		statsData.distanceToPointThread = StartThread(function()
			while true do
				distanceToPoint = getp():GetPos():DistanceToPoint(pnt)
				-- print(distanceToPoint)
				Sleep(1)
			end
		end)
	end
end

-----Destroy Threads--------------------------------------------------------------------------------

function killThread(thread)
	DestroyThread(thread)
end

function killAllThreads()
	for i = 1, #statsData.threads do
		DestroyThread(i)
		statsData.threads[i] = nil
		i = i + 1
	end
end