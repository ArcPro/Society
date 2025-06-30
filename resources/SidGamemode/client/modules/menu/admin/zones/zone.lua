MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Zones = MainMenu.Admin.Zones or {}
MainMenu.Admin.Zones.Zone = {}

---@type Zone | nil
local currentZone = nil
local advancedMode = false
local typeIndex = 1
local drugs = {}

local function updateZone()
	if currentZone == nil then return end
	Events.TriggerServer("zone:update", currentZone:id(), currentZone:name(), currentZone:coords(), currentZone:size(), currentZone:action(), currentZone:data())
end

---@param zone Zone
MainMenu.Admin.Zones.Zone.onOpen = function(zone)
	currentZone = zone

	drugs = {}
	for k, item in pairs(Item._list) do
		if item.name:find("drug_") and item.name ~= "drug_test" then
			table.insert(drugs, item.name)
		end
	end

	typeIndex = Table.index(Zones.Types, currentZone:action())
end

MainMenu.Admin.Zones.Zone.Create = function()
    MainMenu.Admin.Zones.Zone.Main = Menus:CreateSub(MainMenu.Admin.Zones.Main, "Zone", "default")

    Menus:CreateThread(MainMenu.Admin.Zones.Zone.Main, function()
        Menus:IsVisible(MainMenu.Admin.Zones.Zone.Main, function()

			if currentZone == nil then return end

			Menus:AddSeparator("Position")

			Menus:AddCheckbox("Mode avancé", false, advancedMode, function (checked)
				advancedMode = checked
			end)

			Menus:AddButton("Déplacer sur moi", false, "🗺️", "", function()
				currentZone:coords(vector4(
					player:position().x,
					player:position().y,
					player:position().z,
					currentZone:coords().w
				))

				updateZone()
			end)

			Menus:AddButton("M'y téléporter", false, "🗺️", "", function()
				player:position(vector3(currentZone:coords().x, currentZone:coords().y, currentZone:coords().z), true)
			end)

			if advancedMode == true then
				Menus:AddButton("Position X", false, tostring(currentZone:coords().x), "", function()
					local newPosX = tonumber(Utils.KeyboardInput("Position X", 25, tostring(currentZone:coords().x)))

					if newPosX == nil then return end

					currentZone:coords(vector4(
						newPosX,
						currentZone:coords().y,
						currentZone:coords().z,
						currentZone:coords().w
					))

					updateZone()
				end)

				Menus:AddButton("Position Y", false, tostring(currentZone:coords().y), "", function()
					local newPosY = tonumber(Utils.KeyboardInput("Position Y", 25, tostring(currentZone:coords().y)))

					if newPosY == nil then return end

					currentZone:coords(vector4(
						currentZone:coords().x,
						newPosY,
						currentZone:coords().z,
						currentZone:coords().w
					))

					updateZone()
				end)

				Menus:AddButton("Position Z", false, tostring(currentZone:coords().z), "", function()
					local newPosZ = tonumber(Utils.KeyboardInput("Position Z", 25, tostring(currentZone:coords().z)))

					if newPosZ == nil then return end

					currentZone:coords(vector4(
						currentZone:coords().x,
						currentZone:coords().y,
						newPosZ,
						currentZone:coords().w
					))

					updateZone()
				end)
			end

			Menus:AddButton("Taille X", false, tostring(currentZone:size().x), "", function()
				local newSizeX = tonumber(Utils.KeyboardInput("Taille PlaystatsAwardXp", 25, tostring(currentZone:size().x)))

				if newSizeX == nil then return end

				currentZone:size(vector2(newSizeX, currentZone:size().y))

				updateZone()
			end)

			Menus:AddButton("Taille Y", false, tostring(currentZone:size().y), "", function()
				local newSizeY = tonumber(Utils.KeyboardInput("Taille Y", 25, tostring(currentZone:size().y)))

				if newSizeY == nil then return end

				currentZone:size(vector2(currentZone:size().x, newSizeY))

				updateZone()
			end)

			Menus:AddButton("Orientation", false, tostring(currentZone:coords().w), "", function()
				local newHeading = tonumber(Utils.KeyboardInput("Orientation", 25, tostring(currentZone:coords().w)))

				if newHeading == nil then return end

				currentZone:coords(vector4(
					currentZone:coords().x,
					currentZone:coords().y,
					currentZone:coords().z,
					newHeading
				))

				updateZone()
			end)

			Menus:AddSeparator("Informations")

			Menus:AddButton("ID", true, tostring(currentZone:id()), "", function()end)

			Menus:AddButton("Nom", false, tostring(currentZone:name()), "", function()
				currentZone:name(Utils.KeyboardInput("Nom de la zone", 255, currentZone:name()))
				updateZone()
			end)

			Menus:AddList("Type de zone", Zones.Types, typeIndex, false, function(isClicked, index)
				typeIndex = index

				if isClicked then
					currentZone:action(Zones.Types[typeIndex])
					updateZone()
				end
			end)

			if currentZone:action() == "drugs" then
				Menus:AddSeparator("Bonus / Malus drogues")

				for k, drug in pairs(drugs) do
					Menus:AddButton(drug, false, ("%d%%"):format(currentZone:data()[drug] or 0), "", function()
						local newDrugBonus = tonumber(Utils.KeyboardInput(("Bonus / malus pour %s"):format(drug), 3, tostring(currentZone:data()[drug] or 0)))

						if newDrugBonus then
							currentZone:data()[drug] = newDrugBonus
							updateZone()
						end
					end)
				end
			end

			Menus:AddButton("~r~Supprimer la zone~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("zone:delete", currentZone:id())
					Menus:Back()
				end)
			end)

        end)
    end)
end


