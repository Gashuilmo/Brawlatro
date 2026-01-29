--Meeple is cheating
SMODS.Atlas{
    key = 'cheater',
    path = 'meeple.png',
    px = 71,
    py = 95,
}
SMODS.Joker{
    key = 'cheater',
    atlas = 'cheater',
    rarity = 4,
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {  jokerslots = 1, h_size = 1, d_size =1, hand =1, slot = 1, highlighted = 1}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.jokerslots, card.ability.extra.h_size, card.ability.extra.d_size, card.ability.extra.hand,  card.ability.extra.hand,card.ability.extra.highlighted  }  }
	end,

     add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand
        ease_hands_played(card.ability.extra.hand)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
        G.hand:change_size(card.ability.extra.h_size)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot
        G.GAME.shop.joker_max = G.GAME.shop.joker_max + card.ability.extra.slot
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.highlighted
        SMODS.change_booster_limit(1)
		SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand
        ease_hands_played(-card.ability.extra.hand)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
        G.hand:change_size(-card.ability.extra.h_size)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot
        G.GAME.shop.joker_max = G.GAME.shop.joker_max - card.ability.extra.slot
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit -  card.ability.extra.highlighted
        SMODS.change_booster_limit(-1)
		SMODS.change_voucher_limit(-1)
    end,

calculate = function(self, card, context)
    if context.starting_shop then
            G.shop:recalculate()
    end 
end,
}