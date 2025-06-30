ServerModules = ServerModules or {}
ServerModules.Misc = ServerModules.Misc or {}
ServerModules.Misc.DiscordStatus = {}
ServerModules.Misc.DiscordStatus.Enabled = false
ServerModules.Misc.DiscordStatus.EmbedSettings = {
	text = {
		online = "# :white_check_mark: __Le serveur est en ligne__",
		offline = "# :no_entry_sign: __Le serveur est éteint__"
	},

	color = {
		offline = 15548997,
		online = 5763719,
	}
}

---Send status webhook
---@param status "online" | "offline"
function ServerModules.Misc.DiscordStatus:SendWebhook(status)
	if self.Enabled ~= true then return end

    PerformHttpRequest(Config.Webhooks.STATUS, function(err, text, header)end, "POST", json.encode({
		avatar_url = "https://cdnrv.sysscripts.com/other/logo.webp",
		username = "San Andreas Stories",

		embeds = {
			{
				timestamp = os.date('!%Y-%m-%dT%H:%M:%S.000Z'),
				description = self.EmbedSettings.text[status],
				color = self.EmbedSettings.color[status],
				footer = { text = "San Andreas Stories" },
				title = "Statut serveur",
			}
		},
	}), { ['Content-Type'] = 'application/json' })
end

function ServerModules.Misc.DiscordStatus:Initialize()
	self:SendWebhook("online")

	AddEventHandler("txAdmin:events:scheduledRestart", function(eventData)
		if eventData.secondsRemaining ~= 60 then return end

		Citizen.SetTimeout(50 * 1000, function()
			self:SendWebhook("offline")
		end)
	end)
end

ServerModules.Misc.DiscordStatus:Initialize()
