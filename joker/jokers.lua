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
            return { message = localize("sushi_time"),}
        end
    end

    --joker_display_def = function(JokerDisplay)
	--	return {
	--		text = {
	--			{ text = "+", colour = G.C.MULT },
	--			{ ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.MULT },
	--		},
	--	}
	--end,

    
}

--Chester
SMODS.Atlas{
    key = 'chesterjoker',
    path = 'chester.png',
    px = 71,
    py = 95,
}
SMODS.Sound({key = "startgambling", path = "chester_ulti_vo_02.ogg",})
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
            play_sound("brawl_startgambling",1,0.5)
            return {
                message = "What will it be !",
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
               return { message = "Lol !",} 
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
            play_sound("brawl_surged",1,0.5)
            return {
                    message = "Upgrade !",
                    message_card = card,
                }
        end
        if card.ability.extra.surgemult == 12 and context.end_of_round then
            check_for_unlock({ type = "power_12" })
        return true
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
SMODS.Sound({key = "levelup", path = "clancy_level_up.ogg"})
SMODS.Joker{
    key = 'commando',
    atlas = 'commando',
    rarity = 3,
    cost = 4,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = { Token = 0, additional = 1, stage = 1, stage_levelup = 45, mult = 5, ach_check = 0 }},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Token, card.ability.extra.additional, card.ability.extra.stage, card.ability.extra.stage_levelup, card.ability.extra.mult, card.ability.extra.ach_check}, key = card.ability.extra.stage == 3 and "j_brawl_commando_alt" or nil}    
	end,

    calculate = function(self, card, context)
        
        if card.ability.extra.stage == 1 then
            if context.individual and context.cardarea == G.play then 
               card.ability.extra.Token = card.ability.extra.Token + card.ability.extra.additional
            end
        end
        if context.joker_main and card.ability.extra.stage == 1 then
                if card.ability.extra.Token >= card.ability.extra.stage_levelup then
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        card.children.center:set_sprite_pos({x= 1 ,y= 0})
                        SMODS.calculate_effect({message = localize('k_stage2'),colour = G.C.RED}, card)
                        play_sound("brawl_levelup", 1, 0.5)
                        return true
                    end
                    }))
                    card.ability.extra.Token = card.ability.extra.Token - card.ability.extra.stage_levelup
                    card.ability.extra.stage = card.ability.extra.stage + 1
                    card.ability.extra.stage_levelup = card.ability.extra.stage_levelup * 2
                    card.ability.extra.mult = card.ability.extra.mult * 2
                end
        end

        if card.ability.extra.stage == 2 then
            if context.individual and context.cardarea == G.play then 
                card.ability.extra.Token = card.ability.extra.Token + card.ability.extra.additional
            end
        end
        if context.joker_main and card.ability.extra.stage == 2 then
                if card.ability.extra.Token >= card.ability.extra.stage_levelup then
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        card.children.center:set_sprite_pos({x= 2 ,y= 0})
                        SMODS.calculate_effect({message = localize('k_stage3'),colour = G.C.RED}, card)
                        play_sound("brawl_levelup", 1, 0.5)
                        return true
                    end
                    }))
                    card.ability.extra.Token = card.ability.extra.Token - card.ability.extra.stage_levelup
                    card.ability.extra.stage_levelup = card.ability.extra.stage_levelup * 2
                    card.ability.extra.stage = card.ability.extra.stage + 1
            end
        end

        if card.ability.extra.stage == 3 then
            if context.individual and context.cardarea == G.play then 
                card.ability.extra.Token = card.ability.extra.Token + card.ability.extra.additional
            end
        end

        if card.ability.extra.Token >= 4 and card.ability.extra.mult == 0 then
            check_for_unlock({ type = "WAR" })
            card.ability.extra.mult = 1
        return true
        end --THE FUCKING COLLABS AND BALANCE THOSE DAMN HYPERCHARGES

    if card.ability.extra.stage == 1 then
		if context.joker_main then
			return {
                mult = card.ability.extra.mult,
			}
        end
    end 
    if card.ability.extra.stage == 2 then
		if context.joker_main then
			return {
                mult = card.ability.extra.mult,
			}
        end
    end

    if card.ability.extra.stage == 3 then
		if context.joker_main then
			return {
                xmult = 10,
                xchips = 10,
			}
        end
    end 
end
}

--Meeple
SMODS.Atlas{
    key = 'cheater',
    path = 'meeple.png',
    px = 71,
    py = 95,
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
                    play_sound("brawl_summon_bruce",1,0.5),
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
            play_sound("brawl_death"),
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
SMODS.Sound({ key = "party_mode", path = "jae_speed_ulti_vo_06.ogg",})
SMODS.Sound({ key = "party_mode_effect", path = "jae_healing_mode_01.ogg"})
SMODS.Sound({ key = "work_mode", path = "jae_speed_ulti_vo_04.ogg",})
SMODS.Sound({ key = "work_mode_effect", path = "jae_speed_mode_01.ogg"})

SMODS.Joker{
    key = 'JaeYong',
    atlas = 'jae_yong',
    rarity = 2,
    cost = 3,
    pools = {["Brawler"]=true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x=0, y= 0},
    soul_pos = {x=1, y=0},
    config = { extra = { xchip = 1.5, xmult= 1.5, switch = 0, mode = localize("k_mode"), afterparty = 0}},

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchip, card.ability.extra.xmult, card.ability.extra.switch, card.ability.extra.mode, card.ability.extra.afterparty}} 
	end,

    calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        if card.ability.extra.switch == 0 then
            card.ability.extra.switch = card.ability.extra.switch + 1
            card.ability.extra.mode = localize("k_work")
            card.ability.extra.afterparty = card.ability.extra.afterparty + 1
            return {
                play_sound("brawl_work_mode", 1 , 0.5),
                play_sound("brawl_work_mode_effect", 1 , 0.5),
                message = localize("k_brawl_worktime"),
                colour = G.C.MULT,
                message_card = card,
            }
        elseif card.ability.extra.switch == 1 then
            card.ability.extra.switch = card.ability.extra.switch - 1
            card.ability.extra.mode = localize("k_brawl_partytime")
            card.ability.extra.afterparty = card.ability.extra.afterparty + 1
            return {
                play_sound("brawl_party_mode", 1 , 0.5),
                play_sound("brawl_party_mode_effect", 1 , 0.5),
                message = localize("k_party"),
                colour = G.C.CHIPS,
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
    if card.ability.extra.afterparty == 14 then
            check_for_unlock({ type = "afterparty" })
        return true
    end
end
}
--Gadget
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
    --pools = {["Brawler"]=true},

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
        info_queue[#info_queue + 1] = {set = 'Other', key = "brawl_tooltip_brawler"}
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
    soul_pos = {x=1, y=0},
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
        if card.ability.extra.moneyspent >= 17765 then
            check_for_unlock({ type = "coins" })
        return true
        end
    end
}

local base_ease_dollars = ease_dollars
function ease_dollars(mod, x)
    base_ease_dollars(mod, x)

    SMODS.calculate_context({brawl_ease_dollars = mod})
end


--Carl killed Moe
SMODS.Atlas{
    key = 'drill',
    path = 'moe.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'carlpick',
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
    config = { extra = { chip = 0, chipdrilled = 25, chisel = 0 } },
    enhancement_gate = 'm_stone',
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = { card.ability.extra.chip , card.ability.extra.chipdrilled, card.ability.extra.chisel }
        }
end,
  
calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and not context.blueprint then
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
            if not context.other_card.debuff then 
            card.ability.extra.chip = card.ability.extra.chip + card.ability.extra.chipdrilled
            card.ability.extra.chisel = card.ability.extra.chisel + card.ability.extra.chipdrilled
            return {message = "Drilled", colour = G.C.CHIPS,}
            end
        end
    end
    if context.destroy_card and context.cardarea == G.play and SMODS.has_enhancement(context.destroy_card, "m_stone") then
        if card.ability.extra.chip >= 50 then
            check_for_unlock({ type = "rat" })
        return true end    
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

--Pearl
SMODS.Atlas{
    key = 'pearlsheet',
    path = 'pearl.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'oven',
    atlas = 'pearlsheet',
    rarity = 2,
    cost = 7,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = { prepare = 0, unleash = 0 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = "brawl_tooltip_click"}
        return { vars = { card.ability.extra.prepare,card.ability.extra.unleash } }

    end,
    calculate = function(self, card, context)
        if context.card_clicked == card then
            if card.ability.extra.prepare == 0 then
            card.ability.extra.prepare = card.ability.extra.prepare + 1
            elseif card.ability.extra.prepare == 1 then
            card.ability.extra.prepare = card.ability.extra.prepare - 1
            end
        end

        if card.ability.extra.prepare == 0 then
            if card.ability.extra.unleash <= 95 then
            card.children.center:set_sprite_pos({x= 0 ,y= 0})
            elseif card.ability.extra.unleash == 100 then
            card.children.center:set_sprite_pos({x= 0 ,y= 1})
            end
        end
        if card.ability.extra.prepare == 1 then
            if card.ability.extra.unleash <= 95 then
            card.children.center:set_sprite_pos({x= 1 ,y= 0})
            elseif card.ability.extra.unleash == 100 then
            card.children.center:set_sprite_pos({x= 1 ,y= 1})
            end
        end


        if context.individual and context.cardarea == G.play and not context.blueprint then
            if card.ability.extra.prepare == 0 then 
                if card.ability.extra.unleash == 100 then
                    return true
                elseif card.ability.extra.unleash <= 100 then
                card.ability.extra.unleash = card.ability.extra.unleash + 10
                end
            end
        end

        if context.joker_main then
            if card.ability.extra.prepare == 1 and card.ability.extra.unleash >= 10 then
            return { mult = card.ability.extra.unleash}
            end
        end

        if context.post_trigger and context.other_card.config.center.key == 'j_brawl_oven' and card.ability.extra.prepare == 1 then
            card.ability.extra.unleash = card.ability.extra.unleash - card.ability.extra.unleash
        end
    end
}

local cardClick = Card.click
function Card:click()
    if self.area and self.area == G.jokers then
        SMODS.calculate_context({card_clicked = self})
    end
    local ret = cardClick(self)
    return ret
end

--Mina
SMODS.Atlas{
    key = 'combo',
    path = 'combobrazil.png',
    px = 71 ,
    py = 95,
}

SMODS.Joker{
    key = 'brazil',
    atlas = 'combo',
    rarity = 2,
    cost = 5,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = { mult = 10, previous_hand = "None", combo = 0}},
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult,center.ability.extra.previous_hand, center.ability.extra.combo}}
    end,
    calculate = function(self,card,context)

        if card.ability.extra.combo == 0 then
            card.children.center:set_sprite_pos({x= 0 ,y= 0})
        end
        if card.ability.extra.combo == 1 then
            card.children.center:set_sprite_pos({x= 1 ,y= 0})
        end
        if card.ability.extra.combo == 2 then
            card.children.center:set_sprite_pos({x= 2 ,y= 0})
        end

        if context.before then
            if card.ability.extra.previous_hand == "None" then
                card.ability.extra.combo = card.ability.extra.combo + 1

                card.ability.extra.previous_hand = G.GAME.last_hand_played
                return {
                    card = card,
                    message = "Move it",
                    colour = G.C.MULT
                }

            elseif G.GAME.last_hand_played == card.ability.extra.previous_hand then
                card.ability.extra.combo = card.ability.extra.combo + 1

                card.ability.extra.previous_hand = G.GAME.last_hand_played
                return {
                    card = card,
                    message = 'Yeah !',
                    colour = G.C.MULT
                }

            elseif G.GAME.last_hand_played ~= card.ability.extra.previous_hand then
                card.ability.extra.combo = 0

                card.ability.extra.previous_hand = "None"
                return {
                    card = card,
                    message = 'Oh ...',
                    colour = G.C.MULT
                }
            end  
            card.ability.extra.previous_hand = G.GAME.last_hand_played   
        end

        if context.joker_main then
            if card.ability.extra.combo == 3 then
                card.ability.extra.combo = card.ability.extra.combo - 3
            return {
                card = card,
                mult = card.ability.extra.mult,
                message = "Stylish !",
                colour = G.C.MULT
            }
            end
        end
    end
}

-- 8-Bit
SMODS.Atlas{
    key = 'sauropod',
    path = 'doug.png',
    px = 800 ,
    py = 800,
}
SMODS.Joker{
    key = 'hotdoug',
    atlas = 'sauropod',
    rarity = 4,
    cost = 8,
    pools = {["Brawler"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    pos = {x=0, y= 0},
    config = { extra = { pity = 3 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.pity }  }
    end,

    calculate = function(self, card, context)

        --if G.GAME.current_round.hands_left  == 0 then
        --    play_sound("revive",1,1)
        --card.children.center:set_sprite_pos({x= 0 ,y= 1})
        --end

        local current_score = G.GAME.chips
        local blind_score = G.GAME.blind.chips

        local currChips =  hand_chips
        local currMult = mult

        local score_diff_out_of_100 = (current_score / blind_score) * 100

    if G.GAME.current_round.hands_left  == 1 then
        if score_diff_out_of_100 <= 50 then
            if context.joker_main then
                return {
                    xchips = card.ability.extra.pity
                }
            end
        end
    end
    
    if G.GAME.current_round.hands_left  == 0 then
        if score_diff_out_of_100 <= 75 then
            if currChips > currMult then 
                if context.joker_main then
                    return {
                        xchips = card.ability.extra.pity * 2
                    }
                end
            elseif currMult >= currChips then
                if context.joker_main then
                    return {
                        xmult = card.ability.extra.pity * 2
                    }
                end
            end
        end
    end 

end
}

--------End of code