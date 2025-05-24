SMODS.Atlas{
    key = "passvoucher",
    path = "passvoucher.png",
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = "brawlpass",
        loc_txt = {
                name = 'Brawl Pass',
                text = { 'Does Nothing at the moment' }
        },
    atlas = "passvoucher",
    pos = { x = 0, y = 0 },
    cost = 10,
    unlocked = true,
    discovered = true,
}

SMODS.Voucher {
    key = "brawlpass+",
        loc_txt = {
                name = 'Brawl Pass Plus',
                text = { 'Does Nothing at the moment' }
        },
    atlas = "passvoucher",
    pos = { x = 0, y = 1 },
    cost = 10,
    unlocked = true,
    discovered = true,
    requires = "v_brawl_brawlpass",
}