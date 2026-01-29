--Jae-Yong is overworking himself
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
		return { vars = { card.ability.extra.xchip, card.ability.extra.xmult, card.ability.extra.switch, card.ability.extra.mode, card.ability.extra.afterparty}, key = card.ability.extra.switch >= 1 and "j_brawl_JaeYong_alt" or nil}
	end,

    calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        if card.ability.extra.switch == 1 then
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
        elseif card.ability.extra.switch == 2 then
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
        elseif card.ability.extra.switch == 0 then
            card.ability.extra.switch = card.ability.extra.switch + 2
            card.ability.extra.mode = localize("k_work")
            card.ability.extra.afterparty = card.ability.extra.afterparty + 1
            return {
                play_sound("brawl_work_mode", 1 , 0.5),
                play_sound("brawl_work_mode_effect", 1 , 0.5),
                message = localize("k_brawl_worktime"),
                colour = G.C.MULT,
                message_card = card,
            }
        end
    end
    if context.joker_main then
        if card.ability.extra.switch == 1 then
            return {
                xchips = card.ability.extra.xchip,
            } 
        elseif card.ability.extra.switch == 2 then
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