Core.Player:OnLoad(function()
	Citizen.CreateThread(function()
		local timeout = 0
		local show = false
		while true do
			show = ClientModules.Misc.Settings:Get("black_bands")

			if show == true then
				DrawRect(1.0, 1.0, 2.0, 0.25, 0, 0, 0, 255)
				DrawRect(1.0, 0.0, 2.0, 0.25, 0, 0, 0, 255)

				timeout = 0
			else
				timeout = 100
			end

			Citizen.Wait(timeout)
		end
	end)
end)
