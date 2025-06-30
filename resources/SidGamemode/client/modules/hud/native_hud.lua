ClientModules = ClientModules or {}
ClientModules.HUD = ClientModules.HUD or {}
ClientModules.HUD.Minimap = {}
ClientModules.HUD.Minimap.initalized = false

function ClientModules.HUD.Minimap:Initialize()
	if self.initalized == true then return end

	Citizen.CreateThread(function()
		local posX = 0.0
		local posY = -0.035

		local width = 0.15
		local height = 0.175

		Utils.Streaming.RequestStreamedTextureDict("circlemap")

		AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
		SetMinimapClipType(0)
		SetMinimapComponentPosition('minimap', 'L', 'B', posX, posY, width, height)
		SetMinimapComponentPosition('minimap_mask', 'L', 'B', posX, posY, width, height)
		SetMinimapComponentPosition('minimap_blur', 'L', 'B', posX, posY, width, height)

		SetBigmapActive(true, false)

		Citizen.Wait(500)

		SetBigmapActive(false, false)

		ReplaceHudColourWithRgba(116, 0, 181, 254, 255)

		while true do
			for i=0, 22 do
				if i ~= 2 and (i < 10 or i > 12) and i < 19 then
					HideHudComponentThisFrame(i)
				end
			end

			SetRadarZoom(1100)
			Citizen.Wait(0)
		end
	end)

	self.initalized = true
end
