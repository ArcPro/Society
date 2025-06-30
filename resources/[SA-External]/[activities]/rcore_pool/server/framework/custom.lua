Citizen.CreateThread(function()
    if Config.Framework == 3 or Config.Framework == 0 then

		SendNotification = function(source, text)
			exports["SidGamemode"]:notify(source, text)
        end

        PlayerHasMoney = function(serverId, amount)
            return true
        end

        PlayerTakeMoney = function(serverId, amount)
        end

        RemoveSocietyMoney = function(jobName, amount)
        end

        AddSocietyMoney = function(jobName, amount)
        end
    end
end)
