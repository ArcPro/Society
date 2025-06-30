Utils = Utils or {}

---Opens a popup to validate a deletion
---@param cb fun()
function Utils.ValidateDeletion(cb)
	UI:Popup("Supprimer", "Cette action est irréversible, êtes-vous sur de vouloir faire cela ?", {
		text = "Valider",
		cb = cb
	}, {
		text = "Annuler",
		cb = function()end
	}, 0)
end
