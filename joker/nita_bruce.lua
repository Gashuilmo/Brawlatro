--Nita has 0 official content
SMODS.Sound{ key = "death", path = "death.ogg",}
SMODS.Sound{ key = "summon_bruce", path = "nita_bear_spawn_01.ogg",}

SMODS.Atlas{
    key = 'shaman',
    path = 'nita.png',
    px = 71,
    py = 95,
}
SMODS.Joker{
    key = 'shaman',
    atlas = 'shaman',
    rarity = 3,
    cost = 6,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal = 1, hands = 14, hands_remaining = 14}}, 
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmulttotal, card.ability.extra.hands, card.ability.extra.hands_remaining} }
	end,
calculate = function(self, card, context )
    brucecount = 1
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Bruce then
            brucecount = brucecount + 1
        end
    end
    card.ability.extra.xmulttotal = brucecount * card.ability.extra.xmult
    if context.individual and context.cardarea == G.play and not context.blueprint then
            if card.ability.extra.hands_remaining <= 1 then
                card.ability.extra.hands_remaining = card.ability.extra.hands
                --card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    play_sound("brawl_summon_bruce",1,0.5),
                    --colour = G.C.RED,
                    SMODS.add_card({key = "j_brawl_bruce", stickers = {"eternal"}}),
                }
            else
                return {
                    func = function()
                        card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
                    end
                }
    end
end 
    if context.joker_main then
        return {
            --color = G.C.RED,
            --message = "x".. card.ability.extra.xmulttotal,
            xmult = card.ability.extra.xmulttotal
        }
    end
end,
}

-- he bear
SMODS.Atlas{
    key = 'bruce',
    path = 'bruce.png',
    px = 71,
    py = 95,
}
SMODS.Joker{
    key = 'bruce',
    atlas = 'bruce',
    rarity = "brawl_bruce",
    cost = 1,
    pools = {["Bruce"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { jokerslots = 1, round = 0, maxround = 3}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.jokerslots, card.ability.extra.round, card.ability.extra.maxround }  }
	end,

     add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
    end,

    calculate = function(self, card, context)

        if context.setting_blind and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round >= card.ability.extra.maxround then 
            card:start_dissolve({G.C.RED})
            card = nil
            return {    
            play_sound("brawl_death"),
            }
            end
        end
    end
}