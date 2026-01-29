--Pearl crashing out
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
        if context.card_clicked == card and G.jokers.highlighted then
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