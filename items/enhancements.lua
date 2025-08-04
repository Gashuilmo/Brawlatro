SMODS.Atlas{
    key = 'dirty',
    path = 'Dirty.png',
    px = 71,
    py = 95,
}
SMODS.Enhancement {
    key = 'dirty',
    atlas = "dirty",
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = {chips = 1.2, mult = 1.2, odds = 2 }}, 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult,(G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom('colony') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    xchips = card.ability.extra.chips,
                    --message_card = card,
                    --colour = G.C.CHIPS,      
                }
            else 
                return {
                    xmult = card.ability.extra.mult,
                    --message_card = card,
                    --colour = G.C.MULT,
                }
        end
    end
end
        }