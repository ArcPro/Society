Citizen.CreateThread(function()
    if Config.Framework == 3 then

        PlayerHasMoney = function(serverId, amount)
            return true
        end

        PlayerTakeMoney = function(serverId, amount)
        end

        PlayerGiveMoney = function(serverId, amount)
        end

        SendNotification = function(serverId, msg)
			exports["SidGamemode"]:notify(serverId, msg)
        end
    end
end)
