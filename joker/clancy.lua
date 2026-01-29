--Clancy going full commando
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
        end

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