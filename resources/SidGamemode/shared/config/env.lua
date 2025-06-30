Config = Config or {}
Config.Env = IsDuplicityVersion() and "server" or "client"
Config.EntityLockdown = false
Config.MaxSlots = 500
Config.APIKey = exports.config:Get().APIKey
