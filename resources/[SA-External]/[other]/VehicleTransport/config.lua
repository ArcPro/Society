
Config = {}

-- if the script should be enabled for everyone on startup
Config.defaultEnabled = true

-- maximum speed of a transport with its ramp deployed (in meters per second)
Config.deployedRampSpeed = 3.0

-- maximum speed difference when trying to attach/detach a vehicle (in meters per second)
Config.maxAttachSpeedDiff = 3.0

-- controls (https://docs.fivem.net/docs/game-references/controls/)
Config.Controls = {
	attach		= 73,
	toggleRamp	= 51
}

-- translation
Config.Strings = {
	detachHelpText			= "Appuyez sur ~INPUT_VEH_DUCK~ pour détacher le véhicule",
	attachHelpText			= "Appuyez sur ~INPUT_VEH_DUCK~ pour attacher le véhicule.",
	toggleRampHelpText		= "Appuyez sur ~INPUT_CONTEXT~ pour déployer/ranger la rampe.",

	vehicleAttachedNotif	= "Véhicule aataché !",
	vehicleDetachedNotif	= "Véhicule détaché !",
	vehicleTooFastNotif		= "Ralentissez avant d'attacher !",
	vehicleLockedNotif		= "Ce véhicule est verrouillé !"
}
