SMODS.Atlas{
    key = 'mega_box',
    path = 'megabox.png',
    px = 148,
    py = 125,
}

SMODS.Booster{
    key = 'booster_megabox',
    group_key = "k_brawlatro_booster_group",
    atlas = 'mega_box', 
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_txt= {
        name = 'MEGA BOX',
        text = { "Pick {C:attention}#1#{} Brawler out of",
                "{C:attention}#2#{} Brawler jokers!", },
        group_name = {"Pick somethin', will ya?"},
    },
    
    draw_hand = false,
    config = {
        extra = 3,
        choose = 1, 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 10,
    cost = 5,
    kind = "BrawlPack",
    
    create_card = function(self, card, i)
        ease_background_colour(HEX("ffac00"))
        return SMODS.create_card({
            set = "Brawler",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}