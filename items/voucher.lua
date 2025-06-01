--Passes
SMODS.Atlas{
    key = "passvoucher",
    path = "passvoucher.png",
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = "brawlpass",
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

--Scoop
SMODS.Atlas{
    key = "passvoucher",
    path = "passvoucher.png",
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = "brawlpass",
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