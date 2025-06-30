Citizen.CreateThread(function()
	local data = {}
    while true do
		data = Callbacks.Trigger("rich_presence:info") or {}

        SetDiscordAppId("1355208920360026194")
		SetRichPresence(("%d/%d"):format(data.count or 0, data.max or 512))
		SetDiscordRichPresenceAsset("sastories")
		SetDiscordRichPresenceAssetText(data.name or "San Andreas Stories")

        Citizen.Wait(30000)
    end
end)
