MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Properties = MainMenu.Admin.Properties or {}

local properties = {
	all = {},
	filtered = {},
}

local isAdmin = false

local function filterProperties(filter)
	properties.filtered = {}
	for _, v in pairs(properties.all) do
		if filter == nil or (
			string.find(tostring(v.id):lower(), filter)
			or string.find(tostring(v.owner):lower(), filter)
			or string.find(tostring(v.type):lower(), filter)
		) then
			table.insert(properties.filtered, v)
		end

		if #properties.filtered == 100 then break end
	end
end

MainMenu.Admin.Properties.onOpen = function (admin, filter)
    properties.all = Callbacks.Trigger("property:all")
	filterProperties(filter)
	isAdmin = admin
end

MainMenu.Admin.Properties.Create = function()
    MainMenu.Admin.Properties.Main = Menus:CreateSub(MainMenu.Admin.Main, "Propriétés", "default")
	MainMenu.Admin.Properties.Property.Create()

    Menus:CreateThread(MainMenu.Admin.Properties.Main, function()
        Menus:IsVisible(MainMenu.Admin.Properties.Main, function()
			Menus:AddButton("Rechercher", false, "🔍", "", function ()
				local filter = Utils.KeyboardInput("Recherche", 255, "")

				if filter then
					filter = filter:lower()
				end

				filterProperties(filter)
			end)

			Menus:AddSeparator("Liste des propriétés")

			for _, property in pairs(properties.filtered) do
				Menus:AddButton(("Propriété #%d"):format(property.id), false, "", "", function()
					MainMenu.Admin.Properties.Property.onOpen(property.id, isAdmin)
				end, MainMenu.Admin.Properties.Property.Main)
			end
        end)
    end)
end
