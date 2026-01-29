--Chester being stupid
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