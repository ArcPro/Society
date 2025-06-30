local orders = {}
local currentOrder = nil

local allowedVehicles = {[`nspeedo`] = true, [-225539375] = true, [`imperialev`] = true}
local PostOPMenu = Menus:Create("Post OP", "default")
local OrderMenu = Menus:CreateSub(PostOPMenu, "Commande", "default")

local function CreateInteractZone(step)
    local instructional_button = false

    if currentOrder == nil then return end

	local postop_zone = Zone:new({
		coords = vector4(928.3, -1221.9, 25.6, 134.79),
		id = 12500 + currentOrder.id,
		size = vector2(15.0, 6.5),
		action = "postop",
		data = {},
	})

	Citizen.CreateThread(function()
		while currentOrder ~= nil do
			if Zones.IsPlayerIn("postop") then
				if instructional_button == false then
					ClientModules.HUD.InstructionalButtons:Add("Intéragir", 38)
					instructional_button = true
				end
                if IsControlJustPressed(0, 51) then
                    if instructional_button == true then
                        ClientModules.HUD.InstructionalButtons:Delete(38)
                        instructional_button = false
                    end
                    if allowedVehicles[GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))] ~= nil then
                        UI:AddNotification(
                            "basic",
                            step == 1 and "Chargement de la cargaison..." or "Préparation de la commande...",
                            "info",
                            5000
                        )
                        UI:Progress(30)
                        postop_zone:coords(vector4(1179.54, -3293.54, 5.9, 0.0))
                        postop_zone:size(vector2(12.0, 3.5))
                        postop_zone:refresh()

                        if step == 2 then
                            local inventory = Inventory:new(Functions.RemoveUnderscores(Callbacks.Trigger("inventory:get", 2199) or {}))

                            if inventory:id() == nil then
                                return UI:AddNotification("basic", "~r~Impossible de charger l'inventaire~s~", "info", 5000)
                            end

                            for item, quantity in pairs(currentOrder.content) do
                                if inventory:addItem(Item.Create(item, {}, quantity)) == false then
                                    UI:AddNotification("basic", "~r~Une erreur s'est produite lors de l'ajout de l'item~s~", "info", 5000)
                                    break
                                end
                            end
                        end

                        Utils.RealWait(30000)
                        UI:AddNotification(
                            "basic",
                            step == 1 and "Ramenez la cargaison au Post OP" or "~b~La commande de votre client est prête, vous pouvez la charger dans votre camion, et la lui livrer",
                            "info",
                            5000
                        )

                        Events.TriggerServer("postop:deleteOrder", currentOrder.id)

                        if step == 1 then
                            SetNewWaypoint(1179.54, -3293.54)
                            step = 2
                        else
                            currentOrder = nil
                            postop_zone:delete()
                        end
                    else
                        UI:AddNotification("basic", "~r~Vous n'avez pas le véhicule adéquat.", "info", 5000)
                    end
                end
			else
				if instructional_button == true then
					ClientModules.HUD.InstructionalButtons:Delete(38)
					instructional_button = false
				end
            end

			Citizen.Wait(0)
		end
	end)
end

Menus:CreateThread(PostOPMenu, function()
    Menus:IsVisible(PostOPMenu, function()
        if #orders == 0 then
            Menus:AddButton("Aucune commande en attente", false, "", "", function()end)
            return
        end

        for k, order in pairs(orders) do
            Menus:AddButton(("Commande #%d (%s)"):format(order.id, ClientModules.Societies:Get(tonumber(order.sender)):label() or ''), false, "", "chevron_right", function()
                currentOrder = Callbacks.Trigger("postop:getOrder", order.id)
            end, OrderMenu)
        end

    end)
end)

Menus:CreateThread(OrderMenu, function()
    Menus:IsVisible(OrderMenu, function()
        if currentOrder == nil then
            Menus:AddButton("~r~Erreur lors du chargement de la commande~s~", true, "", "", function()end)
            return
        end

        Menus:AddButton("Date:", true, currentOrder.created_at, "", function()end)

        Menus:AddButton("Client:", true, ClientModules.Societies:Get(tonumber(currentOrder.sender)):label() or "Inconnu", "", function()end)

        Menus:AddButton("~b~Prendre en charge la commande~s~", false, "✅", "", function()
            UI:AddNotification("basic", "Allez chercher la cargaison à l'endroit indiqué sur votre GPS.", "info", 5000)
            SetNewWaypoint(928.3, -1221.9)
            CreateInteractZone(1)
        end)

        Menus:AddSeparator("Contenu")

        for item, quantity in pairs(currentOrder.content) do
			if Item.Get(item) ~= nil then
				Menus:AddButton(Item.Get(item).label, false, tostring(quantity), "", function()end)
			end
        end
    end)
end)

Events.Register("postop:duty", function(source, duty)

    if not duty then
		MainMenu.Radial.Unregister()
        return
    end

	MainMenu.Radial.Register({
        {
            icon = "postop_orders",
            title = "Liste des commandes",
            callback = "postop:orders"
        },
	})
end)

UI:RegisterCallback("postop:orders", function(data, cb)
    orders = Callbacks.Trigger("postop:allOrders")

    Menus:Visible(PostOPMenu, true)
end)
