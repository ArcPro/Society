local currentList = {}
local tickTime = 50

CreateThread(function()
    while Menus == nil do
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(tickTime)

        if Menus.Current then

            if Menus.Threads[Menus.Current] ~= nil then
                Menus.Threads[Menus.Current]()
            else
                Menus.Current = nil
            end

            if exports["SidUI"]:IsFocused() or IsPauseMenuActive() then
                Menus.Get(Menus.Current):items():flush()
            end

            if (CompareTables(currentList, Menus.Get(Menus.Current):items():list()) == false) then
                currentList = Menus.Get(Menus.Current):items():list()

                Menus.Controls.Update(
                    Menus.Get(Menus.Current):title(),
                    Menus.Get(Menus.Current):banner(),
                    RealIndex(Menus.Get(Menus.Current):index(), currentList) - 1,
                    currentList
                )
            end

            if #currentList > 250 then
                tickTime = 250
            else
                tickTime = 50
            end

        else
            currentList = {}
        end
    end
end)
