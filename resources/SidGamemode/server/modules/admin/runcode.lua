RegisterCommand('srun', function(source, args)
	load(args[1])()
end, true)
