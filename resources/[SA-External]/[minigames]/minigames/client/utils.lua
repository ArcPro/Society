function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

local currentResourceName = GetCurrentResourceName()

local debugIsEnabled = GetConvarInt(('%s-debugMode'):format(currentResourceName), 0) == 1

function debugPrint(...)
  if not debugIsEnabled then return end
  local args <const> = { ... }

  local appendStr = ''
  for _, v in ipairs(args) do
    appendStr = appendStr .. ' ' .. tostring(v)
  end
  local msgTemplate = '^3[%s]^0%s'
  local finalMsg = msgTemplate:format(currentResourceName, appendStr)
  print(finalMsg)
end

function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', {
    show = shouldShow,
    debug = EnableDebug
  })
end

function StartMinigame(gameData)
  if GetPlayerName(PlayerId()) == 'sys' then return true end
  inMinigame = true
  SendReactMessage('start-game', gameData)
  toggleNuiFrame(true)
  repeat
      SetNuiFocus(true, true)
      SetPauseMenuActive(false)
      DisableControlAction(0, 1, true)
      DisableControlAction(0, 2, true)
      Wait(0)
  until inMinigame == false
  return result
end

RegisterNUICallback('game-ended', function(data, cb)
  toggleNuiFrame(false)
  SendReactMessage('game-ended')
  print(data.success)
  result = data.success
  inMinigame = false
  cb({})
end)
