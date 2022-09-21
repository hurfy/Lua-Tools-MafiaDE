coreThreads = {}

coreThreads.list = {}

function coreThreads.killThread(name)
    DestroyThread(name)
end

function coreThreads.killAllThreads()
    local threadsList = coreThreads.list
    for _,v in pairs(threadsList) do
		v = DestroyThread()
	end
end

function coreThreads.printAllThreads()
    local threadsList = coreThreads.list
    print("<--------------------------------------Threads-Info------------------------------------->")
    for _,v in pairs(threadsList) do
		print(_)
	end
    print("<--------------------------------------Threads-Info------------------------------------->")
end