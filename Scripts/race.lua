local raceData = {
	carPos = {carRacePos = Math:newVector(1268.701904, 1115.028320, 29.72325), carRaceDir = Math:newVector(-0.948982, -0.315281, 0.005639), carExitPos = Math:newVector(1256.999268, 1226.922363, 29.790012), carExitDir = Math:newVector(0.950216, 0.311250, 0.014573)},
	checkpointPos = {firstCheckPoint = Math:newVector(1008.407654, 1025.296631, 29.732229), secondCheckPoint = Math:newVector(798.776794, 952.718140, 29.738003), thirdCheckPoint = Math:newVector(609.699707, 888.126831, 29.738777), fourthCheckPoint = Math:newVector(420.526306, 822.898438, 29.743311), finishCheckPoint = Math:newVector(213.174789, 751.339417, 29.738504)},
	checkpointTime = {first = nil, second = nil, third = nil, fourth = nil, finish = nil},
	speedTime = {s_40 = nil, s_60 = nil, s_80 = nil, s_100 = nil, s_120 = nil, s_140 = nil}
}

--STATS--

local function showStats()
	local checkpoint_first = tostring(raceData.checkpointTime.first)
	local checkpoint_second = tostring(raceData.checkpointTime.second)
	local checkpoint_third = tostring(raceData.checkpointTime.third)
	local checkpoint_fourth = tostring(raceData.checkpointTime.fourth)
	local checkpoint_finish = tostring(raceData.checkpointTime.finish)

	local speed_40 = tostring(raceData.speedTime.s_40)
	local speed_60 = tostring(raceData.speedTime.s_60)
	local speed_80 = tostring(raceData.speedTime.s_80)
	local speed_100 = tostring(raceData.speedTime.s_100)
	local speed_120 = tostring(raceData.speedTime.s_120)
	local speed_140 = tostring(raceData.speedTime.s_140)

	raceResults = "1st. Checkpoint: "..checkpoint_first.."\n2nd. Checkpoint: "..checkpoint_second.."\n3rd. Checkpoint: "..checkpoint_third.."\n4th. Checkpoint: "..checkpoint_fourth.."\nFinish: "..checkpoint_finish.."\n0-40: "..speed_40.." | 0-60: "..speed_60.." | 0-80: "..speed_80.."\n0-100: "..speed_100.." | 0-120: "..speed_120.." | 0-140: "..speed_140

	raceMenuHide()
	coreThreads.list.showStatsThread = StartThread(function()
		Sleep(500)
		game.hud:SendMessageMovie("HUD", "OnShowFreerideBanner", "Race Stats:", raceResults)
		coreThreads.list.showStatsThread = DestroyThread()
	end)
end

--TIMER--

local function createTimer()
	game.hud:RacingStart(0, 0)
	game.hud:RacingShowHud(true)
end

local function getTime()
	time = string.format("%.2f", game.hud:RacingGetTime())

	return time
end	

local function destroyTimer()
	game.hud:RacingStop()
	game.hud:RacingClear()
end

--CAMERA--

local function setPlayerCamera(dir)
	LookAtVector = getp():GetPos()
	if dir == "enter" then
		LookAtVector.x = -2300 -- BREH -_-
		LookAtVector.y = 0
		LookAtVector.z = 0

		game.cameramanager:GetPlayerCamera():ScriptPointAtVec(LookAtVector, 0, 1, 0)

	elseif dir == "exit" then
		LookAtVector.x = 7000 -- BREH -_-
		LookAtVector.y = 0
		LookAtVector.z = 0

		game.cameramanager:GetPlayerCamera():ScriptPointAtVec(LookAtVector, 0, 1, 0)
	end
end

--TELEPORT--

local function teleportCar(pos)
	if pos == "enter" then
		getp():GetOwner():SetPos(raceData.carPos.carRacePos)
		getp():GetOwner():SetDir(raceData.carPos.carRaceDir)
		setPlayerCamera("enter")
	elseif pos == "exit" then
		getp():GetOwner():SetPos(raceData.carPos.carExitPos)
		getp():GetOwner():SetDir(raceData.carPos.carExitDir)
		setPlayerCamera("exit")
	end
end

--CHECKPOINTS--

local function createCheckpoint(pos)
	checkpointEntity = game.entitywrapper:GetEntityByName("sm_ef_110_checkpoint_00")
	checkpointObjectiveEntity = game.game:CreateCleanEntity(Math:newVector(0.0, 0.0, 0.0), 0, false, false, true)

    checkpointEntity:Deactivate()
    checkpointEntity:SetPos(pos) 
    checkpointObjectiveEntity:SetPos(pos)
    game.hud:AddEntityIndicator(checkpointObjectiveEntity, "objective_primary", Math:newVector(0,0,-1))
    checkpointEntity:Activate()
end

local function removeCheckpont()
	checkpoint_objective_entity = nil
	game.hud:RemoveEntityIndicator(checkpointObjectiveEntity)
end

local function exitRace()
	coreThreads.list.exitRaceThread = StartThread(function()
		local veh = getp():GetOwner()

		veh:SetSpeed(0)
		game.hud:FaderFadeOut(5)
		teleportCar("exit")
		Sleep(5000)
		game.hud:FaderFadeIn(350)
		Sleep(500)
		game.hud:SendMessageMovie("HUD", "OnShowFreerideBanner", "Race Stats:", raceResults)
		Sleep(500)
		coreThreads.list.exitRaceThread = DestroyThread()
	end)
end

--RACE--

local function checkpointsRace()
	coreThreads.list.checkpointsRaceThread = StartThread(function()
		local checkpoint_flag = 0

		createCheckpoint(raceData.checkpointPos.firstCheckPoint)

		while coreThreads.list.checkpointsRaceThread ~= nil do
			local veh = getp():GetOwner()
			local first = raceData.checkpointPos.firstCheckPoint:DistanceToPoint(veh:GetPos())
			local second = raceData.checkpointPos.secondCheckPoint:DistanceToPoint(veh:GetPos())
			local third = raceData.checkpointPos.thirdCheckPoint:DistanceToPoint(veh:GetPos())
			local fourth = raceData.checkpointPos.fourthCheckPoint:DistanceToPoint(veh:GetPos())
			local finish = raceData.checkpointPos.finishCheckPoint:DistanceToPoint(veh:GetPos())

			if first <= 5 and checkpoint_flag == 0 then
				raceData.checkpointTime.first = getTime()
				removeCheckpont()
				createCheckpoint(raceData.checkpointPos.secondCheckPoint)
				checkpoint_flag = 1
			end
			checkpoint_flag = 0
			if second <= 5 and checkpoint_flag == 0 then
				raceData.checkpointTime.second = getTime()
				removeCheckpont()
				createCheckpoint(raceData.checkpointPos.thirdCheckPoint)
				checkpoint_flag = 1
			end
			checkpoint_flag = 0
			if third <= 5 and checkpoint_flag == 0 then
				raceData.checkpointTime.third = getTime()
				removeCheckpont()
				createCheckpoint(raceData.checkpointPos.fourthCheckPoint)
				checkpoint_flag = 1
			end
			checkpoint_flag = 0
			if fourth <= 5 and checkpoint_flag == 0 then
				raceData.checkpointTime.fourth = getTime()
				removeCheckpont()
				createCheckpoint(raceData.checkpointPos.finishCheckPoint)
				checkpoint_flag = 1
			end
			checkpoint_flag = 0
			if finish <= 5 and checkpoint_flag == 0 then
				exitRace()
				raceData.checkpointTime.finish = getTime()
				destroyTimer()
				removeCheckpont()
				checkpoint_flag = 1
				coreThreads.list.speedRaceThread = DestroyThread()
				coreThreads.list.checkpointsRaceThread = DestroyThread()
			end
			Sleep(1)
		end
	end)
end

local function speedRace()
	coreThreads.list.speedRaceThread = StartThread(function()
		local speed_flag = 0

		while coreThreads.list.speedRaceThread ~= nil do
			local veh = getp():GetOwner()
			local speed = veh:GetSpeedFloat() / 1.6093

			if speed >= 40 and speed_flag == 0 then
				raceData.speedTime.s_40 = getTime()
				speed_flag = 1
			end
			speed_flag = 0
			if speed >= 60 and speed_flag == 0 then
				raceData.speedTime.s_60 = getTime()
				s_6speed_flag0f = 1
			end
			speed_flag = 0
			if speed >= 80 and speed_flag == 0 then
				raceData.speedTime.s_80 = getTime()
				speed_flag = 1
			end
			speed_flag = 0
			if speed >= 100 and speed_flag == 0 then
				raceData.speedTime.s_100 = getTime()
				speed_flag = 1
			end
			speed_flag = 0
			if speed >= 120 and speed_flag == 0 then
				raceData.speedTime.s_120 = getTime()
				speed_flag = 1
			end
			speed_flag = 0
			if speed >= 140 and speed_flag == 0 then
				raceData.speedTime.s_140 = getTime()
				speed_flag = 1
			end
			speed_flag = 0
			Sleep(1)
		end
	end)
end

local function enterRace()
	coreThreads.list.enterRaceThread = StartThread(function()
		local veh = getp():GetOwner()
		
		Sleep(200)
		destroyTimer()
		removeCheckpont()
		game.hud:FaderFadeOut(350)
		Sleep(1000)
		veh:SetSpeed(0)
		getp():SetControlStyle(enums.ControlStyle.LOCKED)
		veh:Lock()
		teleportCar("enter")
		Sleep(5000)
		veh:Repair()
		veh:Unlock()
		game.hud:FaderFadeIn(350)
		getp():SetControlStyle(enums.ControlStyle.FREE)
		veh:SetPreLaunchMode(true)
		Wait(game.hud:StartCountDown(5))
		veh:SetPreLaunchMode(false)
		createTimer()
		checkpointsRace()
		speedRace()
		coreThreads.list.enterRaceThread = DestroyThread()
	end)
end

--CHECK--

local function isPlayerInVehicle()
    local veh = getp():GetOwner()
    if veh ~= nil then
        raceMenuHide()
        enterRace()
    else
        print("You are not in the vehicle!")
    end
end

--MENU--

function raceMenu()
	menu = UI.SimpleMenu()
	menu:SetTitle("Race Menu")
	
    menu:AddButton("Start Race", isPlayerInVehicle)
	menu:AddButton("Show Stats", showStats)

	return menu
end

function raceMenuHide()
    if menu:IsActive() ~= nil then
        menu:Deactivate()
    else
        return
    end
end

table.insert(ToolsMenuItems, { "Race Menu", "Race", ScriptHook.CurrentScript():CacheMenu(raceMenu) })