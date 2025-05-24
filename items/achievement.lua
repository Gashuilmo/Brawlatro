SMODS.Atlas{
    key = "power12",
    path = 'trophy.png',
    px = 70,
    py = 59,
}
SMODS.Achievement {
    key = "power12",
    loc_txt = {
        name = "Power 12",
        description = {
            "Have Surge reach a multiplier of 12"
        },
    },
    atlas = "power12",
    pos = {x = 0, y = 0},
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function(self, args, card)
        if args.type == "boss_blind_win" then
            if card.ability.extra.surgemult == 12 then
                return true
            end
    end
end
}