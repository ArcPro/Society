MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Items = MainMenu.Admin.Items or {}
MainMenu.Admin.Items.Item = MainMenu.Admin.Items.Item or {}

local currentItem = nil
local actionTypes = { "Aucune", "Comestible", "Objet posable", "Arme" }
local actions = { "undefined", "consumable", "prop", "weapon" }
local actionIndex = 1

local weaponAmmos, weaponAmmoIndex = {}, 1

MainMenu.Admin.Items.Item.onOpen = function (name)
    currentItem = Item.Get(name)

	for idx, action in pairs(actions) do
		if currentItem.action.type == action then
			actionIndex = idx
			break
		end
	end

	for _, ammo in pairs(Config.WeaponMags) do
		table.insert(weaponAmmos, ammo)

		if ammo == currentItem.action.ammo then
			weaponAmmoIndex = #weaponAmmos
		end
	end
end

MainMenu.Admin.Items.Item.Create = function()
    MainMenu.Admin.Items.Item.Main = Menus:CreateSub(MainMenu.Admin.Items.Main, "Item", "default")

    Menus:CreateThread(MainMenu.Admin.Items.Item.Main, function()
        Menus:IsVisible(MainMenu.Admin.Items.Item.Main, function()

            if currentItem == nil then return end
            Menus:AddButton("Nom", false, currentItem.name, "", function()
                local name = Utils.KeyboardInput("Nom", 100, currentItem.name)

                if name == nil then
                    return
                end

                currentItem.name = name
                Events.TriggerServer("items:update", currentItem)
            end)

            Menus:AddButton("Label", false, currentItem.label, "", function()
                local label = Utils.KeyboardInput("Label", 100, currentItem.label)

                if label == nil then
                    return
                end

                currentItem.label = label

                Events.TriggerServer("items:update", currentItem)
            end)

            Menus:AddButton("Catégorie", false, currentItem.category, "", function()
                local category = Utils.KeyboardInput("Catégorie", 100, currentItem.category)

                if category == nil then
                    return
                end

                currentItem.category = category

                Events.TriggerServer("items:update", currentItem)
            end)

            Menus:AddButton("Poids", false, tostring(currentItem.weight), "", function()
                local weight = tonumber(Utils.KeyboardInput("Poids", 5, currentItem.weight))

                if weight == nil then
                    return
                end

                currentItem.weight = weight

                Events.TriggerServer("items:update", currentItem)
            end)

            Menus:AddButton("Image", false, "🖼️", "", function()
                local image = Utils.KeyboardInput("Image", 255, currentItem.image)

                if image == nil then
                    return
                end

                Events.TriggerServer("items:changeImage", currentItem.name, image)
            end)


            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("items:remove", currentItem.name)
					Citizen.Wait(500)

					MainMenu.Admin.Items.onOpen()
					Menus:Back()
				end)
            end)

            Menus:AddSeparator("Action")
            Menus:AddList("Type d'action", actionTypes, actionIndex, false, function(isClicked, index)
                if isClicked then
					currentItem.action.type = actions[actionIndex]
					Events.TriggerServer("items:update", currentItem)
				end

				actionIndex = index
            end)

			if currentItem.action == nil then
				currentItem.action = {
					type = "undefined",
					data = {}
				}
			end

            if currentItem.action.type == "consumable" then
                Menus:AddButton("Emote", false, currentItem.action.emote, "", function()
                    local emote = Utils.KeyboardInput("Emote", 30, currentItem.action.emote)

                    if emote then
                        currentItem.action.emote = emote
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)

				Menus:AddCheckbox("Ne pas consommer l'item", false, currentItem.action.dont_remove or false, function(checked)
                    currentItem.action.dont_remove = checked
					Events.TriggerServer("items:update", currentItem)
                end)

                Menus:AddCheckbox("Durée de l'emote illimitée", false, currentItem.action.emote_unlimited or false, function(checked)
                    currentItem.action.emote_unlimited = checked
                    Events.TriggerServer("items:update", currentItem)
                end)

				Menus:AddCheckbox("Bloquer l'emote", false, currentItem.action.lock_emote or false, function(checked)
                    currentItem.action.lock_emote = checked
					Events.TriggerServer("items:update", currentItem)
                end)

                Menus:AddButton("Faim", false, tostring(currentItem.action.hunger or 0), "", function()
                    local hunger = Utils.KeyboardInput("Faim", 4, tostring(currentItem.action.hunger or 0))

                    if hunger then
                        currentItem.action.hunger = hunger
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)

                Menus:AddButton("Soif", false, tostring(currentItem.action.thirst or 0), "", function()
                    local thirst = Utils.KeyboardInput("Soif", 4, tostring(currentItem.action.thirst or 0))

                    if thirst then
                        currentItem.action.thirst = thirst
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)

                Menus:AddButton("Alcool", false, tostring(currentItem.action.alcohol or 0), "", function()
                    local alcohol = Utils.KeyboardInput("Alcool", 4, tostring(currentItem.action.alcohol or 0))

                    if alcohol then
                        currentItem.action.alcohol = alcohol
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)

                Menus:AddButton("Drogue", false, tostring(currentItem.action.drugs or 0), "", function()
                    local drugs = Utils.KeyboardInput("Drogue", 4, tostring(currentItem.action.drugs or 0))

                    if drugs then
                        currentItem.action.drugs = drugs
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)
			elseif currentItem.action.type == "prop" then
				Menus:AddButton("Nom du modèle", false, tostring(currentItem.action.model or ""), "", function()
                    local model = Utils.KeyboardInput("Nom du modèle", 50, tostring(currentItem.action.model or ""))

                    if model then
                        currentItem.action.model = model
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)
			elseif currentItem.action.type == "weapon" then
				Menus:AddButton("Nom du modèle", false, tostring(currentItem.action.model or ""), "", function()
                    local model = Utils.KeyboardInput("Nom du modèle", 50, tostring(currentItem.action.model or ""))

                    if model then
                        currentItem.action.model = model
                        Events.TriggerServer("items:update", currentItem)
                    end
                end)

				Menus:AddList("Type de balles", weaponAmmos, weaponAmmoIndex, false, function(isClicked, index)
					if isClicked then
						currentItem.action.ammo = weaponAmmos[weaponAmmoIndex]
						Events.TriggerServer("items:update", currentItem)
					end

					weaponAmmoIndex = index
				end)

				Menus:AddCheckbox("Désactiver les alertes police", false, currentItem.action.disable_alerts or false, function(checked)
					currentItem.action.disable_alerts = checked
					Events.TriggerServer("items:update", currentItem)
				end)
            end
        end)
    end)
end
