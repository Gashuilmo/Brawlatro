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

--Mandy
SMODS.Atlas{
    key = 'brawl_mandycrush',
    path = 'mandy.png',
    px = 71,
    py = 95,
}
SMODS.Consumable({
    key = "mandycrush",
    set = "Gear",
    object_type = "Consumable",
    name = "mandycrush",
	pos = {x=0, y= 0},
	order = 99,
	atlas = "mandycrush",
    unlocked = true,
    discovered = true,
    --pools = {["Tarot"]=true},
    cost = 4,
    config = { extra = { destroy = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}
        for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
        table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
        pseudoshuffle(temp_hand, pseudoseed('mandy'))
        for i = 1, 3 do destroyed_cards[#destroyed_cards+1] = temp_hand[i] end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local _card = destroyed_cards[i]
                    if SMODS.shatters(_card) then
                        _card:shatter()
                    else
                        _card:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true end }))
        delay(0.5)
        SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
})