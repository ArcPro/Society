MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Properties = MainMenu.Admin.Properties or {}
MainMenu.Admin.Properties.Property = MainMenu.Admin.Properties.Property or {}

local societies, societyLabels, societyIndex = {}, {}, 1;
local groups, groupLabels, groupIndex = {}, {}, 1;
local types, typeLabels, typeIndex = {}, {}, 1;
local formatted_date = "Erreur"
local property_daily_price = 0
local isAdmin = false
local property = {}

local formatDate = function(date)
	if date > 2000000000 then
		return "Jamais"
	else
		return Callbacks.Trigger("date:format", "%d/%m/%Y %H:%M", property.rent_end) or "Erreur"
	end
end

local getPrice = function(days)
	if isAdmin == true then
		return ""
	end

	return "$" .. tostring(math.floor(property_daily_price * days))
end

MainMenu.Admin.Properties.Property.onOpen = function (propertyId, admin)
    property = Callbacks.Trigger("property:get", propertyId)

	if property == nil then return end

	societies, societyLabels, societyIndex = { 0 }, { "Aucune" }, 1
	types, typeLabels = {}, {}

	for name, data in pairs(Config.Properties) do
		table.insert(typeLabels, data.name)
		table.insert(types, name)
	end

	for k, v in pairs(ClientModules.Societies:All()) do
		table.insert(societyLabels, v:label())
		table.insert(societies, v:id())

		if property.linked_society == v:id() then
			societyIndex = #societies
		end
	end

	local i = 1
	for k, name in pairs(types) do
		if name == property.type then
			typeIndex = i;
			break
		end

		i += 1;
	end

	local rawGroups = Callbacks.Trigger("group:all")

	groups, groupLabels, groupIndex = { 0 }, { "Aucun" }, 1

	for k, v in pairs(rawGroups or {}) do
		table.insert(groupLabels, v.label)
		table.insert(groups, v.id)

		if property.linked_group == v.id then
			groupIndex = #groups
		end
	end

	property_daily_price = ((SharedModules.Variables:Get("properties", property.type)) or 1) / 200
	formatted_date = formatDate(property.rent_end)
	isAdmin = admin
end

MainMenu.Admin.Properties.Property.Create = function()
    MainMenu.Admin.Properties.Property.Main = Menus:CreateSub(MainMenu.Admin.Main, "Propriété", "default")

    Menus:CreateThread(MainMenu.Admin.Properties.Property.Main, function()
        Menus:IsVisible(MainMenu.Admin.Properties.Property.Main, function()
			if property == nil then
				UI:AddNotification("basic", "~r~Erreur de chargement de la propriété.~s~", "info", 5000)
				Menus:Back()
				return
			end

			if player:permissions() < Config.Permissions.MOD and (player:job().name or ""):find("realestate_") == nil then
				return Menus:Close()
			end

			if isAdmin and player:permissions() < Config.Permissions.MOD then
				isAdmin = false
			end

			Menus:AddList("Type", typeLabels, typeIndex, false, function (isClicked, index)
				if isClicked then
					Events.TriggerServer("property:update", property.id, "type", types[typeIndex])
				end

				typeIndex = index
			end)

			Menus:AddButton("Position", false, "🗺️", "", function()
				Events.TriggerServer("property:update", property.id, "position", vector3(player:position().x, player:position().y, player:position().z - 0.95))
			end)

			if isAdmin then
				Menus:AddButton("S'y téléporter", false, "🗺️", "", function()
					player:position(vector3(property.position.x, property.position.y, property.position.z), true)
				end)
			end

			Menus:AddButton("Signataire", false, property.owner, "", function()
				local owner = Utils.KeyboardInput("Nom du propriétaire", 255, property.owner)

				if owner == nil then return end

				property.owner = owner

				Events.TriggerServer("property:update", property.id, "owner", property.owner)
			end)

			Menus:AddList("Entreprise liée", societyLabels, societyIndex, false, function (isClicked, index)
				if isClicked then
					property.linked_society = societies[societyIndex]
					Events.TriggerServer("property:update", property.id, "linked_society", property.linked_society)
				end

				societyIndex = index
			end)

			Menus:AddList("Groupe lié", groupLabels, groupIndex, false, function (isClicked, index)
				if isClicked then
					property.linked_group = groups[groupIndex]
					Events.TriggerServer("property:update", property.id, "linked_group", property.linked_group)
				end

				groupIndex = index
			end)

			if isAdmin then
				Menus:AddButton("Porte", false, property.locked == 1 and "🔒" or "🔓", "", function()
					property.locked = property.locked == 1 and 0 or 1
					Events.TriggerServer("property:update", property.id, "locked", property.locked)
				end)

				Menus:AddButton("Voir le coffre", false, "", "chevron_right", function()
					MainMenu.Admin.Inventories.Inventory.onOpen(property.inventory_id)
					Menus:Visible(MainMenu.Admin.Inventories.Inventory.Main, true)
				end)
			end

			Menus:AddButton("Date de fin", false, formatted_date, "", function()end)

			if property.rent_end < 2000000000 then
				Menus:AddButton("Prolonger 1 semaine", false, getPrice(7), "", function()
					property.rent_end += 7 * 24 * 60 * 60

					if isAdmin == false then
						local society = ClientModules.Societies:Get(player:job().id)
						local societyBankAccount = Bank.GetAccount(society:bank_account_id() or -1)

						if societyBankAccount == nil then
							return UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte bancaire~s~", "info", 5000)
						end

						if societyBankAccount:withdraw(math.floor(property_daily_price * 7), false) == false then
							return UI:AddNotification("basic", "~r~Une erreur s'est produite lors du paiement via le compte entreprise.~s~", "info", 5000)
						end
					end

					Events.TriggerServer("property:update", property.id, "rent_end", property.rent_end)
					formatted_date = formatDate(property.rent_end)
				end)

				Menus:AddButton("Prolonger définitivement", false, getPrice(200), "", function()
					property.rent_end = 2147000000

					if isAdmin == false then
						local society = ClientModules.Societies:Get(player:job().id)
						local societyBankAccount = Bank.GetAccount(society:bank_account_id() or -1)

						if societyBankAccount == nil then
							return UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte bancaire~s~", "info", 5000)
						end

						if societyBankAccount:withdraw(math.floor(property_daily_price * 200), false) == false then
							return UI:AddNotification("basic", "~r~Une erreur s'est produite lors du paiement via le compte entreprise.~s~", "info", 5000)
						end
					end

					Events.TriggerServer("property:update", property.id, "rent_end", property.rent_end)
					formatted_date = formatDate(property.rent_end)
				end)
			end

			Menus:AddButton("Récupérer les clés", false, "", "", function()
				player:inventory():addItem(Item.Create("house_keys", { instance = property.id }, 1))
			end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("property:delete", property.id)
					Menus:Back()
				end)
			end)
        end)
    end)
end
