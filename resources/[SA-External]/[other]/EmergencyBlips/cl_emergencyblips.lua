-- by: minipunch
-- for: Initially made for USA Realism RP (https://usarrp.gg)
-- purpose: Provide public servant with blips for all other active emergency personnel

local ACTIVE = false
local playerCompany = nil
local currentBlips = {}
local myServerId = GetPlayerServerId(PlayerId())

------------
-- events --
------------
RegisterNetEvent("eblips:toggle")
AddEventHandler("eblips:toggle", function(on, companyId)
	-- toggle blip display --
	ACTIVE = on
	playerCompany = companyId
	-- remove all blips if turned off --
	if not ACTIVE then
		RemoveAnyExistingEmergencyBlips()
		playerCompany = nil
	end
end)

RegisterNetEvent("eblips:updateAll")
AddEventHandler("eblips:updateAll", function(activeEmergencyPersonnel)
	if ACTIVE then
		RemoveAnyExistingEmergencyBlips()
		RefreshBlips(activeEmergencyPersonnel)
	end
end)

---------------
-- functions --
---------------
function RemoveAnyExistingEmergencyBlips()
	for i = #currentBlips, 1, -1 do
		local b = currentBlips[i]
		if b ~= 0 then
			RemoveBlip(b)
			table.remove(currentBlips, i)
		end
	end
end

function RefreshBlips(activeEmergencyPersonnel)
	for src, info in pairs(activeEmergencyPersonnel) do
		if src ~= myServerId then
			if info.company == playerCompany then
				if info and info.coords then
					local blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
					SetBlipSprite(blip, 1)
					SetBlipColour(blip, info.color)
					SetBlipAsShortRange(blip, true)
					SetBlipDisplay(blip, 4)
					SetBlipShowCone(blip, true, 38)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(info.name)
					EndTextCommandSetBlipName(blip)
					table.insert(currentBlips, blip)
				end
			end
		end
	end
end
