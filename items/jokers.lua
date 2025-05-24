--------Start of code
SMODS.current_mod.optional_features = function()
    return {
        retrigger_card = true,
        retrigger_joker = true,
        post_trigger = true,
        cardarea = {unscored = true,}
    }
end, 

--Browl
--SMODS.Atlas{
--    key = 'brawlstars',
--    path = 'brawlstars.png',
--    px = 71,
--    py = 95,
--}

--SMODS.Joker{
--    key = 'brawlstars',
--    loc_txt = {
--        name = 'Brawl Stars',
--        text = {
--          "Does nothing because i'm losing it",
--        }
--        --Will be change to xmult per brawl card in deck
--    },
--    atlas = 'brawlstars',
--    pos = { x = 0, y = 0 },
--    rarity = 1,
--    cost = 1,
--    pools = {["Brawlatro"]= true },
--    blueprint_compat=true,
--    eternal_compat=true,
--    unlocked = true,
--    discovered = true,
--    
--    pos = {x=0, y= 0},
--}

--Kenji
SMODS.Atlas{
    key = 'kenjisushi',
    path = 'kenjisushi.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key = "sushiroll", path = "kenji_lead_vo_01.ogg",})

SMODS.Joker{
    key = 'kenjisushi',
    loc_txt= {
        name = 'Fushi',
        text = { "Every {C:blue}consumable{} used",
               "add {X:chips,C:white}+#2#{} Chips.",
                "{C:inactive}Currently {C:blue}+#1# {C:inactive}Chips",
                },
        },
    atlas = 'kenjisushi',
    rarity = "brawl_legendary_brawler",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 5, additional = 5}},
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.additional } }
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
            return { message = "Sushi Time!", sound = "brawl_sushiroll", }
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
    loc_txt= {
        name = 'What Will It Be',
        text = {"Has a random chance to trigger",
                "different effects when" ,
                "playing cards.",
                --+ X10Mult
                --+20Chips
                --+5 Dollar
                --Minus X10Mult
                --Minus 20chips
                --Minus 5dollar
                --Nothing
                },
        },
    atlas = 'chesterjoker',
    rarity = "brawl_legendary_brawler",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {chips = 20, xmult = 3, money = 5 }}, 
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.xmult, center.ability.extra.money} }
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
    loc_txt= {
        name = 'Upgrade Module',
        text = { 
                "Upgrade {X:mult,C:white}X#2#{} Mult",
                "for every {C:attention}Boss Blind{}",
                "defeated this run.",
                "{C:inactive}Currently {C:red}x#1# {C:inactive}Mult",
                },
        },
    atlas = 'surged',
    rarity = "brawl_legendary_brawler",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x=0, y= 0},
    config = { extra = { surgemult = 2, increase = 2}},
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.surgemult, center.ability.extra.increase } }
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
    loc_txt= {
        name = 'Commando',
        text = { 
                "This Joker gains {C:red}+#2#{} Mult",
                "when a card is scored.",
                "{C:inactive}Currently {C:red}+#1# {C:inactive}Mult",
                },
        },
    atlas = 'commando',
    rarity = "brawl_mythic",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { Xmult = 1, additional = 0.25}},
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult, center.ability.extra.additional } }
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
                sound = "brawl_lobster",
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
--SMODS.Sound({key = "", path = "",})
SMODS.Joker{
    key = 'cheater',
    loc_txt= {
        name = 'Rule Bender',
        text = { 
                "Clearly you haven't read section 426",
                "subsection 98 division 4 under invisible ink.",
                "{C:dark_edition}+1{} {C:inactive}Hand size, Hands, Discards, Joker slot {}",
                "{C:inactive}and consumable slot{}",
                --"{C:inactive}and Shop slots{}",
                },
        },
    atlas = 'cheater',
    rarity = "brawl_ultra_legendary",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {  jokerslots = 1,h_size = 1, d_size =1, hand =1, slot = 1, highlighted = 1}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.jokerslots, center.ability.extra.h_size, center.ability.extra.d_size, center.ability.extra.hand,  center.ability.extra.hand,center.ability.extra.highlighted  }  }
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
    loc_txt= {
        name = 'Gris-Gris',
        text = { 
                "No Score ?",
		        "Get {C:money}20${} after defeating the curse",
                "Debuff last {C:attention}#3#{}/3 more rounds",
                },
        },
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

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.negativemult,center.ability.extra.negativechips, center.ability.extra.round, center.ability.extra.maxround}}
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
    loc_txt= {
        name = 'Gris-Gris2',
        text = { 
                "Baby Shark Doo Doo",
                "Get {C:money}20${} after defeating the curse",
                "Debuff last {C:attention}#2#{}/3 more rounds",
                },
        },
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

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.negativeXmult, center.ability.extra.round, center.ability.extra.maxround, center.ability.extra.dollars}}
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
    loc_txt= {
        name = 'Gris-Gris3',
        text = { 
                "2008 is back in the menu",
                "Get {C:money}20${} after defeating the curse",
                "Debuff last {C:attention}#2#{}/3 more rounds",
                },
        },
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

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.percent, center.ability.extra.round,center.ability.extra.maxround, center.ability.extra.dollars}}
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
    loc_txt= {
        name = 'Nita',
        text = {"Every {C:attention}#3#{} scoring card",
                "summon one {C:brown}Bruce{}" ,
                "{C:inactive}Currently #4# scoring card left{}",
                "Gain {X:mult,C:white}X#1#{} Mult per Bruce active{}",
                "{C:inactive}Currently {X:mult,C:white}X#2#{} Mult {}",
                },
        },
    atlas = 'shaman',
    rarity = "brawl_rare",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {xmult = 1, xmulttotal = 1, hands = 10, hands_remaining = 10}}, 
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xmult, center.ability.extra.xmulttotal, center.ability.extra.hands, center.ability.extra.hands_remaining} }
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
            color = G.C.RED,
            message = "x".. card.ability.extra.xmulttotal,
            Xmult_mod = card.ability.extra.xmulttotal
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
    loc_txt= {
        name = 'Bruce',
        text = {"I'm a bear",
        "I have {C:attention}#2#{}/3 round left to live",
                },
        },
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

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.jokerslots, center.ability.extra.round, center.ability.extra.maxround }  }
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
    loc_txt= {
        name = 'Jae-Yong',
        text = {"Switch between 2 modes every round",
                "Work mode : {X:chips,C:white,E:2}X#1#{} Chips",
                "Party mode : {X:mult,C:white,E:1}X#2#{} Mult",
                "Currently {C:attention}#4#{} mode",
                --"Switch = #3#",
                },
        },
    atlas = 'jae_yong',
    rarity = "brawl_mythic",
    cost = 1,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { xchip = 1.5, xmult= 1.5, switch = 0, work = "Work", party = "Party", mode ="there is no" }},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xchip, center.ability.extra.xmult, center.ability.extra.switch, center.ability.extra.mode, center.ability.extra.work, center.ability.extra.party }  }
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
--------End of code