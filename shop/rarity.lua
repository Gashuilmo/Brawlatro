--Juju curse not showing in shop
SMODS.Rarity{
    key="cursed",
    loc_txt = {name ="Curse"},
    badge_colour = HEX("9ab735"),
    default_weight = 0.0, 
}
--Shelly
SMODS.Rarity{
    key="starter",
    loc_txt = {name ="Starter"},
    badge_colour = HEX("94d7f4"),
    default_weight = 0.05, 
}
--Rare
SMODS.Rarity{
    key="rare",
    loc_txt = {name ="Rare"},
    badge_colour = HEX("2edd1c"),
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
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
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
}
--Epic
SMODS.Rarity{
    key="epic",
    loc_txt = {name ="Epic"},
    badge_colour = HEX("b116ed"),
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
}
--Mythic
SMODS.Rarity{
    key="mythic",
    loc_txt = {name ="Mythic"},
    badge_colour = HEX("ff0020"),
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
}
--Legendary
SMODS.Rarity{
    key="legendary_brawler",
    loc_txt = {name ="Legendary"},
    badge_colour = HEX("fff11e"),
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
}
--Ultra-Legendary
SMODS.Gradient{
    key ="ultralegendary_gradient",
    colour = {
        HEX("260041"),
        HEX("5a0086"),
        HEX("b2009d"),
        HEX("fa7349"),
        HEX("f9b318"),
        HEX("dbfa2a"),
        HEX("61fd8f"),
        HEX("98fed0"),
        HEX("dfffee"),
    },
    cycle = 4,
    interpolation = 'linear',
}
SMODS.Rarity{
    key="ultra_legendary",
    loc_txt = {name ="Ultra Legendary"},
    badge_colour = G.C.EDITION,
    default_weight = 0.05, 
    --pools = {["Joker"] = true,}
}

SMODS.ConsumableType {
    key = "Gear",
    primary_colour = HEX("1ab1ff"),
    secondary_colour = HEX("3bdcff"),

    collection_row = {6, 2},
    shop_rate = 2,
    default = "c_brawl_mandycrush",
    no_collection = false,
}

SMODS.ConsumableType {
    key = "Voodoo",
    primary_colour = HEX("9ab735"),
    secondary_colour = HEX("9ab739"),

    collection_row = {6, 2},
    shop_rate = 2,
    default = "c_brawl_Jujudoll",
    no_collection = false,
}