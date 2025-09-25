SMODS.Atlas{
    key = "records",
    path = 'records.png',
    px = 52,
    py = 52,
}
SMODS.Achievement ({
    key = "power_12",
    order = 1,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "power_12" then return true end
    end,
})

SMODS.Achievement ({
    key = "coins",
    order = 1,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "coins" then return true end
    end,
})

SMODS.Achievement ({
    key = "afterparty",
    order = 1,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "afterparty" then return true end
    end,
})

SMODS.Achievement ({
    key = "blowaway",
    order = 1,
    bypass_all_unlocked = true,
    --hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "blowaway" then return true end
    end,
})

SMODS.Achievement ({
    key = "rat",
    order = 1,
    bypass_all_unlocked = true,
    --hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "rat" then return true end
    end,
})

SMODS.Achievement ({
    key = "WAR",
    order = 1,
    bypass_all_unlocked = true,
    reset_on_startup = true,
    --hidden_name = true,
    atlas = "records",
    unlock_condition = function(self, args)
        if args.type == "WAR" then return true end
    end,
})

--SMODS.Achievement ({
--    key = "queenie",
--    order = 1,
--    bypass_all_unlocked = true,
    --hidden_name = true,
--    atlas = "records",
--    unlock_condition = function(self, args)
--        if args.type == "queenie" then return true end
--    end,
--})