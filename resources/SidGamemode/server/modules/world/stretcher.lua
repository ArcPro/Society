Events.Register("stretcher:model_swap", function(_, net_id, target_model)
	Events.TriggerClient("stretcher:model_swap", -1, net_id, target_model)
end)
