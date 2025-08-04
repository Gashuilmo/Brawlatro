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

SMODS.Atlas{
    key = 'gadgetinator',
    path = 'gadgetinator.png',
    px = 71,
    py = 95,
}
SMODS.Consumable {
    key = "gadgetinator",
    set = "Gear",
    object_type = "Consumable",
    name = "gadgetinator",
	pos = {x=0, y= 0},
    soul_pos = {x=1, y=0},
	order = 99,
	atlas = "gadgetinator",
    --pools = {["gear"]=true},
    unlocked = true,
    discovered = true,
    cost = 4,

    config = { extra = { max_highlighted = 1 }},
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local new_seal = SMODS.poll_seal({guaranteed = true, key = 'random'})
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(new_seal, true, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    can_use = function(self,card)
        if #G.hand.highlighted == card.ability.extra.max_highlighted then
            return true
        else
            return false
        end
    end
}

SMODS.Atlas{
    key = 'windblower',
    path = 'snowremoveridk.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "galewind", path = "gale_ulti_01.ogg", vol = 0.5})
SMODS.Consumable {
    key = "wind",
    set = "Gear",
    object_type = "Consumable",
    name = "wind",
	pos = {x=0, y= 0},
    soul_pos = {x=1, y=0},
	order = 99,
	atlas = "windblower",
    --pools = {["gear"]=true},
    unlocked = true,
    discovered = true,
    cost = 4,

    config = { extra = {}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
		G.FUNCS.draw_from_hand_to_discard()
		play_sound('brawl_galewind')
        for k, v in pairs(G.playing_cards) do
                    v.ability.wheel_flipped = nil
        end

		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.STATE = G.STATES.DRAW_TO_HAND
				G.deck:shuffle("gale" .. G.GAME.round_resets.ante)
				G.deck:hard_set_T()
				G.STATE_COMPLETE = false
				return true
			end,
		}))
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}