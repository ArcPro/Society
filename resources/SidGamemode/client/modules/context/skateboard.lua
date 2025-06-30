Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if not DoesEntityExist(hitEntity) or exports["electric-skateboard"]:IsASkate(hitEntity) == false then return end

    Context:AddItem(0, "Monter sur le skateboard", function()
		exports["electric-skateboard"]:UseSkate()
    end, true)

	Context:AddItem(0, "Ramasser le skateboard", function()
		exports["electric-skateboard"]:PickupSkate()
		player:inventory():addItem(Item.Create("skateboard", {}, 1))
    end, true)
end)
