--Juju curse not showing in shop
SMODS.Rarity{
    key="cursed",
    loc_txt = {name ="Curse"},
    badge_colour = HEX("9ab735"),
    default_weight = 0.01, 
}
--Shelly
SMODS.Rarity{
    key="starter",
    loc_txt = {name ="Starter"},
    badge_colour = HEX("94d7f4"),
    default_weight = 0.0, 
}
--Rare
SMODS.Rarity{
    key="rare",
    loc_txt = {name ="Rare"},
    badge_colour = HEX("2edd1c"),
    default_weight = 0.3, 
    pools = {
        ["Joker"] = true,
    }
}
--Rare
SMODS.Rarity{
    key="bruce",
    loc_txt = {name ="Rare"},
    badge_colour = HEX("2edd1c"),
    default_weight = 0, 
}
--Super rare
SMODS.Rarity{
    key="super_rare",
    loc_txt = {name ="Super Rare"},
    badge_colour = HEX("1693ff"),
    default_weight = 0.25, 
    pools = {
        ["Joker"] = true,
    }
}
--Epic
SMODS.Rarity{
    key="epic",
    loc_txt = {name ="Epic"},
    badge_colour = HEX("b116ed"),
    default_weight = 0.15, 
    pools = {
        ["Joker"] = true,
    }
}
--Mythic
SMODS.Rarity{
    key="mythic",
    loc_txt = {name ="Mythic"},
    badge_colour = HEX("ff0020"),
    default_weight = 0.06, 
    pools = {
        ["Joker"] = true,
    }
}
--Legendary
SMODS.Rarity{
    key="legendary_brawler",
    loc_txt = {name ="Legendary"},
    badge_colour = HEX("fff11e"),
    default_weight = 0.04, 
    pools = {
        ["Joker"] = true,
    }
}
--Ultra-Legendary
SMODS.Rarity{
    key="ultra_legendary",
    loc_txt = {name ="Ultra Legendary"},
    badge_colour = HEX("d3fee9"),
    default_weight = 0.01, 
    pools = {
        ["Joker"] = true,
    }
}