EnableDebug = false
EnableCommands = true
inMinigame = false
result = nil

function Lockpick(levels, timer)
    if not levels then levels = 5 end
    if not timer then timer = 30 end
    local minigameData = { name = "lockpick", levels = levels, timer = timer }
    return StartMinigame(minigameData)
end

function Chopping(numLetters, timer)
  if not numLetters then numLetters = 12 end
  if not timer then timer = 30 end

  local minigameData = { name = "chopping", numLetters = numLetters, timer = timer }
  return StartMinigame(minigameData)
end

function PinCracker(pinLength, timer)
    if not pinLength then pinLength = 3 end
    if not timer then timer = 20 end

    local minigameData = { name = "pincracker", length = pinLength, timer = timer }
    return StartMinigame(minigameData)
end

function RoofRunning(rows, columns, timer)
    if not rows then rows = 5 end
    if not columns then columns = 5 end
    if not timer then timer = 30 end
    local minigameData = { name = "roof-running", rows = rows, columns = columns, timer = timer }
    return StartMinigame(minigameData)
end

function Thermite(targetScore, rows, columns, timer)
  if not targetScore then targetScore = 20 end
  if not rows then rows = 7 end
  if not columns then columns = 7 end
  if not timer then timer = 30 end

  local minigameData = { name = "thermite", targetScore = targetScore, rows = rows, columns = columns, timer = timer }
  return StartMinigame(minigameData)
end

function Terminal(rows, columns, viewTime, typeTime, answersNeeded)
  if not rows then rows = 4 end
  if not columns then columns = 2 end
  if not viewTime then viewTime = 20 end
  if not typeTime then typeTime = 10 end
  if not answersNeeded then answersNeeded = 4 end

  local minigameData = {  name = "laptop-terminal", rows = rows, columns = columns, viewTime = viewTime, typeTime = typeTime, answersNeeded = answersNeeded }

  return StartMinigame(minigameData)
end

function WordMemory(timer, maxRounds)
  if not timer then timer = 60 end
  if not maxRounds then maxRounds = 20 end

  local minigameData = {  name = "word-memory", timer = timer, maxRounds = maxRounds }

  return StartMinigame(minigameData)
end

exports("Lockpick", Lockpick)
exports("Chopping", Chopping)
exports("PinCracker", PinCracker)
exports("RoofRunning", RoofRunning)
exports("Thermite", Thermite)
exports("Terminal", Terminal)
exports("WordMemory", WordMemory)

RegisterCommand("terminal", function()
  local success = Terminal(4, 3, 5, 60, 4)
  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("thermite", function()
  local success = Thermite(5, 7, 7, 30)
  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("lockpick", function()
  local success = Lockpick(2, 30)

  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("chopping", function()
  local success = Chopping(12, 30)

  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("pincracker", function()
  local success = PinCracker(3, 20)

  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("roofrunning", function()
  local success = RoofRunning(5, 5, 30)

  print("Minigame result: " .. tostring(success))
end, false)

RegisterCommand("wordmemory", function()
  local success = WordMemory(1200, 30)

  print("Minigame result: " .. tostring(success))
end, false)
