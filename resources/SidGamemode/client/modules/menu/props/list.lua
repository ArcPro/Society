MainMenu = MainMenu or {}
MainMenu.Props = MainMenu.Props or {}
MainMenu.Props.List = MainMenu.Props.List or {}

local outlinedEntity = nil;
local filtered_props = {}
local filter = nil
local props = {}

local function filterProps()
	filtered_props = {}

	for _, prop in pairs(props) do
		if filter == nil or prop.model:find(filter) or tostring(prop.owner):find(filter) then
			table.insert(filtered_props, prop)
		end
	end
end

MainMenu.Props.List.Create = function()
    MainMenu.Props.List.Main = Menus:CreateSub(MainMenu.Props.Main, "Liste de props", "default")

    Menus:CreateThread(MainMenu.Props.List.Main, function()
        Menus:IsVisible(MainMenu.Props.List.Main, function()
            if #props == 0 then
                Menus:AddButton("~r~Aucun prop dans cette instance~s~", true, "", "", function()end)
                return
            end

			Menus:AddButton("Recherche", false, "🔍", "", function()
				filter = Utils.KeyboardInput("Recherche", 255, filter or "")

				filterProps()
			end)

            for _, data in Table.PairsByKeys(filtered_props) do
				Menus:AddButton(("%s #%d"):format(data.model, data.id), false, "", "chevron_right", function()
					MainMenu.Props.Settings.onOpen(data)
				end, MainMenu.Props.Settings.Main)
            end
        end)
    end)

    Menus:OnIndexChange(MainMenu.Props.List.Main, function (index)
        if (outlinedEntity) then
            SetEntityDrawOutline(outlinedEntity, false)
        end

        outlinedEntity = (filtered_props[index - 1] or { entity = nil }).entity

        if (outlinedEntity) then
            SetEntityDrawOutline(outlinedEntity, true)
        end
    end)

    Menus:OnOpen(MainMenu.Props.List.Main, function ()
		props = ClientModules.World.Decoration:Get()
		filterProps()

		if filtered_props[1] == nil then return end

		outlinedEntity = filtered_props[1].entity

		SetEntityDrawOutlineColor(0, 181, 254, 255);
		SetEntityDrawOutlineShader(1);

		if (outlinedEntity) then
			SetEntityDrawOutline(outlinedEntity, true)
		end
    end)

    Menus:OnClose(MainMenu.Props.List.Main, function ()
        SetEntityDrawOutlineColor(0, 181, 254, 255);
        SetEntityDrawOutlineShader(1);

        if (outlinedEntity) then
            SetEntityDrawOutline(outlinedEntity, false)
        end

        outlinedEntity = nil
    end)
end
