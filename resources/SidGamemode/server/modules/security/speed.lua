local differenceAllowed = {}

function AllowSpeedDifference(src)
    differenceAllowed[tostring(src)] = true
end

--[[ Citizen.CreateThread(function()
    -- local dist = 0.0;

    while true do
        Citizen.Wait(1000)

        for _, player in pairs(Players._list) do
            if player:loaded() then

				-- A Fix avant de le décommenter car il kick souvent quand je téléporte le joueur (dans un garage, tp admin, ....)

                if player:position() ~= nil then
                    dist = Math.Distance(player:position(), GetEntityCoords(GetPlayerPed(player:source()), true))

                    if dist > 250.0 and OnesyncPlayer(player:source()).state.noclipping ~= true and GetVehiclePedIsIn(GetPlayerPed(player:source()), false) == 0 then
                        if differenceAllowed[tostring(player:source())] == true then
                            differenceAllowed[tostring(player:source())] = false
                        else
                            FlagReport(player:source(), "Speedhack", ("%.2f en 1 seconde"):format(dist))
                        end
                    end
                end

                -- player:position(GetEntityCoords(GetPlayerPed(player:source()), true))
            end
        end
    end
end) ]]
