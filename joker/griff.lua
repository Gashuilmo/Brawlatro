--Griff needs your bank account
SMODS.Atlas{
    key = 'griff',
    path = 'griff.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'debt',
    atlas = 'griff',
    rarity = 3,
    cost = 7,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    soul_pos = {x=1, y=0},
    config = { extra = {chip = 1, chiptottal = 0, moneyspent = 0 }},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip,card.ability.extra.chiptottal, card.ability.extra.moneyspent }  }
	end,

    calculate = function(self, card, context)
        if context.brawl_ease_dollars and context.brawl_ease_dollars < 0 and not context.blueprint and not context.repetition then
                card.ability.extra.moneyspent = card.ability.extra.moneyspent + (-context.brawl_ease_dollars)
                card.ability.extra.chiptottal = card.ability.extra.chiptottal + (-context.brawl_ease_dollars * 2)
        end
        
        if context.joker_main then
                return {
                    chips = card.ability.extra.chiptottal,
                    message_card = card,
                }
        end
        if card.ability.extra.moneyspent >= 17765 then
            check_for_unlock({ type = "coins" })
        return true
        end
    end
}

local base_ease_dollars = ease_dollars
function ease_dollars(mod, x)
    base_ease_dollars(mod, x)

    SMODS.calculate_context({brawl_ease_dollars = mod})
end