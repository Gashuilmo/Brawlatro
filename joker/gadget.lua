--GADGET GADGET GADGET
SMODS.Atlas{
    key = 'activator',
    path = 'brawlstars.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'activator',
    atlas = 'activator',
    rarity = 3,
    cost = 1,
    --pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    config = { extra = {xmult = 2, additional = 2 }},
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = "brawl_tooltip_gadget"}
		return { vars = { card.ability.extra.xmult, card.ability.extra.additional}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == 'brawl_gadget' then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.additional
                return {message_card = card, message = "Upgraded!"}
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}