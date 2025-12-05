--Mega
SMODS.Atlas{
    key = 'mega_box',
    path = 'megabox.png',
    px = 148,
    py = 125,
}

SMODS.Booster{
    key = 'megabox_b',
    atlas = 'mega_box', 
    pos = { x = 0, y = 0 },
    discovered = true,
    draw_hand = false,
    config = { extra = 3, choose = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 4,
    cost = 5,
    kind = "BrawlPack",
    group_key = "k_brawl_megabox_booster",
    
    --ease_background_colour = function(self)
	--	ease_colour(G.C.DYN_UI.MAIN, HEX("ff0020"))
	--	ease_background_colour({ new_colour = HEX("ff0020"), special_colour = G.C.BLACK, contrast = 2 })
    --end,
    
    create_card = function(self, card, i)
        --ease_background_colour(HEX("1ab1ff"))
        return SMODS.create_card({
            set = "Brawler",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = fal,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}
--minibox
SMODS.Atlas{
    key = 'mini_box',
    path = 'box.png',
    px = 784,
    py = 794,
}

SMODS.Booster{
    key = 'minibox_b',
    atlas = 'mini_box', 
    pos = { x = 0, y = 0 },
    discovered = true,
    draw_hand = true,
    config = { extra = 3, choose = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 4,
    cost = 5,
    kind = "BrawlPack",
    group_key = "k_brawl_minibox_booster",
    
    ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.BLUE)
		ease_background_colour({ new_colour = G.C.BLUE, special_colour = G.C.BLACK, contrast = 2 })
    end,
    
    particles = function(self)
		G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
			timer = 0.015,
			scale = 0.1,
			initialize = true,
			lifespan = 3,
			speed = 0.2,
			padding = -1,
			attach = G.ROOM_ATTACH,
			colours = { G.C.WHITE, lighten(G.C.BLUE, 0.2) },
			fill = true,
		})
		G.booster_pack_sparkles.fade_alpha = 1
		G.booster_pack_sparkles:fade(1, 0)
	end,

    create_card = function(self, card, i)
        --ease_background_colour(HEX("1ab1ff"))
        return SMODS.create_card({
            set = "Gear",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = fal,
        })
    end,
    select_card = 'consumeables',

    in_pool = function() return true end
}