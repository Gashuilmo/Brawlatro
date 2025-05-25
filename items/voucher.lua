SMODS.Atlas{
    key = "passvoucher",
    path = "passvoucher.png",
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = "brawlpass",
        loc_txt = {
                name = 'Brawl Pass',
                text = { 'Gives {C:money}$#1#{} per hand at the end of every round.'}
        },
    atlas = "passvoucher",
    pos = { x = 0, y = 0 },
    cost = 10,
    unlocked = true,
    discovered = true,
    config = { extra = { dollars = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.hands_left > 0 and G.GAME.current_round.hands_left * card.ability.extra.dollars or nil
    end
}

SMODS.Voucher {
    key = "brawlpassplus",
        loc_txt = {
                name = 'Brawl Pass Plus',
                text = { 'Gives {C:money}$#1#{} per discard at the end of every round.',
            "Stack with {C:attention}Brawl Pass{}" }
        },
    atlas = "passvoucher",
    pos = { x = 0, y = 1 },
    cost = 10,
    unlocked = true,
    discovered = true,
    requires = {"v_brawl_brawlpass"},
    config = { extra = { dollars = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.discards_left > 0 and G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
    end
}