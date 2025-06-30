MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Items = MainMenu.Admin.Items or {}

local items = {
    all = {},
    filtered = {}
}
local filter = nil

MainMenu.Admin.Items.onOpen = function ()
    items = {
        all = {},
        filtered = {}
    }

	for _, item in pairs(Item._list) do
        table.insert(items.all, item)
    end

    table.sort(items.all, function(a, b)
        return a.label < b.label
    end)
end

MainMenu.Admin.Items.Create = function()
    MainMenu.Admin.Items.Main = Menus:CreateSub(MainMenu.Admin.Main, "Items", "default")
    MainMenu.Admin.Items.Item.Create()

    Menus:CreateThread(MainMenu.Admin.Items.Main, function()
        Menus:IsVisible(MainMenu.Admin.Items.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                filter = Utils.KeyboardInput("Rechercher un item", 100, "")

                if filter == nil then
                    filter = ""
                    -- MainMenu.Admin.Items.onOpen()
                    -- return
                end

				filter = filter:lower()

                items.filtered = {}
                for _, item in pairs(items.all) do
                    if string.find(item.name:lower(), filter) or string.find(item.label:lower(), filter) then
                        table.insert(items.filtered, item)
                    end

                    if #items.filtered == 100 then break end
                end

                table.sort(items.filtered, function(a, b)
                    return a.label < b.label
                end)
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local name = Utils.KeyboardInput("Nom", 100, "")
                local label = Utils.KeyboardInput("Label", 100, "")
                local category = Utils.KeyboardInput("Catégorie", 100, "")
                local weight = tonumber(Utils.KeyboardInput("Poids", 5, ""))
                local image = Utils.KeyboardInput("Image", 255, "")

                if name == nil or label == nil or category == nil or weight == nil or image == nil then
                    return
                end

                Events.TriggerServer("items:new", name, label, category, weight, image, { type = "undefined" })
            end)

            if #items.filtered == 0 then return end

            Menus:AddSeparator("Items")

            for _, item in pairs(items.filtered) do
                Menus:AddButton(item.label, false, "", "chevron_right", function()
                    MainMenu.Admin.Items.Item.onOpen(item.name)
                end, MainMenu.Admin.Items.Item.Main)
            end

        end)
    end)
end
