--Surge juiced me up
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