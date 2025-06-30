DB = DB or {}
DB.Player = {}

local function loadPlayerJob(job, grade)
    local society = ServerModules.Societies.List[job]
    local base_data = {
        job = {
            id = nil,
            name = nil,
            label = nil
        },

        job_grade = {
            grade = nil,
            label = nil
        }
    }

    if (society == nil or society:grades() == nil or #society:grades() == 0) then
        return base_data
    end

    local societyGrade = ServerModules.Societies.Grades:Get(job, grade)

    if societyGrade == nil then
        societyGrade = ServerModules.Societies.Grades:Get(job, 1)
    end

    if societyGrade == nil then
        return base_data
    end

    return {
        job = {
            id = job,
            name = society:name(),
            label = society:label()
        },

        job_grade = {
            grade = societyGrade.grade,
            label = societyGrade.label
        }
    }
end

DB.Player.All = function()
    return MySQL.query.await(
        "SELECT characters.id, characters.firstname, characters.lastname, players.identifier FROM `characters` JOIN `players` ON players.active_character = characters.id")
end

DB.Player.Get = function(id)
    return MySQL.single.await("SELECT * FROM `players` WHERE `identifier` = ? LIMIT 1", {id})
end

DB.Player.GetDiscord = function(id)
    local result = MySQL.single.await("SELECT `identifier` FROM `players` WHERE `active_character` = ? LIMIT 1", {id})

    if result == nil then
        return nil
    end

    return result.identifier
end

DB.Player.GetCharacter = function(src)

    local identifiers = Identifiers.Parse(GetPlayerIdentifiers(src))
    local guildMember = GetGuildMember(identifiers.discord)

    if (guildMember == nil) then
        return nil
    end

    local result = MySQL.single.await("\
        SELECT players.*, characters.* FROM `players`   \
        LEFT JOIN `characters` ON characters.id = players.active_character \
        WHERE players.identifier = ? LIMIT 1", {identifiers.discord})

    if (result.id == nil) then
        return nil
    end

    if (type(result.position) == "string") then
        result.position = json.decode(result.position)
    end

    if (type(result.skin) == "string") then
        result.skin = json.decode(result.skin)
    end

    if (type(result.metadata) == "string") then
        result.metadata = json.decode(result.metadata)
    end

    result.permissions = GetPermissions(identifiers.discord)

    local societyInfo = loadPlayerJob(result.job, result.job_grade)

    result.job = societyInfo.job
    result.job_grade = societyInfo.job_grade

    return Player:new({
        id = result.id,
        firstname = result.firstname,
        lastname = result.lastname,
        birthdate = result.birthdate,
        height = result.height,
        weight = result.weight,
        sex = result.sex,
        hunger = result.hunger,
        nationality = result.nationality,
        thirst = result.thirst,
        armor = result.armor,
        health = result.health,
        position = vector4(result.position.x, result.position.y, result.position.z, result.position.w or 0.0),
        job = result.job,
        job_grade = result.job_grade,
        permissions = result.permissions,
        skin = result.skin,
        inventory = {},
        inventory_id = result.inventory_id,
        bank_account_id = result.bank_account_id,
        identifiers = identifiers,
        hate = result.hate,
        slots = result.slots,
        locked = result.locked,
        group = result.group,
        metadata = result.metadata
    }, src)
end

DB.Player.GetAllCharacters = function(identifier)
    return MySQL.query.await("SELECT id, firstname, lastname, locked FROM `characters` WHERE `owner` = ?", {identifier})
end

DB.Player.GetCharacterById = function(characterId)
    local result = MySQL.single.await("\
        SELECT characters.*, players.* FROM `characters`					\
        LEFT JOIN `players` ON characters.owner = players.identifier		\
        WHERE characters.id = ? LIMIT 1", {characterId})

    if (result == nil or result.id == nil) then
        return nil
    end

    if (type(result.position) == "string") then
        result.position = json.decode(result.position)
    end

    if (type(result.skin) == "string") then
        result.skin = json.decode(result.skin)
    end

    if (type(result.metadata) == "string") then
        result.metadata = json.decode(result.metadata)
    end

    result.permissions = 0

    local societyInfo = loadPlayerJob(result.job, result.job_grade)

    result.job = societyInfo.job
    result.job_grade = societyInfo.job_grade

    return Player:new({
        id = result.id,
        firstname = result.firstname,
        lastname = result.lastname,
        birthdate = result.birthdate,
        height = result.height,
        weight = result.weight,
        sex = result.sex,
        hunger = result.hunger,
        thirst = result.thirst,
        nationality = result.nationality,
        armor = result.armor,
        health = result.health,
        position = vector4(result.position.x, result.position.y, result.position.z, result.position.w or 0.0),
        job = result.job,
        job_grade = result.job_grade,
        permissions = result.permissions,
        skin = result.skin,
        inventory = {},
        inventory_id = result.inventory_id,
        bank_account_id = result.bank_account_id,
        identifiers = {
            discord = result.identifier
        },
        hate = result.hate,
        slots = result.slots,
        locked = result.locked,
        group = result.group,
        metadata = result.metadata
    })
end

DB.Player.UpdateCharacter = function(player)

    local group = nil

    if player:group() ~= 0 then
        group = player:group()
    end

    return MySQL.update.await("UPDATE `characters` SET  \
        `firstname` = ?,                        		\
        `lastname` = ?,                         		\
        `birthdate` = ?,                        		\
        `sex` = ?,                              		\
		`nationality` = ?,								\
        `height` = ?,                           		\
        `weight` = ?,                           		\
        `hunger` = ?,                           		\
        `thirst` = ?,                           		\
        `armor` = ?,                            		\
        `health` = ?,                           		\
        `position` = ?,                         		\
        `job` = ?,                              		\
        `job_grade` = ?,                        		\
        `skin` = ?,                             		\
        `bank_account_id` = ?,                   		\
        `group` = ?,                   					\
        `metadata` = ?                   				\
    WHERE `id` = ?",
        {player:firstname(), player:lastname(), player:birthdate(), player:sex(), player:nationality(), player:height(),
         player:weight(), player:hunger(), player:thirst(), player:armor(), player:health(),
         json.encode(player:position()), player:job().id or nil, player:job_grade().grade or nil,
         json.encode(Functions.RemoveUnderscores(player:skin())), player:bank_account_id(), group,
         json.encode(player:metadata()), player:id()})
end

DB.Player.UpdatePermissions = function(player)
    return MySQL.update.await("UPDATE `players` SET `permissions` = ? WHERE `id` = ?",
        {player:permissions(), player:identifiers().discord})
end

DB.Player.SetActiveCharacter = function(identifier, id)
    return MySQL.update.await("UPDATE `players` SET `active_character` = ? WHERE `identifier` = ?", {id, identifier})
end

DB.Player.DeleteCharacter = function(player)
    DB.Inventory.Delete(player:inventory_id())

    if (player:bank_account_id() ~= nil) then
        DB.BankAccount.Delete(player:bank_account_id())
    end

    return MySQL.query.await("DELETE FROM `characters` WHERE `id` = ?", {player:id()})
end

DB.Player.LockCharacter = function(character_id, lockState)
    return MySQL.query.await("UPDATE `characters` SET `locked` = ? WHERE `id` = ?", {lockState, character_id})
end

DB.Player.GetSlots = function(identifier)
    return MySQL.single.await("SELECT `slots` FROM `players` WHERE `identifier` = ?", {identifier}).slots
end

DB.Player.SetSlots = function(identifier, slots)
    return MySQL.query.await("UPDATE `players` SET `slots` = ? WHERE `identifier` = ?", {slots, identifier})
end

DB.Player.HasFreeSlot = function(identifier)
    return true
    -- return MySQL.single.await("SELECT COUNT(*) >= players.slots AS free_slot FROM `characters` LEFT JOIN `players` ON players.identifier = characters.owner WHERE `owner` = ? GROUP BY players.slots", {
    --	identifier
    -- }).free_slot
end

DB.Player.Delete = function(player)
    DB.Player.DeleteCharacter(player)
    return MySQL.query.await("DELETE FROM `players` WHERE `identifier` = ?", {player:identifiers().discord})
end

DB.Player.CreateCharacter = function(firstname, lastname, birthdate, nationality, height, weight, sex, position, skin,
    src)
    local inventory_id = DB.Inventory.Create(50, 65)

    local discord = Identifiers.Parse(GetPlayerIdentifiers(src)).discord

    local id = MySQL.insert.await("INSERT INTO `characters` (	\
		`owner`,												\
        `firstname`,                                    		\
        `lastname`,                                     		\
        `birthdate`,                                    		\
		`nationality`,                                    		\
        `height`,                                       		\
        `weight`,                                       		\
        `sex`,                                          		\
        `hunger`,                                       		\
        `thirst`,                                       		\
        `armor`,                                        		\
        `health`,                                       		\
        `position`,                                     		\
        `job`,                                          		\
        `job_grade`,                                    		\
        `skin`,                                         		\
        `inventory_id`                                  		\
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
        {discord, firstname, lastname, birthdate, nationality, height, weight, sex, 100, 100, 0, 100,
         json.encode(position), 1, 0, json.encode(Functions.RemoveUnderscores(skin)), inventory_id})

    DB.Player.SetActiveCharacter(discord, id)

    return DB.Player.GetCharacter(src)
end

DB.Player.Create = function(id)
    return MySQL.insert.await("INSERT INTO `players` (`identifier`) VALUES (?);", {id})
end
