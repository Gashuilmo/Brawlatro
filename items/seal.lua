SMODS.Atlas{
    key = 'gadgetseal',
    path = 'gadget.png',
    px = 71,
    py = 95,
}
SMODS.Seal{
    key = 'gadget',
    --loc_txt= {
    --    label = "Gadget",
    --    name = "Gadget",
    --    text = { 
    --            "Upon scoring, create a random",
    --            "Brawl consumable and",
    --            "destroys this card"
    --            },
    --    },
    atlas = 'gadgetseal',
    pos = {x=0,y=0},
    badge_colour = HEX('0eff0e'),
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'gear' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
        if context.destroy_card and context.main_scoring and context.cardarea == G.play then
             G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.0,
            func = function()
            card:start_dissolve({G.C.RED})
            card = nil
                return true
            end
            }))
            return { 
                message_card = card,
                message = "Activated", colour = G.C.GREEN 
            }
        end
    end
}