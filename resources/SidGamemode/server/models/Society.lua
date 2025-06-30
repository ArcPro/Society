DB = DB or {}
DB.Society = {}
DB.Society.Grades = {}

function DB.Society.Get(id)
    local isId = type(id) == 'number'
    local society = MySQL.single.await("SELECT * FROM `societies` WHERE `id` = ?", {id})

    if not isId then
        society = MySQL.single.await("SELECT * FROM `societies` WHERE `name` = ?", {id})
    end

    if (society == nil) then
        return nil
    end

    society.employees = MySQL.query.await(
        "SELECT characters.id AS id, firstname, lastname, grade FROM `characters` LEFT JOIN societies_grades ON job_grade = grade AND society = job WHERE `job` = ?",
        {id})
    society.grades = MySQL.query.await(
        "SELECT `id`, `label`, `salary`, `grade`, `can_manage` FROM `societies_grades` WHERE `society` = ?", {id})

    if (type(society.phone_blip) == "string") then
        society.phone_blip = json.decode(society.phone_blip)
    end

    if (type(society.phone_custom_icon) == "string") then
        society.phone_custom_icon = json.decode(society.phone_custom_icon)
    end

    return Society:new(society)
end

function DB.Society.All()
    local societies = MySQL.query.await("SELECT `id` FROM `societies`")
    local list = {}

    for _, society in pairs(societies) do
        table.insert(list, DB.Society.Get(society.id))
    end

    return list
end

function DB.Society.Create(label, name, bank_account_id)
    return MySQL.insert.await(
        "INSERT INTO `societies` (`label`, `name`, `bank_account_id`, `phone_blip`, `phone_can_message`, `phone_can_call`, `phone_custom_icon`) VALUES (?, ?, ?, ?, ?, ?, ?)",
        {label, name, bank_account_id, json.encode({}), true, true, json.encode({})})
end

function DB.Society.Update(id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call,
    phone_custom_icon)
    return MySQL.update.await(
        "UPDATE `societies` SET `label` = ?, `name` = ?, `bank_account_id` = ?, `phone_blip` = ?, phone_can_message = ?, phone_can_call = ?, phone_custom_icon = ? WHERE `id` = ?",
        {label, name, bank_account_id, json.encode(phone_blip), phone_can_message, phone_can_call,
         json.encode(phone_custom_icon), id})
end

function DB.Society.Delete(id)
    return MySQL.query.await("DELETE FROM `societies` WHERE `id` = ?", {id})
end

function DB.Society.Grades.Add(society, grade, label)
    return MySQL.insert.await("INSERT INTO `societies_grades` (`society`, `grade`, `label`) VALUES (?, ?, ?)",
        {society, grade, label})
end

function DB.Society.Grades.Update(id, grade, label, salary, can_manage)
    return MySQL.update.await(
        "UPDATE `societies_grades` SET `grade` = ?, `label` = ?, `salary` = ?, `can_manage` = ? WHERE `id` = ?",
        {grade, label, salary, can_manage, id})
end

function DB.Society.Grades.Delete(id)
    return MySQL.query.await("DELETE FROM `societies_grades` WHERE `id` = ?", {id})
end
