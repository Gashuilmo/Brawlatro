--Colette LOVES YOU 
SMODS.Atlas{
    key = 'collector',
    path = 'colette.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'colette',
    atlas = 'collector',
    rarity = 3,
    cost = 6,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal=1}},

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = "brawl_tooltip_brawler"}
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmulttotal, }  }
	end,

    calculate = function(self, card, context)
    Brawlcount = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Brawler then
            Brawlcount = Brawlcount + 1
        end
    end
    card.ability.extra.xmulttotal = Brawlcount * card.ability.extra.xmult
    if context.joker_main then
        return {
            color = G.C.RED,
            message = "x".. card.ability.extra.xmulttotal,
            Xmult_mod = card.ability.extra.xmulttotal
        }
    end
end,
}