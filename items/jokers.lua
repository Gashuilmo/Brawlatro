--------Start of code
SMODS.current_mod.optional_features = function()
    return {
        retrigger_card = true,
        retrigger_joker = true,
        post_trigger = true,
        cardarea = {unscored = true,}
    }
end, 

--Kenji
SMODS.Atlas{
    key = 'kenjisushi',
    path = 'kenjisushi.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "sushiroll", path = "kenji_lead_vo_01.ogg",})
SMODS.Joker{
    key = 'buffet',
    atlas = 'kenjisushi',
    rarity = 1,
    cost = 5,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 5, additional = 5}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.additional } }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = "+".. card.ability.extra.chips,
				chip_mod = card.ability.extra.chips
			}
        end
        if context.using_consumeable then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.additional
            return { message = "Sushi Time!", 
            --sound = "brawl_sushiroll", 
            }
        end
    end
}

--Chester
SMODS.Atlas{
    key = 'chesterjoker',
    path = 'chester.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "startgambling", path = "chester_ulti_vo_02.ogg",})
SMODS.Sound({key = "chesterlol", path = "chester_ulti_vo_08.ogg",})
SMODS.Joker{
    key = 'chesterjoker',
    --+ X10Mult
    --+20Chips
    --+5 Dollar
    --Minus X10Mult
    --Minus 20chips
    --Minus 5dollar
    --Nothing
    atlas = 'chesterjoker',
    rarity = 2,
    cost = 3,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 20, xmult = 3, money = 5 }}, 
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.xmult, card.ability.extra.money} }
	end,

    calculate = function(self, card, context)
		if context.setting_blind then
            return {
                message = "What will it be !",
                sound = "brawl_startgambling"
            }
        end
        if context.individual and context.cardarea == G.play then
            if math.random(100) <= 24 then
                return {
                    mult = card.ability.extra.xmult,
                    message = "X".. card.ability.extra.xmult,
                }
            elseif math.random(100) <= 30 then
                return {
                    chip_mod = card.ability.extra.chips,
                    message = "+" .. card.ability.extra.chips   
                }
            elseif math.random(100) <= 26 then
                return {
                    dollars = card.ability.extra.money, 
                }
            elseif math.random(100) <= 13 then
                return {
                    mult = -card.ability.extra.xmult,
                    message = "/".. card.ability.extra.xmult,
                }
             elseif math.random(100) <= 15 then
                return {
                    chip_mod = -card.ability.extra.chips,
                    message = "-" .. card.ability.extra.chips,  
                }
            elseif math.random(100) <= 14 then
                return {                
                    dollars = -card.ability.extra.money,
                }
            elseif context.individual and context.cardarea == G.play then
               return { message = "Lol !",
                        sound = "brawl_chesterlol"
                } 
            end
        end
    end
}

--Surge
SMODS.Atlas{
    key = 'surged',
    path = 'surge.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "surged", path = "surge_ulti_01.ogg"})
SMODS.Joker{
    key = 'surged',
    atlas = 'surged',
    rarity = 3,
    cost = 6,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x=0, y= 0},
    config = { extra = { surgemult = 2, increase = 2}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.surgemult, card.ability.extra.increase } }
	end,

    calculate = function(self, card, context)
        if context.joker_main then
			return {
				xmult = card.ability.extra.surgemult,
			}
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.surgemult = card.ability.extra.surgemult + card.ability.extra.increase
            return {
                    message = "Upgrade !",
                    message_card = card,
                    sound = "brawl_surged"
                }
        end
    end 
}

--Clancy
SMODS.Atlas{
    key = 'commando',
    path = 'clancy.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "lobster", path = "clancy_ulti_vo_09.ogg", vol =0.1})
SMODS.Joker{
    key = 'commando',
    atlas = 'commando',
    rarity = 2,
    cost = 4,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { Xmult = 1, additional = 0.25}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.additional } }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then 
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.additional
            return {
                    message = 'Upgrade!',
                    message_card = card
                }
        end
		if context.joker_main then
			return {
                Xmult_mod = card.ability.extra.Xmult,
                message = '+'.. card.ability.extra.Xmult,
                colour = G.C.MULT,
                message_card = card,
                --sound = "brawl_lobster",
			}
        end
    end 
}

--Meeple
SMODS.Atlas{
    key = 'cheater',
    path = 'meeple.png',
    px = 241,
    py = 323,
}
SMODS.Joker{
    key = 'cheater',
    atlas = 'cheater',
    rarity = 4,
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {  jokerslots = 1, h_size = 1, d_size =1, hand =1, slot = 1, highlighted = 1}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.jokerslots, card.ability.extra.h_size, card.ability.extra.d_size, card.ability.extra.hand,  card.ability.extra.hand,card.ability.extra.highlighted  }  }
	end,

     add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand
        ease_hands_played(card.ability.extra.hand)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
        G.hand:change_size(card.ability.extra.h_size)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot
        G.GAME.shop.joker_max = G.GAME.shop.joker_max + card.ability.extra.slot
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.highlighted
        SMODS.change_booster_limit(1)
		SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand
        ease_hands_played(-card.ability.extra.hand)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
        G.hand:change_size(-card.ability.extra.h_size)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot
        G.GAME.shop.joker_max = G.GAME.shop.joker_max - card.ability.extra.slot
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit -  card.ability.extra.highlighted
        SMODS.change_booster_limit(-1)
		SMODS.change_voucher_limit(-1)
    end,

calculate = function(self, card, context)
    if context.starting_shop then
            G.shop:recalculate()
    end 
end,
}

--JuJu (going to be a long one) 
SMODS.Atlas{
    key = 'grisgris',
    path = 'curse.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "defeatcurse", path = "bs_juju_getshurt_002_04.ogg"})
SMODS.Joker{
    key = 'grisgris',
    atlas = 'grisgris',
    rarity = "brawl_cursed",
    cost = 1,
    pools = {["Grisgris"]=true},

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
    path = "skateboard_menu.ogg",
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
        return next(SMODS.find_card("j_brawl_grisgris2", true))
    end, 
}
SMODS.Joker{
    key = 'grisgris2',
    atlas = 'grisgris',
    rarity = "brawl_cursed",
    cost = 1,
    pools = {["Grisgris"]=true},

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
    end,
}

SMODS.Joker{
    key = 'grisgris3',
    atlas = 'grisgris',
    rarity = "brawl_cursed",
    cost = 1,
    pools = {["Grisgris"]=true},

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
    end,
    remove_from_deck = function(self, card, from_debuff)
G.GAME.discount_percent = -card.ability.extra.percent
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end        
    end,
    calculate = function(self, card, context)
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

--Nita and Bruce(s)
SMODS.Sound{ key = "death", path = "death.ogg",}
SMODS.Sound{ key = "summon_bruce", path = "nita_bear_spawn_01.ogg",}

SMODS.Atlas{
    key = 'shaman',
    path = 'nita.png',
    px = 71,
    py = 95,
}
SMODS.Joker{
    key = 'shaman',
    atlas = 'shaman',
    rarity = 3,
    cost = 6,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal = 1, hands = 14, hands_remaining = 14}}, 
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmulttotal, card.ability.extra.hands, card.ability.extra.hands_remaining} }
	end,
calculate = function(self, card, context )
    brucecount = 1
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Bruce then
            brucecount = brucecount + 1
        end
    end
    card.ability.extra.xmulttotal = brucecount * card.ability.extra.xmult
    if context.individual and context.cardarea == G.play and not context.blueprint then
            if card.ability.extra.hands_remaining <= 1 then
                card.ability.extra.hands_remaining = card.ability.extra.hands
                --card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    play_sound ("brawl_summon_bruce"),
                    --colour = G.C.RED,
                    SMODS.add_card({key = "j_brawl_bruce", stickers = {"eternal"}}),
                }
            else
                return {
                    func = function()
                        card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
                    end
                }
    end
end 
    if context.joker_main then
        return {
            --color = G.C.RED,
            --message = "x".. card.ability.extra.xmulttotal,
            xmult = card.ability.extra.xmulttotal
        }
    end
end,
}

SMODS.Atlas{
    key = 'bruce',
    path = 'bruce.png',
    px = 71,
    py = 95,
}
SMODS.Joker{
    key = 'bruce',
    atlas = 'bruce',
    rarity = "brawl_bruce",
    cost = 1,
    pools = {["Bruce"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { jokerslots = 1, round = 0, maxround = 3}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.jokerslots, card.ability.extra.round, card.ability.extra.maxround }  }
	end,

     add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
    end,

    calculate = function(self, card, context)

        if context.setting_blind and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round >= card.ability.extra.maxround then 
            card:start_dissolve({G.C.RED})
            card = nil
            return {    
            play_sound ("brawl_death"),
            }
            end
        end
    end
}
--Jae-Yong
SMODS.Atlas{
    key = 'jae_yong',
    path = 'jaeyong.png',
    px = 71,
    py = 95,
}
--SMODS.Sound { key = "music_jae_speed", path = "skateboard_menu.ogg", sync = { ['music1'] = true, ['music2'] = true, ['music3'] = true, ['music4'] = true, ['music5'] = true, , pitch = 1, vol = 0.5, select_music_track = function(self, card) return next(SMODS.find_card("jae_yong", true)) end, } }
--SMODS.Sound { key = "music_jae_heal", path = "skateboard_menu.ogg", sync = { ['music1'] = true, ['music2'] = true, ['music3'] = true, ['music4'] = true, ['music5'] = true, , pitch = 1, vol = 0.5, select_music_track = function(self, card) return next(SMODS.find_card("jae_yong", true)) end, } }
SMODS.Sound({ key = "party_mode", path = "jae_speed_ulti_vo_06.ogg",})
SMODS.Sound({ key = "party_mode_effect", path = "jae_healing_mode_01.ogg", vol = 0.5})
SMODS.Sound({ key = "work_mode", path = "jae_speed_ulti_vo_04.ogg",})
SMODS.Sound({ key = "work_mode_effect", path = "jae_speed_mode_01.ogg",vol = 0.5})

SMODS.Joker{
    key = 'jae_yong',
    atlas = 'jae_yong',
    rarity = 2,
    cost = 4,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    soul_pos = {x=1, y=0},
    config = { extra = { xchip = 1.5, xmult= 1.5, switch = 0, work = "Work" , party = "Party", mode ="there is no" }},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchip, card.ability.extra.xmult, card.ability.extra.switch, card.ability.extra.mode, card.ability.extra.work, card.ability.extra.party }  }
	end,

    calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        if card.ability.extra.switch == 0 then
            card.ability.extra.switch = card.ability.extra.switch + 1
            card.ability.extra.mode = card.ability.extra.work
            return {
                play_sound("brawl_work_mode"),
                play_sound("brawl_work_mode_effect"),
                message = "Show me some energy !",
                G.C.MULT,
                message_card = card,
            }
        elseif card.ability.extra.switch == 1 then
            card.ability.extra.switch = card.ability.extra.switch - 1
            card.ability.extra.mode = card.ability.extra.party
            return {
                play_sound("brawl_party_mode"),
                play_sound("brawl_party_mode_effect"),
                message = "Party time !",
                G.C.CHIPS,
                message_card = card,
            }
        end
    end
    if context.joker_main then
        if card.ability.extra.switch == 0 then
            return {
                xchips = card.ability.extra.xchip,
            } 
        elseif  card.ability.extra.switch == 1 then
            return {
                xmult = card.ability.extra.xmult,
            } 
        end
    end
end
}
--Belle
SMODS.Atlas{
    key = 'activator',
    path = 'brawlstars.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'activator',
    atlas = 'activator',
    rarity = 3,
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    config = { extra = {xmult = 2, additional = 2 }},
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = "brawl_tooltip_gadget"}
		return { vars = { card.ability.extra.xmult, card.ability.extra.additional}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == 'brawl_gadget' then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.additional
                return {message_card = card, message = "Upgraded!"}
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

--Colette
SMODS.Atlas{
    key = 'collector',
    path = 'colette.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'colette',
    atlas = 'collector',
    rarity = 3,
    cost = 6,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal=1}},

    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue + 1] = {set = 'Other', key = "brawl_tooltip_brawler"}
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmulttotal, }  }
	end,

    calculate = function(self, card, context)
    Brawlcount = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Brawler then
            Brawlcount = Brawlcount + 1
        end
    end
    card.ability.extra.xmulttotal = Brawlcount * card.ability.extra.xmult
    if context.joker_main then
        return {
            color = G.C.RED,
            message = "x".. card.ability.extra.xmulttotal,
            Xmult_mod = card.ability.extra.xmulttotal
        }
    end
end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}

--Griff
SMODS.Atlas{
    key = 'griff',
    path = 'griff.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'debt',
    atlas = 'griff',
    rarity = 3,
    cost = 7,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = {chip = 1, chiptottal = 0, moneyspent = 0 }},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip,card.ability.extra.chiptottal, card.ability.extra.moneyspent }  }
	end,

    calculate = function(self, card, context)
        if context.brawl_ease_dollars and context.brawl_ease_dollars < 0 and not context.blueprint and not context.repetition then
                card.ability.extra.moneyspent = card.ability.extra.moneyspent + (-context.brawl_ease_dollars)
                card.ability.extra.chiptottal = card.ability.extra.chiptottal + (-context.brawl_ease_dollars * 2)
            end
        
        if context.joker_main then
                return {
                    chips = card.ability.extra.chiptottal,
                    message_card = card,
                }
            end
    end
}
--How to count the money decreeasing
local base_ease_dollars = ease_dollars
function ease_dollars(mod, x)
    base_ease_dollars(mod, x)

    SMODS.calculate_context({brawl_ease_dollars = mod})
end
--Leaving it here cuz why not

--Moe
SMODS.Atlas{
    key = 'drill',
    path = 'moe.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'tunnelrat',
    atlas = 'drill',
    rarity = 3,
    cost = 7,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = { chip = 0, chipdrilled = 25 } },
    enhancement_gate = 'm_stone',
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = { card.ability.extra.chip , card.ability.extra.chipdrilled }
        }
end,
  
calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and not context.blueprint then
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
            if not context.other_card.debuff then 
            card.ability.extra.chip = card.ability.extra.chip + card.ability.extra.chipdrilled
            return {message = "Drilled", colour = G.C.CHIPS,}
            end
        end
    end

    if context.destroy_card and context.cardarea == G.play and SMODS.has_enhancement(context.destroy_card, "m_stone") then
        --card:start_dissolve({G.C.RED})
        --card = nil
        return { --message = "Drilled",
                    --colour = G.C.CHIPS,
                    remove = true, }
    end
    if context.joker_main then
        return {
            chips = card.ability.extra.chip,
            message_card = card,
            colour = G.C.CHIPS,      
        }
	end
end
}

--------End of code