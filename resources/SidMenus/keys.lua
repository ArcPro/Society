local pressed = {
    up = false,
    down = false,
    left = false,
    right = false
}

RegisterCommand("+outro_menus:up", function()
    pressed.up = true
    Menus.Controls.Up()
end, false)

RegisterCommand("-outro_menus:up", function()
    pressed.up = false
end, false)

RegisterCommand("+outro_menus:down", function()
    pressed.down = true
    Menus.Controls.Down()
end, false)

RegisterCommand("-outro_menus:down", function()
    pressed.down = false
end, false)

RegisterCommand("+outro_menus:left", function()
    pressed.left = true
    Menus.Controls.Left()
end, false)

RegisterCommand("-outro_menus:left", function()
    pressed.left = false
end, false)

RegisterCommand("+outro_menus:right", function()
    pressed.right = true
    Menus.Controls.Right()
end, false)

RegisterCommand("-outro_menus:right", function()
    pressed.right = false
end, false)

RegisterCommand("outro_menus:select", function()
    Menus.Controls.Select()
end, false)

RegisterCommand("outro_menus:back", function()
    Menus.Controls.Back()
end, false)

RegisterKeyMapping("+outro_menus:up", "Menu Haut", "keyboard", "up")
RegisterKeyMapping("+outro_menus:down", "Menu Bas", "keyboard", "down")
RegisterKeyMapping("+outro_menus:left", "Menu Gauche", "keyboard", "left")
RegisterKeyMapping("+outro_menus:right", "Menu Droite", "keyboard", "right")
RegisterKeyMapping("outro_menus:select", "Menu Sélectionner", "keyboard", "return")
RegisterKeyMapping("outro_menus:back", "Menu Retour", "keyboard", "back")

CreateThread(function()
    local timer = 0
    while true do
        Citizen.Wait(0)
        if pressed.up or pressed.down or pressed.left or pressed.right then
            timer += 1
            if timer > 20 then
                if pressed.up then
                    Menus.Controls.Up()
                elseif pressed.down then
                    Menus.Controls.Down()
                elseif pressed.left then
                    Menus.Controls.Left()
                elseif pressed.right then
                    Menus.Controls.Right()
                end
                Citizen.Wait(50)
            end
        else
            timer = 0
        end
    end
end)
