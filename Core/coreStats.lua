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
	ifNotInTheVeh = "You are not in the vehicle!",
}

function coreStats.checkCarSpeedThread(value)
	if coreThreads.list.carSpeedThread == nil then
		coreThreads.list.carSpeedThread = StartThread(function()
			local veh = getp():GetOwner()
  			if veh ~= nil then
  				while true do
    				if value == "km" then
    					coreStats.statsData.actualSpeed = veh:GetSpeedFloat()
    				elseif value == "mile" then
    					coreStats.statsData.actualSpeed = veh:GetSpeedFloat() / 1.6093
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
	if coreThreads.list.carActualEngineRotationsThread == nil then
		coreThreads.list.carActualEngineRotationsThread = StartThread(function()
			local veh = getp():GetOwner()
  			if veh ~= nil then
  				while true do
    				coreStats.statsData.actualEngineRotations = veh:GetEngineRotations()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualGearThread()
	if coreThreads.list.carActualGearThread == nil then
		coreThreads.list.carActualGearThread = StartThread(function()
			local veh = getp():GetOwner()
  			if veh ~= nil then
  				while true do
    				coreStats.statsData.actualGear = veh:GetGear()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualFuelThread()
	if coreThreads.list.carActualFuelThread == nil then
		coreThreads.list.carActualFuelThread = StartThread(function()
			local veh = getp():GetOwner()
  			if veh ~= nil then
  				while true do
    				coreStats.statsData.actualFuel = veh:GetActualFuel()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkCarActualDirtyThread()
	if coreThreads.list.carActualDirtyThread == nil then
		coreThreads.list.carActualDirtyThread = StartThread(function()
			local veh = getp():GetOwner()
  			if veh ~= nil then
  				while true do
    				coreStats.statsData.actualDirty = veh:GetDirty()
    			Sleep(1)
    			end
    		else
    			print(coreStats.statsData.ifNotInTheVeh)
    		end
		end)
	end
end

function coreStats.checkDistanceToPointThread(pnt)
	if coreThreads.list.distanceToPointThread == nil then
		coreThreads.list.distanceToPointThread = StartThread(function()
			local veh = getp():GetOwner()
			while true do
				coreStats.statsData.distanceToPoint = veh:DistanceToPoint(pnt)
				Sleep(1)
			end
		end)
	end
end