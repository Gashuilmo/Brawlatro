--Carl killed Moe
SMODS.Atlas{
    key = 'drill',
    path = 'moe.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'carlpick',
    atlas = 'drill',
    rarity = 3,
    cost = 7,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = { chip = 0, chipdrilled = 25, chisel = 0 } },
    enhancement_gate = 'm_stone',
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = { card.ability.extra.chip , card.ability.extra.chipdrilled, card.ability.extra.chisel }
        }
end,
  
calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and not context.blueprint then
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
            if not context.other_card.debuff then 
            card.ability.extra.chip = card.ability.extra.chip + card.ability.extra.chipdrilled
            card.ability.extra.chisel = card.ability.extra.chisel + card.ability.extra.chipdrilled
            return {message = "Drilled", colour = G.C.CHIPS,}
            end
        end
    end
    if context.destroy_card and context.cardarea == G.play and SMODS.has_enhancement(context.destroy_card, "m_stone") then
        if card.ability.extra.chip >= 50 then
            check_for_unlock({ type = "carl" })
        return true end    
        --card:start_dissolve({G.C.RED})
        --card = nil
        return { --message = "Drilled",
                    --colour = G.C.CHIPS,
                    remove = true, }
    end
    if context.joker_main then
        return {
            chips = card.ability.extra.chip,
            message_card = card,
            colour = G.C.CHIPS,      
        }
	end
end
}