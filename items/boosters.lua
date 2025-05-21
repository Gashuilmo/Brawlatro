SMODS.Atlas{
    key = 'mega_box',
    path = 'megabox.png',
    px = 148,
    py = 125,
}
SMODS.Booster({
    object_type = "Booster",
    key = "brawlatro_megabox",
    kind = "Brawler",   
    atlas = "mega_box",
    pos = { x = 0, y = 0 },
    config = { extra = 4, choose = 1 },
    cost = 10,
    order = 3,
    weight = 9,
    
    create_card = function(self, card)
        return create_card("Brawler", G.pack_cards, nil, nil, true,  true, nil, "brawlatro_megabox")
    end,
    
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.BLUE)
        ease_background_colour({ new_colour = G.C.SET.PURPLE, special_colour = G.C.BLACK, contrast = 2 })
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
     
    loc_txt = {
        name = "Mega Box",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Brawlers{}",
        },
    },
    group_key = "BrawlatroMegaBox",
})