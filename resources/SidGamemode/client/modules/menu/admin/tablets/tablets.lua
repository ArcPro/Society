MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Tablets = MainMenu.Admin.Tablets or {}

local tablets = {}

MainMenu.Admin.Tablets.Create = function()
    MainMenu.Admin.Tablets.Main = Menus:CreateSub(MainMenu.Admin.Main, "Tablettes", "default")
    MainMenu.Admin.Tablets.Tablet.Create()

    Menus:CreateThread(MainMenu.Admin.Tablets.Main, function()
        Menus:IsVisible(MainMenu.Admin.Tablets.Main, function()
            if #tablets == 0 then
                Menus:AddButton(("Aucune tablette trouvé"), true, "", "",
                    function() end, MainMenu.Admin.Tablets.Tablet.Main)
                return
            end

            for _, tablet in pairs(tablets) do
                Menus:AddButton(("Tablette #%d (%s)"):format(tablet.id, tablet.name), false, "", "chevron_right",
                    function()
                        MainMenu.Admin.Tablets.Tablet.onOpen(tablet.id)
                    end, MainMenu.Admin.Tablets.Tablet.Main)
            end
        end)
    end)

    Menus:OnOpen(MainMenu.Admin.Tablets.Main, function()
        tablets = Callbacks.Trigger("order:getAllTablets")
    end)
end
