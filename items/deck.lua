--Only Gadget Seal
SMODS.Atlas{
    key = 'gadgetdeck',
    path = 'gadgetdeck.png',
    px = 71,
    py = 95,
}
SMODS.Back{
    name = "One Time Use",
    key = "gadget_deck",
    pos = {x = 0, y = 0},
    atlas = "gadgetdeck",
    config = {random = true},
apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                local trandom_g = {
                    "brawl_gadget",
                    "NOTHING"
                }
                for i = #G.playing_cards, 1, -1 do
                    local random_g = randomSelect(trandom_g)

                    if random_g ~= "NOTHING" then
                        G.playing_cards[i]:set_seal(random_g, true, true)
                    end
                end

                return true
            end
        }))
    end
}
function randomSelect(table)
    for i = 1, 5 do
        math.random()
    end
    if #table == 0 then
        return nil -- Table is empty
    end
    local randomIndex = math.random(1, #table)
    return table[randomIndex]
end