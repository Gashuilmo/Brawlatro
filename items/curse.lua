--JuJu (going to be a long one) 
SMODS.Atlas{
    key = "JuJuDoll",
    path = 'curse.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "defeatcurse", path = "bs_juju_getshurt_002_04.ogg"})
SMODS.Consumable{
    key = "JujuDoll",
    atlas = 'JuJuDoll',
    
    cost = 1,
    pools = {["Grisgris"]=true},
    set = "Voodoo",

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {negativemult = 0.5, negativechips = 0.5, round = 0, maxround = 3}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.negativemult,card.ability.extra.negativechips, card.ability.extra.round, card.ability.extra.maxround}}
	end,

    add_to_deck = function(self, card, from_debuff)
    card.ability.eternal = true
    end,

    calculate = function(self, card, context)

		if context.joker_main then
            return {
                message_card = card,
                xmult = card.ability.extra.negativemult,
                xchips = card.ability.extra.negativechips,
                message = "The curse weights on you",
                }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round >= card.ability.extra.maxround then 
            ease_dollars(20)
            card:start_dissolve({G.C.RED})
            card = nil 
            return {    
            play_sound("brawl_defeatcurse")
            }
            end
        end
    end,
}
SMODS.Sound {
    key = "music_grisgris",
    path = "babyshark_menu.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        return next(SMODS.find_card("c_brawl_JujuDoll2", true))
    end, 
}
SMODS.Consumable{
    key = "JujuDoll2",
    atlas = 'JuJuDoll',

    cost = 0,
    pools = {["Grisgris"]=true},
    set = "Voodoo",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {negativemult = 0.75, round = 0, maxround = 3, dollars = 20}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.negativeXmult, card.ability.extra.round, card.ability.extra.maxround, card.ability.extra.dollars}}
	end,

    add_to_deck = function(self, card, from_debuff)
    card.ability.eternal = true
    end,
    calculate = function(self, card, context)
		if context.joker_main then
            return {
                message = "Baby Shark Doo Doo",
                message_card = card,
                }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round >= card.ability.extra.maxround then 
            ease_dollars(20)
            card:start_dissolve({G.C.RED})
            card = nil 
            return {    
            play_sound("brawl_defeatcurse")
            }
            end
        end
end
}

SMODS.Consumable{
    key = "JujuDoll3",
    atlas = 'JuJuDoll',
    
    cost = 1,
    pools = {["Grisgris"]=true},
    set = "Voodoo",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {percent = -15,  round = 0, maxround = 3, dollars = 24}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.percent, card.ability.extra.round,card.ability.extra.maxround, card.ability.extra.dollars}}
	end,

    add_to_deck = function(self, card, from_debuff)
    G.GAME.discount_percent = card.ability.extra.percent
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
    card.ability.eternal = true
    end,
    remove_from_deck = function(self, card, from_debuff)
    G.GAME.discount_percent = -card.ability.extra.percent
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end        
    end,

    calculate = function(self, card, context)

    if context.card_added then
        card.ability.eternal = true
    end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round >= card.ability.extra.maxround then 
            ease_dollars(24)
            card:start_dissolve({G.C.RED})
            card = nil 
            return {    
            play_sound("brawl_defeatcurse")
            }
            end
        end
    end,
}