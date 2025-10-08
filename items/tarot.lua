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
	pos = {x=0, y= 0},
	atlas = "jujucurse",
    unlocked = true,
    discovered = true,
    cost = 4,

config = { extra = { voodoo = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.voodoo } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.voodoo, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("brawl_summoncurse")
                        card:set_eternal(true)
                        SMODS.add_card({ set = "Voodoo" })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit + 1
    end
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
	pos = {x=0, y= 0},
	atlas = "trunk",
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 2, mod_conv = 'm_brawl_dirty' },
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end

})