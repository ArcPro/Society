local Menus = exports["SidMenus"]
local PoolMenu = Menus:Create("Billard", "default")

if not Config.CustomMenu then

	Menus:CreateThread(PoolMenu, function()
		Menus:IsVisible(PoolMenu, function()

			Menus:AddButton(Config.Text.TYPE_9_BALL, false, "", "", function()
				TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_9_BALL')
			end)

			Menus:AddButton(Config.Text.TYPE_STRAIGHT, false, "", "", function()
				TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_STRAIGHT_POOL')
			end)

		end)
	end)

    Citizen.CreateThread(function()
        while true do
            if IsCloseToAnyTable then
                Citizen.Wait(0)
            else
                Citizen.Wait(2000)
            end

			if Menus:Visible(PoolMenu) == true and not ClosestTableAddress then
				Menus:Visible(PoolMenu, false)
			else
				Citizen.Wait(200)
			end
        end
    end)
end

AddEventHandler('rcore_pool:openMenu', function()
    Menus:Visible(PoolMenu, true)
end)

AddEventHandler('rcore_pool:closeMenu', function()
    -- triggered
end)

AddEventHandler('rcore_pool:setupTable', function(ballNumbers)
    local map = {
        ['BALL_SETUP_9_BALL'] = BALL_SETUP_9_BALL,
        ['BALL_SETUP_STRAIGHT_POOL'] = BALL_SETUP_STRAIGHT_POOL,
    }

    if ballNumbers == 'BALL_SETUP_9_BALL' or ballNumbers == 'BALL_SETUP_STRAIGHT_POOL' then
        local tableEntity = TableData[ClosestTableAddress].entity
        local data = setupBalls(tableEntity, map[ballNumbers])

        TriggerServerEvent('rcore_pool:setTableState', {
            serverIds = GetServerIdsNearTable(ClosestTableAddress),
            tablePosition = GetEntityCoords(tableEntity),
            data = data,
        })
    else
        print("ERROR: Unknown ball configuration name. Supported names: BALL_SETUP_9_BALL, BALL_SETUP_STRAIGHT_POOL")
    end

	Menus:Visible(PoolMenu, false)
end)