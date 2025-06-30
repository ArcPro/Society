MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Players = MainMenu.Admin.Players or {}
MainMenu.Admin.Players.Player = MainMenu.Admin.Players.Player or {}

---@type Player
local currentPlayer = nil
local bucket = nil

local societies, societiesIds = {}, {}
local grades, gradesIds = {}, {}
local societyIndex, gradeIndex = 1, 1

local groups, groupLabels, groupIndex = {}, {}, 1
local playerPhoneItem = nil

local function loadGrades()
	grades, gradesIds = {}, {}
	gradeIndex = 1

	for _, grade in pairs(ClientModules.Societies:Get(societiesIds[societyIndex]):grades() or {}) do
		table.insert(gradesIds, grade.grade)
		table.insert(grades, grade.label)

		if currentPlayer:job_grade().grade == grade.grade then
			gradeIndex = #gradesIds
		end
	end
end

MainMenu.Admin.Players.Player.onOpen = function (id, isServerId)
    currentPlayer = Core.Player:Get(id, isServerId)

	societies, societiesIds = { "Aucun" }, { 0 }
	societyIndex, gradeIndex = 1, 1
	grades, gradesIds = {}, {}

	groups, groupLabels, groupIndex = { 0 }, { "Aucun" }, 1

	for k, v in pairs(ClientModules.Societies:All()) do
		table.insert(societiesIds, v:id())
		table.insert(societies, v:label())

		if currentPlayer:job().id == v:id() then
			societyIndex = #societiesIds
		end
	end

	if societyIndex ~= 1 then
		loadGrades()
	end

	local rawGroups = Callbacks.Trigger("group:all")

	for k, v in pairs(rawGroups or {}) do
		table.insert(groupLabels, v.label or v.name)
		table.insert(groups, v.id)

		if currentPlayer:group() == v.id then
			groupIndex = #groups
		end
	end

	playerPhoneItem = nil

	if currentPlayer:source() then
		currentPlayer:inventory(Inventory:new(Functions.RemoveUnderscores(Callbacks.Trigger("inventory:get", currentPlayer:inventory_id()) or {})))

		playerPhoneItem = currentPlayer:inventory():findItem(function(item)
			return item.name == "phone"
		end)
	end

	bucket = Callbacks.Trigger("bucket:get", currentPlayer:source())

	UI:SendMessage("sound_list")
	UI:RegisterCallback("sound_list", function(data, cb)
		soundboards = data.sounds
		cb(true)
	end)
end

MainMenu.Admin.Players.Player.Create = function()
    MainMenu.Admin.Players.Player.Main = Menus:CreateSub(MainMenu.Admin.Players.Main, "Joueur", "default")
    MainMenu.Admin.Players.Player.Characters.Create()
	MainMenu.Admin.Players.Player.Troll.Create()

    Menus:CreateThread(MainMenu.Admin.Players.Player.Main, function()
        Menus:IsVisible(MainMenu.Admin.Players.Player.Main, function()
            Menus:AddSeparator("Informations")
            Menus:AddButton("Nom", false, ("~b~%s~s~"):format(currentPlayer:fullname()), "", function()
				if currentPlayer:source() == nil then return end

				local firstname = Utils.KeyboardInput("Prénom", 255, currentPlayer:firstname())
				local lastname = Utils.KeyboardInput("Nom", 255, currentPlayer:lastname())

				if firstname == nil or lastname == nil then return end

				currentPlayer:firstname(firstname)
				currentPlayer:lastname(lastname)

				Events.TriggerServer("player:update", "firstname", currentPlayer:firstname(), currentPlayer:source())
				Events.TriggerServer("player:update", "lastname", currentPlayer:lastname(), currentPlayer:source())
			end)

			Menus:AddButton("Date de naissance", false, ("~b~%s~s~"):format(currentPlayer:birthdate()), "", function()
				if currentPlayer:source() == nil then return end

				local birthdate = Utils.KeyboardInput("Date de naissance", 255, currentPlayer:birthdate())

				if birthdate == nil then return end

				currentPlayer:birthdate(birthdate)

				Events.TriggerServer("player:update", "birthdate", currentPlayer:birthdate(), currentPlayer:source())
			end)

			Menus:AddButton("Taille (cm)", false, ("~b~%s~s~"):format(currentPlayer:height()), "", function()
				if currentPlayer:source() == nil then return end

				local height = tonumber(Utils.KeyboardInput("Taille", 255, currentPlayer:height()))

				if height == nil then return end

				currentPlayer:height(height)

				Events.TriggerServer("player:update", "height", currentPlayer:height(), currentPlayer:source())
			end)

			Menus:AddButton("Poids (kg)", false, ("~b~%s~s~"):format(currentPlayer:weight()), "", function()
				if currentPlayer:source() == nil then return end

				local weight = tonumber(Utils.KeyboardInput("Poids", 255, currentPlayer:weight()))

				if weight == nil then return end

				currentPlayer:weight(weight)

				Events.TriggerServer("player:update", "weight", currentPlayer:weight(), currentPlayer:source())
			end)

            Menus:AddButton("ID Discord", false, ("~b~ %s ~s~"):format(tostring(currentPlayer:identifiers().discord)), "", function()
				UI:AddNotification("basic", "~b~ID Discord copié dans le presse papiers !~s~", "info", 5000)
				UI:CopyToClipboard(currentPlayer:identifiers().discord)
			end)

            Menus:AddButton("ID Personnage", false, ("~b~ %s ~s~"):format(tostring(currentPlayer:id())), "", function()end)

            if currentPlayer:source() then
                Menus:AddButton("ID Serveur", false, ("~b~ %s ~s~"):format(tostring(currentPlayer:source())), "", function()end)

                Menus:AddSeparator("Actions")

                Menus:AddButton("Revive", false, "🩸", "", function()
                    Events.TriggerServer("player:revive", currentPlayer:source(), 100)
                end)

                Menus:AddButton("Tuer", false, "☠️", "", function()
                    Events.TriggerServer("player:update", "health", 0, currentPlayer:source())
                end)

                Menus:AddButton("Nourrir", false, "🍔", "", function()
                    Events.TriggerServer("player:update", "hunger", 100, currentPlayer:source())
                    Events.TriggerServer("player:update", "thirst", 100, currentPlayer:source())
                end)

                Menus:AddButton("Saoûler", false, "🍺", "", function()
                    local percent = tonumber(Utils.KeyboardInput("Pourcentage", 3, ""))

                    if percent == nil then
                        return
                    end

                    Events.TriggerServer("player:update", "alcohol", Math.Clamp(percent, 0, 100), currentPlayer:source())
                end)

                Menus:AddButton("Droguer", false, "💊", "", function()
                    local percent = tonumber(Utils.KeyboardInput("Pourcentage", 3, ""))

                    if percent == nil then
                        return
                    end

                    Events.TriggerServer("player:update", "drugs", Math.Clamp(percent, 0, 100), currentPlayer:source())
                end)

                Menus:AddButton("Téléporter à moi", false, "🚀", "", function()
                    Events.TriggerServer("player:update", "position", GetEntityCoords(PlayerPedId(), true), currentPlayer:source())
                end)

                Menus:AddButton("Téléporter à lui", false, "🚀", "", function()
                    Events.TriggerServer("admin:goto", currentPlayer:source())
                end)

				if player:metadata().instance ~= bucket then
					Menus:AddButton("Entrer dans l'instance", false, tostring(bucket), "", function()
						Events.TriggerServer("bucket:change", bucket)
					end)
				else
					Menus:AddButton("Sortir de l'instance", false, "", "", function()
						Events.TriggerServer("bucket:change", 1)
					end)
				end

				Menus:AddButton("Envoyer un message", false, "💬", "", function()
                    local text = Utils.KeyboardInput("Message", 100, "")

                    if text then
                        Events.TriggerServer("admin:sendMessage", text, currentPlayer:source())
                    end
                end)

				if player:permissions() > Config.Permissions.MOD then
					Menus:AddButton("Troll", false, "", "chevron_right", function()
						MainMenu.Admin.Players.Player.Troll.onOpen(currentPlayer:source())
					end, MainMenu.Admin.Players.Player.Troll.Main)
				end

				if player:permissions() > Config.Permissions.MOD then
					if currentPlayer:source() and json.encode(currentPlayer:metadata()) ~= json.encode({}) then
						Menus:AddSeparator("Métadonnées du personnage")

						for k, v in pairs(currentPlayer:metadata()) do
							Menus:AddButton(k, false, tostring(v), "", function()
								---@type string | number | nil
								local new_value = Utils.KeyboardInput(("Nouvelle valeur pour %s"):format(k), 255, tostring(v))

								if new_value == nil then return end

								if type(v) == "number" then
									new_value = tonumber(new_value)
								end

								currentPlayer:metadata()[k] = new_value
								Events.TriggerServer("player:update", "metadata", currentPlayer:metadata(), currentPlayer:source())
							end)
						end
					end
				end
            end

			Menus:AddSeparator("Job & Groupe")

			Menus:AddList("Entreprise", societies, societyIndex, false, function (isClicked, index)
				if isClicked then
					if societiesIds[societyIndex] == 0 then
						if currentPlayer:job().id == nil then return end

						Events.TriggerServer("society:employees:delete", currentPlayer:job().id, currentPlayer:id())
					else
						Events.TriggerServer("society:employees:add", societiesIds[societyIndex], currentPlayer:id(), gradesIds[gradeIndex] or 1)
					end
				end

				societyIndex = index
				grades, gradesIds = {}, {}

				if societiesIds[societyIndex] ~= 0 then
					loadGrades()
				end
			end)

			if #grades > 0 then
				Menus:AddList("Grade", grades, gradeIndex, false, function (isClicked, index)
					if isClicked then
						Events.TriggerServer("society:employees:add", societiesIds[societyIndex], currentPlayer:id(), gradesIds[gradeIndex])
					end

					gradeIndex = index
				end)
			end

			Menus:AddList("Groupe", groupLabels, groupIndex, false, function (isClicked, index)
				if isClicked then
					currentPlayer:group(groups[index])
					Events.TriggerServer("player:update", "group", currentPlayer:group(), currentPlayer:source())
				end

				groupIndex = index
			end)

            Menus:AddSeparator("Gestion")

			Menus:AddButton("Ped", false, currentPlayer:skin():model(), "chevron_right", function()
				local model = Utils.KeyboardInput("Ped", 50, "")

				if not model then return end

				if not IsModelValid(currentPlayer:skin():model()) then
					UI:AddNotification("basic", "~r~Modèle invalide.~s~", "info", 5000)
					return
				end

				if not IsModelAPed(currentPlayer:skin():model()) then
					UI:AddNotification("basic", "~r~Ce modèle n'est pas un ped.~s~", "info", 5000)
					return
				end

				currentPlayer:skin()._model = model

				Events.TriggerServer('player:updateSkin', 'model', currentPlayer:skin():model(), currentPlayer:source())
			end)

			Menus:AddButton("Charger l'apparence", false, "🔃", "", function()
				Events.TriggerServer('player:loadAppearance', currentPlayer:source())
			end)

			if player:permissions() > Config.Permissions.MOD and playerPhoneItem ~= nil then
				Menus:AddButton("Numéro de téléphone", false, playerPhoneItem.metadata.number, "", function()
					local newNumber = tonumber(Utils.KeyboardInput("Numéro de téléphone (555-....)", 4, ""))

					if newNumber == nil then
						UI:AddNotification("basic", "~r~Format invalide~s~", "info", 5000)
						return
					end

					Events.TriggerServer("admin:changePhoneNumber", currentPlayer:source(), playerPhoneItem.metadata.number, ("555%d"):format(newNumber))
				end)
			end

            Menus:AddButton("Personnages", false, "", "chevron_right", function()
				MainMenu.Admin.Players.Player.Characters.onOpen(currentPlayer:id())
			end, MainMenu.Admin.Players.Player.Characters.Main)

            Menus:AddButton("Véhicules", false, "", "chevron_right", function()
				MainMenu.Admin.Vehicles.onOpen(currentPlayer:fullname():lower())
			end, MainMenu.Admin.Vehicles.Main)

            Menus:AddButton("Propriétés", false, "", "chevron_right", function()
				MainMenu.Admin.Properties.onOpen(true, currentPlayer:fullname():lower())
			end, MainMenu.Admin.Properties.Main)

            Menus:AddButton("Compte bancaire", currentPlayer:bank_account_id() == nil, "", "chevron_right", function()
                MainMenu.Admin.BankAccounts.BankAccount.onOpen(currentPlayer:bank_account_id())
                Menus:Visible(MainMenu.Admin.BankAccounts.BankAccount.Main, true)
            end)

            Menus:AddButton("Inventaire", false, "", "chevron_right", function()
                MainMenu.Admin.Inventories.Inventory.onOpen(currentPlayer:inventory_id())
                Menus:Visible(MainMenu.Admin.Inventories.Inventory.Main, true)
            end)

            Menus:AddButton("Kick le joueur", currentPlayer:source() == nil, "👢", "", function()
                local reason = Utils.KeyboardInput("Raison", 100, "")

                if reason then
                    Events.TriggerServer("admin:kick", currentPlayer:source(), reason)
                end
            end)

            Menus:AddButton("Ban le joueur", false, "🚪", "", function()
                local duration = tonumber(Utils.KeyboardInput("Durée (en jours)", 3, ""))
                local reason = Utils.KeyboardInput("Raison", 100, "")

                if reason and duration then
                    Events.TriggerServer("admin:ban", currentPlayer:id(), duration, reason)
                end
            end)
        end)
    end)
end
