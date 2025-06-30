MainMenu = MainMenu or {}
MainMenu.Props = MainMenu.Props or {}
MainMenu.Props.Settings = MainMenu.Props.Settings or {}

local prop = nil;
---@type Player | nil
local ownerData = nil
local scaleIndex = 28
local scaleList = {
    "0.0001",
    "0.0002",
    "0.0003",
    "0.0004",
    "0.0005",
    "0.0006",
    "0.0007",
    "0.0008",
    "0.0009",
    "0.001",
    "0.002",
    "0.003",
    "0.004",
    "0.005",
    "0.006",
    "0.007",
    "0.008",
    "0.009",
    "0.01",
    "0.02",
    "0.03",
    "0.04",
    "0.05",
    "0.06",
    "0.07",
    "0.08",
    "0.09",
    "0.1",
    "0.2",
    "0.3",
    "0.4",
    "0.5",
    "0.6",
    "0.7",
    "0.8",
    "0.9",
    "1.0",
    "1.25",
    "1.5",
    "1.75",
    "2.0",
    "2.5",
    "3.0",
    "3.5",
    "4.0",
    "4.5",
    "5.0",
    "6.0",
    "7.0",
    "8.0",
    "9.0",
    "10.0"
}

local GetCoordsList = function(baseCoord)

    if prop == nil then
        return {}
    end

    return {
        string.format("%.4f", baseCoord - tonumber(scaleList[scaleIndex])),
        string.format("%.4f", baseCoord),
        string.format("%.4f", baseCoord + tonumber(scaleList[scaleIndex]))
    }
end

MainMenu.Props.Settings.onOpen = function (data)
	ownerData = Core.Player:Get(data.owner, false)

	local rot = GetEntityRotation(data.entity, 0)

    prop = {
        collisions = not GetEntityCollisionDisabled(data.entity),
		rot = { x = rot.x, y = rot.y, z = rot.z },
        pos = data.matrix.pos,
        entity = data.entity,
		id = data.id,
    }
end

MainMenu.Props.Settings.Create = function()
    MainMenu.Props.Settings.Main = Menus:CreateSub(MainMenu.Props.Main, "Paramètres de props", "default")

    Menus:CreateThread(MainMenu.Props.Settings.Main, function()
        Menus:IsVisible(MainMenu.Props.Settings.Main, function()

            if prop == nil then return end

			Menus:AddButton("ID", false, tostring(prop.id), "", function()end)

			if player:permissions() >= Config.Permissions.HM then
				Menus:AddButton("Posé par", false, ownerData and ownerData:fullname() or "", "", function()end)

				Menus:AddButton("S'y téléporter", false, "🗺️", "", function()
					player:position(vector3(prop.pos.x, prop.pos.y, prop.pos.z), true)
				end)
			end

            Menus:AddSeparator("Actions")

            Menus:AddButton("Déplacer avec Gizmo", false, "🗺️", "", function()
                Events.Trigger("gizmo", prop.entity)
            end)

            Menus:AddCheckbox("Collisions", false, prop.collisions, function(checked)
				ClientModules.World.Decoration:Update(prop.id, "collisions", checked)
                prop.collisions = checked
            end)

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					if ClientModules.World.Decoration:Delete(prop.id) ~= true then return end
					Menus:Back()
				end)
            end)

            Menus:AddSeparator("Position & Rotation")

            Menus:AddList("Échelle", scaleList, scaleIndex, false, function(isClicked, index)
                scaleIndex = index
            end)

            Menus:AddList("Position X", GetCoordsList(prop.pos.x), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.pos.x = tonumber(string.format("%.4f", prop.pos.x - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.pos.x = tonumber(string.format("%.4f", prop.pos.x + tonumber(scaleList[scaleIndex])))
                end

                SetEntityCoords(prop.entity, prop.pos.x, prop.pos.y, prop.pos.z, true, false, false, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)

            Menus:AddList("Position Y", GetCoordsList(prop.pos.y), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.pos.y = tonumber(string.format("%.4f", prop.pos.y - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.pos.y = tonumber(string.format("%.4f", prop.pos.y + tonumber(scaleList[scaleIndex])))
                end

                SetEntityCoords(prop.entity, prop.pos.x, prop.pos.y, prop.pos.z, true, false, false, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)

            Menus:AddList("Position Z", GetCoordsList(prop.pos.z), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.pos.z = tonumber(string.format("%.4f", prop.pos.z - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.pos.z = tonumber(string.format("%.4f", prop.pos.z + tonumber(scaleList[scaleIndex])))
                end

                SetEntityCoords(prop.entity, prop.pos.x, prop.pos.y, prop.pos.z, true, false, false, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)

			Menus:AddList("Rotation X", GetCoordsList(prop.rot.x), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.rot.x = tonumber(string.format("%.4f", prop.rot.x - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.rot.x = tonumber(string.format("%.4f", prop.rot.x + tonumber(scaleList[scaleIndex])))
                end

                SetEntityRotation(prop.entity, prop.rot.x, prop.rot.y, prop.rot.z, 0, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)

			Menus:AddList("Rotation Y", GetCoordsList(prop.rot.y), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.rot.y = tonumber(string.format("%.4f", prop.rot.y - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.rot.y = tonumber(string.format("%.4f", prop.rot.y + tonumber(scaleList[scaleIndex])))
                end

                SetEntityRotation(prop.entity, prop.rot.x, prop.rot.y, prop.rot.z, 0, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)

			Menus:AddList("Rotation Z", GetCoordsList(prop.rot.z), 2, prop.entity == nil, function(isClicked, index)
                if index == 1 then
                    prop.rot.z = tonumber(string.format("%.4f", prop.rot.z - tonumber(scaleList[scaleIndex])))
                elseif index == 3 then
                    prop.rot.z = tonumber(string.format("%.4f", prop.rot.z + tonumber(scaleList[scaleIndex])))
                end

                SetEntityRotation(prop.entity, prop.rot.x, prop.rot.y, prop.rot.z, 0, false)
				ClientModules.World.Decoration:UpdateMatrix(prop.entity)
            end)
        end)
    end)
end
