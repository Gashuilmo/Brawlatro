-- Hot-Doug
SMODS.Atlas{
    key = 'sauropod',
    path = 'doug.png',
    px = 71 ,
    py = 95,
}

SMODS.Sound({ key = "doug_res", path = "doug_dog_appear_01.ogg",})
SMODS.Sound({ key = "revive", path = "doug_revive_01.ogg",})

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
    
    pos = {x=1, y= 0},
    soul_pos = {x=1, y=1},
    config = { extra = { pity = 10, hotdawg = 0, saved = 0 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.pity }  }
    end,

    calculate = function(self, card, context)

        if G.GAME.current_round.hands_left  == 1 and card.ability.extra.hotdawg == 0 then
            card:juice_up(0.3, 0.5)
            play_sound("brawl_doug_res",1.25,0.5)
            card.ability.extra.hotdawg = card.ability.extra.hotdawg + 1
        card.children.center:set_sprite_pos({x= 0 ,y= 1})
        card.children.floating_sprite:set_sprite_pos({x= 0 ,y= 1})
        end

        local current_score = G.GAME.chips
        local blind_score = G.GAME.blind.chips

        local currChips =  hand_chips
        local currMult = mult

        local score_diff_out_of_100 = (current_score / blind_score) * 100
    
    if G.GAME.current_round.hands_left  == 0 then
        if score_diff_out_of_100 <= 70 then
            if context.joker_main then
                card.ability.extra.saved = card.ability.extra.saved + 1
                    if currChips > currMult then    
                        return {
                            xchips = card.ability.extra.pity
                        }
                    elseif currMult >= currChips then
                        return {
                            xmult = card.ability.extra.pity
                        }
                    end
            end
        end
    end

    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
        if card.ability.extra.saved == 1 then 
            check_for_unlock({ type = "LastLife" })
            card:start_dissolve({G.C.RED})
            card = nil
            return {    
            play_sound("brawl_revive")
            }
        end
    end
     
end
}