Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

	local prop = ClientModules.World.Decoration:GetPropId(hitEntity)

    if prop == nil then
        return
    end

	if ClientModules.World.Decoration:CanEdit(prop) == false then
        return
    end

    Context:AddItem(0, "Ouvrir le menu", function()
        MainMenu.Props.Settings.onOpen(ClientModules.World.Decoration:GetPropDataFromId(prop))
		Menus:Visible(MainMenu.Props.Settings.Main, true)
    end, true)

    Context:AddItem(0, "Déplacer", function()
        Events.Trigger("gizmo", hitEntity)
    end, true)

    Context:AddItem(0, "Dupliquer", function()
		ClientModules.World.Decoration:Duplicate(hitEntity)
    end, true)

    Context:AddItem(0, "Désactiver les collisions", function()
		ClientModules.World.Decoration:Update(prop, "collisions", false)
    end, true)

    Context:AddItem(0, "Supprimer", function()
		ClientModules.World.Decoration:Delete(prop)
    end, true)
end)
