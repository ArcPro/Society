--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additional Modification by TrevorBarns
---------------------------------------------------
FILE: server.lua
PURPOSE: Handle version checking, syncing vehicle
states.
---------------------------------------------------
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
---------------------------------------------------
]]

local experimental = GetResourceMetadata(GetCurrentResourceName(), 'experimental', 0) == 'true'
local beta_checking = GetResourceMetadata(GetCurrentResourceName(), 'beta_checking', 0) == 'true'
local curr_version = semver(GetResourceMetadata(GetCurrentResourceName(), 'version', 0))
local repo_version = ''
local repo_beta_version = ''

local plugin_count = 0
local plugins_cv = { }		-- table of active plugins current versions plugins_cv = { ['<pluginname>'] = <version> }
local plugins_rv = { }		-- table of active plugins repository versions

---------------VEHICLE STATE EVENTS----------------
RegisterServerEvent('lvc:GetRepoVersion_s')
AddEventHandler('lvc:GetRepoVersion_s', function()
	TriggerClientEvent('lvc:SendRepoVersion_c', source, repo_version)
end)

RegisterServerEvent('lvc:TogDfltSrnMuted_s')
AddEventHandler('lvc:TogDfltSrnMuted_s', function()
	TriggerClientEvent('lvc:TogDfltSrnMuted_c', -1, source)
end)


RegisterServerEvent('lvc:SetLxSirenState_s')
AddEventHandler('lvc:SetLxSirenState_s', function(newstate)
	TriggerClientEvent('lvc:SetLxSirenState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:SetPwrcallState_s')
AddEventHandler('lvc:SetPwrcallState_s', function(newstate)
	TriggerClientEvent('lvc:SetPwrcallState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:SetAirManuState_s')
AddEventHandler('lvc:SetAirManuState_s', function(newstate)
	TriggerClientEvent('lvc:SetAirManuState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:TogIndicState_s')
AddEventHandler('lvc:TogIndicState_s', function(newstate)
	TriggerClientEvent('lvc:TogIndicState_c', -1, source, newstate)
end)

-------------VERSION CHECKING & STARTUP------------
RegisterServerEvent('lvc:plugins_storePluginVersion')
AddEventHandler('lvc:plugins_storePluginVersion', function(name, version)
	plugin_count = plugin_count + 1
	plugins_cv[name] = version
end)


CreateThread( function()
-- Get LVC version from github
	PerformHttpRequest('https://raw.githubusercontent.com/TrevorBarns/luxart-vehicle-control/master/version', function(err, responseText, headers)
		if responseText ~= nil and responseText ~= '' then
			repo_version = semver(responseText:gsub('\n', ''))
		end
	end)
-- Get LVC beta version from github
	PerformHttpRequest('https://raw.githubusercontent.com/TrevorBarns/luxart-vehicle-control/master/beta_version', function(err, responseText, headers)
		if responseText ~= nil and responseText ~= '' then
			repo_beta_version = semver(responseText:gsub('\n', ''))
		end
	end)

	Wait(1000)
  -- Get currently installed plugin versions (plugins -> 'lvc:plugins_storePluginVersion')
	TriggerEvent('lvc:plugins_getVersions')

  -- Get repo version for installed plugins
	for name, _ in pairs(plugins_cv) do
		PerformHttpRequest('https://raw.githubusercontent.com/TrevorBarns/luxart-vehicle-control/master/PLUGINS/'..name..'/version', function(err, responseText, headers)
			if responseText ~= nil and responseText ~= '' then
				plugins_rv[name] = responseText:gsub('\n', '')
			else
				plugins_rv[name] = 'UNKWN'
			end
		end)
	end
	Wait(1000)
end)