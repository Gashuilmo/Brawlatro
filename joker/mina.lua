--Mina #Stylish
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