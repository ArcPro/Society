local instructional = nil

Events.Register("gizmo:instructional", function(_, toggle)
	if instructional ~= nil then
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("gizmoTranslation"))
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("gizmoRotation"))
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("gizmoScale"))
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("gizmoLocal"))
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("gizmoView"))
		ClientModules.HUD.InstructionalButtons:Delete(44)
	end

	if toggle == true then
		instructional = {
			ClientModules.HUD.InstructionalButtons:Add("Mode translation", Utils.GetControlHash("gizmoTranslation")),
			ClientModules.HUD.InstructionalButtons:Add("Mode rotation", Utils.GetControlHash("gizmoRotation")),
			ClientModules.HUD.InstructionalButtons:Add("Mode taille", Utils.GetControlHash("gizmoScale")),
			ClientModules.HUD.InstructionalButtons:Add("Mode local / global", Utils.GetControlHash("gizmoLocal")),
			ClientModules.HUD.InstructionalButtons:Add("Mode de vue", Utils.GetControlHash("gizmoView")),
			ClientModules.HUD.InstructionalButtons:Add("Focus", 44),
		}
	end
end)
