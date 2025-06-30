local isRagdolling = false

local function Ragdoll()
	if IsPedOnFoot(PlayerPedId()) == false then return end

	isRagdolling = not isRagdolling

	if isRagdolling == false then return end

	local ped = PlayerPedId()

	Citizen.CreateThread(function()
		while isRagdolling do
			SetPedToRagdoll(ped, 1000, 1000, 0, false, false, false)

			Citizen.Wait(0)
		end
	end)
end

Utils.KeyRegister("j", "ragdoll", "Ragdoll", function()
	Ragdoll()
end)

Events.Register("ragdoll", function(source)
	isRagdolling = false

	Ragdoll()
end)
