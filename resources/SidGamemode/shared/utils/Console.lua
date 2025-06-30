Console = {}

Console.Log = function (...)
    print("^2[San Andreas Stories]^0 ", table.concat({...}, " "))
end

Console.Error = function (...)
    print("^1[San Andreas Stories Error]^0 ", table.concat({...}, " "))
end

Console.Warning = function (...)
    print("^3[San Andreas Stories Warning]^0 ", table.concat({...}, " "))
end
