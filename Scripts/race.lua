local raceData = {
	carPos = {carRacePos = Math:newVector(1268.701904, 1115.028320, 29.736038), carRaceDir = Math:newVector(-0.948982, -0.315281, 0.005639), carExitPos = Math:newVector(1256.999268, 1226.922363, 29.779093), carExitDir = Math:newVector(0.950216, 0.311250, 0.014573)},
	checkpointEntity = game.entitywrapper:GetEntityByName("sm_ef_110_checkpoint_00"),
	checkpointObjectiveEntity = game.game:CreateCleanEntity(Math:newVector(0.0, 0.0, 0.0), 0, false, false, true),
	checkpointPos = {firstCheckPoint = Math:newVector(1008.407654, 1025.296631, 29.732229), secondCheckPoint = Math:newVector(798.776794, 952.718140, 29.738003), thirdCheckPoint = Math:newVector(609.699707, 888.126831, 29.738777), fourthCheckPoint = Math:newVector(420.526306, 822.898438, 29.743311), finishCheckPoint = Math:newVector(213.174789, 751.339417, 29.738504)},
	checkpointTime = {first = nil, second = nil, third = nil, fourth = nil, finish = nil},
}

local function createTimer()
	game.hud:RacingStart(0, 0)
	game.hud:RacingShowHud(true)
end

local function getTimeFromTimer()
	game.hud:RacingGetTime()
end

local function destroyTimer()
	game.hud:RacingStop()
	game.hud:RacingShowHud(false)
	game.hud:RacingClear()
end

local function createCheckpoint(pos, text)
    raceData.checkpointEntity:Deactivate()
    raceData.checkpointEntity:SetPos(pos) 
    raceData.checkpointObjectiveEntity:SetPos(pos)
    game.hud:AddEntityIndicator(raceData.checkpointObjectiveEntity, "objective_primary", Math:newVector(0,0,-1))
    game.hud:SetTextEntityIndicator(raceData.checkpointObjectiveEntity, text)
    raceData.checkpointEntity:Activate()
end

local function removeCheckpont()
	game.hud:RemoveEntityIndicator(raceData.checkpointObjectiveEntity)
end

local function teleportCar(pos)
	if pos == "race" then
		getp():GetOwner():SetPos(raceData.carPos.carRacePos)
		getp():GetOwner():SetDir(raceData.carPos.carRaceDir)
		setPlayerCamera("race")
	else
		getp():GetOwner():SetPos(raceData.carPos.carExitPos)
		getp():GetOwner():SetDir(raceData.carPos.carExitDir)
		setPlayerCamera("exit")
	end
end

local function setSpeedZero()
	getp():GetOwner():SetSpeed(0)
end

-- Soon_TM