MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}

---@type Marker | nil
local marker = nil
local types = {}

local currentType = 1
local jobIndex = 1

local jobList = {}
local jobLabels = {}
local groups, groupLabels, groupIndex = {}, {}, 1

local function InventoryParams()

    if marker == nil then
        return
    end

    Menus:AddSeparator("Données pour inventaire")

    Menus:AddButton("ID Inventaire", false, tostring(marker:data().inventoryId), "", function()
        local inventoryId = tonumber(Utils.KeyboardInput("ID Inventaire", 5, marker:data().inventoryId))

        if inventoryId == nil then
            return
        end

        marker:data().inventoryId = inventoryId

        Events.TriggerServer("marker:update", marker:name(), marker:action(), marker:coords(), marker:data(), marker:bucket())
    end)
end

MainMenu.Admin.Markers.Marker.onOpen = function (_marker)
    marker = Markers.Get(_marker:name())

    table.insert(types, "Aucun")
    for name, _ in pairs(Markers.functions) do
        table.insert(types, name)
    end

    for i, type in ipairs(types) do
        if type == marker:action() then
            currentType = i
        end
    end

	local rawGroups = Callbacks.Trigger("group:all")

	groups, groupLabels, groupIndex = { 0 }, { "Aucun" }, 1

	for k, v in pairs(rawGroups or {}) do
		table.insert(groups, v.id)
		table.insert(groupLabels, v.label)

		if marker:data().group == v.id then
			groupIndex = #groups
		end
	end

    table.insert(jobList, "nil")
    table.insert(jobLabels, "Aucun")

    for _, job in pairs(ClientModules.Societies:All()) do
        table.insert(jobList, job:name())
        table.insert(jobLabels, job:label())
    end


    for i, job in ipairs(jobList) do
        if job == marker:data().job then
            jobIndex = i
        end
    end
end

MainMenu.Admin.Markers.Marker.Create = function()
    MainMenu.Admin.Markers.Marker.Main = Menus:CreateSub(MainMenu.Admin.Markers.Main, "Marker", "default")
    MainMenu.Admin.Markers.Marker.Crafts.Create()
    MainMenu.Admin.Markers.Marker.Cloakroom.Create()
    MainMenu.Admin.Markers.Marker.Shop.Create()
    MainMenu.Admin.Markers.Marker.Cardealer.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Main, function()
            if marker == nil then
                return
            end

			Menus:AddButton("Bucket", false, tostring(marker:bucket()), "", function()
				local bucket = tonumber(Utils.KeyboardInput("Bucket", 5, tostring(marker:bucket())))

				if bucket == nil then return end

				Events.TriggerServer("marker:update", marker:name(), marker:action(), marker:coords(), marker:data(), bucket)
            end)

            Menus:AddList("Action", types, currentType, false, function(isClicked, index)
                if isClicked then
                    Events.TriggerServer("marker:update", marker:name(), types[currentType], marker:coords(), marker:data(), marker:bucket())
                end

                currentType = index
            end)

            Menus:AddList("Job requis", jobLabels, jobIndex, false, function(isClicked, index)
                if isClicked then
                    local job = jobList[jobIndex]

                    if job == "nil" then
                        job = nil
                    end

                    marker:data().job = job

                    Events.TriggerServer("marker:update", marker:name(), marker:action(), marker:coords(), marker:data(), marker:bucket())
                end

                jobIndex = index
            end)

			Menus:AddList("Groupe requis", groupLabels, groupIndex, false, function(isClicked, index)
                if isClicked then
                    local group = groups[groupIndex]

                    if group == 0 then
                        group = nil
                    end

                    marker:data().group = group

                    Events.TriggerServer("marker:update", marker:name(), marker:action(), marker:coords(), marker:data(), marker:bucket())
                end

                groupIndex = index
            end)

            Menus:AddButton("S'y téléporter", false, "🗺️", "", function()
                player:position(marker:coords(), true)
            end)

            Menus:AddButton("Position", false, "🗺️", "", function()
                local x, y, z = table.unpack(player:position())

                Events.TriggerServer("marker:update", marker:name(), marker:action(), vector3(x, y, z - 0.95), marker:data(), marker:bucket())
            end)

			Menus:AddButton("Dupliquer le marker", false, "📃", "", function()
				local name = Utils.KeyboardInput("Nom du nouveau marker", 255, "")

				if name == nil then return end

                Events.TriggerServer("marker:create", name, marker:action(), marker:coords(), marker:data(), marker:bucket())
            end)

            if marker:action() == "inventory" then
                InventoryParams()
            elseif marker:action() == "craft" then
                Menus:AddButton("Paramètres du craft", false, "🛠️", "", function()
                    MainMenu.Admin.Markers.Marker.Crafts.onOpen(marker)
                end, MainMenu.Admin.Markers.Marker.Crafts.Main)
            elseif marker:action() == "cloakroom" then
                Menus:AddButton("Paramètres du vestiaire", false, "👚", "", function()
                    MainMenu.Admin.Markers.Marker.Cloakroom.onOpen(marker)
                end, MainMenu.Admin.Markers.Marker.Cloakroom.Main)
            elseif marker:action() == "shop" then
                Menus:AddButton("Paramètres du shop", false, "🛍️", "", function()
                    MainMenu.Admin.Markers.Marker.Shop.onOpen(marker)
                end, MainMenu.Admin.Markers.Marker.Shop.Main)
            elseif marker:action() == "cardealer" then
                Menus:AddButton("Paramètres du catalogue", false, "🛍️", "", function()
                    MainMenu.Admin.Markers.Marker.Cardealer.onOpen(marker)
                end, MainMenu.Admin.Markers.Marker.Cardealer.Main)
            end

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("marker:delete", marker:name())
					Citizen.Wait(500)

					MainMenu.Admin.Markers.onOpen()
					Menus:Back()
					marker = nil
				end)
            end)
        end)
    end)
end
