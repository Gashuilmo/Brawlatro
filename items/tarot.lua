--Juju
SMODS.Atlas{
    key = 'brawl_jujucurse',
    path = 'curse.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "summoncurse", path = "juju_summon_01.ogg"})
SMODS.Consumable({
    key = "brawl_jujucurse",
    set = "Tarot",
    object_type = "Consumable",
    name = "jujucurse",
	pos = {x=0, y= 0},
	order = 99,
	atlas = "jujucurse",
    --pools = {["Tarot"]=true},
    unlocked = true,
    discovered = true,
    cost = 4,

use = function(self, card, area, copier)
        local card = create_card("Grisgris", G.Jokers, nil, nil, nil, nil, nil, 'jujucurse')
        card:add_sticker("eternal", true)
        card:add_to_deck()
        --card:set_edition("e_negative",true)
        G.jokers:emplace(card)
        play_sound("brawl_summoncurse")
        --card:start_materialize()
    end,
can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit then
            return true
        end
	end,
})

SMODS.Atlas{
    key = 'brawl_trunk',
    path = 'curse.png',
    px = 71,
    py = 95,
}
SMODS.Consumable({
    key = "brawl_trunk",
    set = "Tarot",
    object_type = "Consumable",
    name = "trunk",
	pos = {x=0, y= 0},
	order = 99,
	atlas = "trunk",
    --pools = {["Tarot"]=true},
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 2, mod_conv = 'm_brawl_dirty' },
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end

})