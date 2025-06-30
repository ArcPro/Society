ClientModules = ClientModules or {}
ClientModules.Inventory = ClientModules.Inventory or {}
ClientModules.Inventory.opened = false
---@type Inventory
ClientModules.Inventory.rightPanel = nil
ClientModules.Inventory.rightPanelName = "Autre inventaire"
ClientModules.Inventory.disabledControls = false
ClientModules.Inventory.targetPlayer = nil
ClientModules.Inventory.entity = nil
local currentWeapon = nil
function ClientModules.Inventory:Parse()
    return {
        otherInventoryMaxWeight = self.rightPanel and
            self.rightPanel:max_weight() or 0,
        otherInventorySlotCount = self.rightPanel and self.rightPanel:slots() or
            nil,
        otherInventory = self.rightPanel and self.rightPanel:content() or nil,
        playerInventoryMaxWeight = player:inventory():max_weight(),
        playerInventory = player:inventory():content(),
        sex = player:sex():lower() == 'm' and 0 or 1,
        otherInventoryName = self.rightPanelName,
        character = self:GetCurrentOutfit(),
        quickAccess = {}
    }
end

function ClientModules.Inventory:Refresh()
    if self.opened == false then return end

    UI:SendMessage('inventory:update', self:Parse())
end

function ClientModules.Inventory:ShouldClose()
    if IsModelAVehicle(GetEntityModel(self.entity)) then
        return Math.Distance(player:position(),
                             GetWorldPositionOfEntityBone(self.entity,
                                                          GetEntityBoneIndexByName(
                                                              self.entity,
                                                              GetTrunkBone(
                                                                  self.entity)))) >
                   2.5
    end

    return
        Math.Distance(player:position(), GetEntityCoords(self.entity, false)) >
            2.5
end

---@param rightPanelId? number | string
---@param name? string
---@param entity? Entity
function ClientModules.Inventory:Open(rightPanelId, name, entity)
    local rawRightPanel = nil

    if self.opened == true then
        self.opened = false
        Citizen.Wait(100)
    end

    if self.opened == false and
        (LocalPlayer.state.handcuffed or LocalPlayer.state.busy) then return end

    if rightPanelId ~= nil then
        rawRightPanel = Callbacks.Trigger('inventory:get', rightPanelId)
    end

    if rawRightPanel ~= nil then
        self.rightPanel = Inventory:new(Functions.RemoveUnderscores(
                                            rawRightPanel))
    end

    self.rightPanelName = name or "Autre inventaire"
    self.entity = entity
    self.opened = true

    UI:Toggle('inventory', self.opened, self:Parse(), self.opened, self.opened)
    ToggleRadar(false)

    if self.rightPanel ~= nil then
        Events.TriggerServer("inventory:setInInventory", self.rightPanel:id())
    end

    Events.TriggerServer("inventory:setInInventory", player:inventory_id())

    Utils.Clone.Create(3.0, 0.0, 0.5, 1)

    Citizen.CreateThread(function()
        Citizen.Wait(100)

        self.disabledControls = true

        Citizen.CreateThread(function()
            while self.disabledControls == true do
                Utils.DisableControlsForUI()
                Citizen.Wait(0)
            end
        end)

        while self.opened == true do

            if self.entity ~= nil then
                if not DoesEntityExist(self.entity) or
                    ClientModules.Inventory:ShouldClose() and
                    GetVehiclePedIsIn(PlayerPedId(), false) ~= self.entity then
                    self.opened = false
                    break
                end
            end

            Citizen.Wait(0)
        end

        Events.TriggerServer("inventory:removeFromInventory",
                             player:inventory_id())

        if self.rightPanel ~= nil then
            Events.TriggerServer("inventory:removeFromInventory",
                                 self.rightPanel:id())
        end

        UI:Toggle('inventory', false, {}, false, false)
        Utils.Clone.Destroy()
        ToggleRadar(true)

        self.targetPlayer = nil
        self.rightPanel = nil

        if self.entity then ClientModules.Misc.Animations:Stop() end

        Citizen.Wait(100)

        self.disabledControls = false
    end)
end

function ClientModules.Inventory:Close() self.opened = false end

---@param item Item
function ClientModules.Inventory:UseItem(item)
    if Item.IsUsable(item.name) then
        Item.Use(item)
    elseif Item.IsWeapon(item.name) then
        local ped = PlayerPedId()
        local weaponItem = Item.Get(item.name)
        local weaponName = tostring(item.name)
        local weaponHash = joaat(weaponItem.action.model)
        local weaponinhand = GetCurrentPedWeapon(ped)
        if currentWeapon == weaponName and weaponinhand then
            SetCurrentPedWeapon(ped, 'WEAPON_UNARMED', true)
            RemoveAllPedWeapons(ped, true)
            currentWeapon = nil
        else
            local ammo = ClientModules.Weapons:GetTotalQuantity(item.name)
            if weaponName == "weapon_fireextinguisher" then
                ammo = 4000
            end

            GiveWeaponToPed(ped, weaponHash, ammo, false, false)
            SetPedAmmo(ped, weaponHash, ammo)
            SetCurrentPedWeapon(ped, weaponHash, true)
            currentWeapon = weaponName
        end

    else
        UI:AddNotification('basic', "~r~Cet item n'est pas utilisable~s~",
                           "info", 3000)
    end
end

Utils.KeyRegister('F5', 'inventory', "Ouvrir l'inventaire", function()
    if ClientModules.Inventory.opened == true then
        ClientModules.Inventory:Close()
    else
        ClientModules.Inventory:Open()
    end
end)
