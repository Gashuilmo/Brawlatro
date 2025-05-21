--Juju
SMODS.Atlas{
    key = 'jujucurse',
    path = 'curse.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "summoncurse", path = "juju_summon_01.ogg"})
SMODS.Consumable({
    key = "brawlatro_jujucurse",
    set = "Tarot",
    object_type = "Consumable",
    name = "jujucurse",
    loc_txt = {
        name = "Curse Of Juju",
        text={
        "The curse of Juju may be rewarding ...",
        "Or not !",
        "{C:inactive}(Must have room to spawn Gris-Gris){}",
        },
    },
	pos = {x=0, y= 0},
	order = 99,
	atlas = "jujucurse",
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