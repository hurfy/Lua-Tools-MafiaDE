local function firstTestFunctions()
	-- Print here
end

local function secondTestFunction()
	-- Print here
end

-- local function killThreadDebug()
-- 	UI.SimpleTextInput("Enter thread name", function(success, thread)
-- 		if success then
-- 			DestroyThread(coreThreads.list.thread)
-- 		else
-- 			print("Dialog was canceled")
-- 		end
-- 	end)
-- end

local function DebugMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Debug Menu")
	
    menu:AddButton("Player Stats", playerUtils.Info)
	menu:AddButton("Vehicle Stats", vehicleUtils.Info)
	menu:AddButton("Test Function #1", firstTestFunctions)
	menu:AddButton("Test Function #2", secondTestFunction)
	-- menu:AddButton("Kill Thread", killThreadDebug)
	menu:AddButton("Print All Threads", coreThreads.printAllThreads)
	menu:AddButton("Kill All Threads", coreThreads.killAllThreads)

	return menu
end
table.insert(ToolsMenuItems, { "Debug Menu", "Tools", ScriptHook.CurrentScript():CacheMenu(DebugMenu) })