coreStats = {}

coreStats.statsData = {
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

function coreStats.checkCarSpeedThread(value)
	if coreStats.statsData.threads.carSpeedThread == nil then
		coreStats.statsData.threads.carSpeedThread = StartThread(function()
  			if coreStats.statsData.getVehicle ~= nil then
  				while true do
    				if value == "km" then
    					coreStats.statsData.actualSpeed = coreStats.statsData.getVehicle:GetSpeedFloat()
    				elseif value == "mile" then
    					coreStats.statsData.actualSpeed = coreStats.statsData.getVehicle:GetSpeedFloat() / 1.6093
    				end
    				Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualEngineRotationsThread()
	if coreStats.statsData.threads.carActualEngineRotationsThread == nil then
		coreStats.statsData.threads.carActualEngineRotationsThread = StartThread(function()
  			if coreStats.statsData.getVehicle ~= nil then
  				while true do
    				coreStats.statsData.actualEngineRotations = coreStats.statsData.getVehicle:GetEngineRotations()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualGearThread()
	if coreStats.statsData.threads.carActualGearThread == nil then
		coreStats.statsData.threads.carActualGearThread = StartThread(function()
  			if coreStats.statsData.getVehicle ~= nil then
  				while true do
    				coreStats.statsData.actualGear = coreStats.statsData.getVehicle:GetGear()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualFuelThread()
	if coreStats.statsData.threads.carActualFuelThread == nil then
		coreStats.statsData.threads.carActualFuelThread = StartThread(function()
  			if coreStats.statsData.getVehicle ~= nil then
  				while true do
    				coreStats.statsData.actualFuel = coreStats.statsData.getVehicle:GetActualFuel()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualDirtyThread()
	if coreStats.statsData.threads.carActualDirtyThread == nil then
		coreStats.statsData.threads.carActualDirtyThread = StartThread(function()
  			if coreStats.statsData.getVehicle ~= nil then
  				while true do
    				coreStats.statsData.actualDirty = coreStats.statsData.getVehicle:GetDirty()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkDistanceToPointThread(pnt)
	if coreStats.statsData.distanceToPointThread == nil then
		coreStats.statsData.distanceToPointThread = StartThread(function()
			while true do
				distanceToPoint = getp():GetPos():DistanceToPoint(pnt)
				print(distanceToPoint)
				Sleep(1)
			end
		end)
	end
end

-----Destroy Threads-------------------------------------------------------------------------------

function coreStats.killThread(thread)
	DestroyThread(thread)
end

function coreStats.killAllThreads()
	-- for i = 1, #coreStats.statsData.threads do
	-- 	DestroyThread(i)
	-- 	coreStats.statsData.threads[i] = nil
	-- 	i = i + 1
	-- end
	DestroyThread(coreStats.statsData.threads)
end
