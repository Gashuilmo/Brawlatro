--Kenji The First (litterally)
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
}