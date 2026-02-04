--local is_in_blind = G.GAME.blind.in_blind

SMODS.Sound {
    key = "music_blind_hub",
    path = "blind/brawl_lounge_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Hub" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_retropolis",
    path = "blind/retro_brawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then 
            if Brawlatro.config.blind_track.option_value == "Retropolis" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_retropolis2",
    path = "blind/retro_brawl_ingame_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Retropolis" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_stunt_show",
    path = "blind/pinstuntbrawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Stunt Show" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_wasteland",
    path = "blind/wasteland_ingame_music_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Ranger Ranch" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_western",
    path = "blind/rooty_tooty_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Goldarm Gang" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mortuary",
    path = "blind/brawloween_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then
            if Brawlatro.config.blind_track.option_value == "Mortis Mortuary" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mortuary2",
    path = "blind/brawloween_ingame_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Mortis Mortuary" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_ghost_station",
    path = "blind/brawloween_ghost_train_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Ghost Station" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_swap_of_love_1",
    path = "blind/love_swamp_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Swamp of Love (1)" or Brawlatro.config.blind_track.option_value == "Swamp of Love (2)" or Brawlatro.config.blind_track.option_value == "Alli Release" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_rumble_jungle",
    path = "blind/brawl_jungle_ingame_music_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Rumble Jungle" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_biodome",
    path = "blind/biodome_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Biodome" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_darryl_brawliday",
    path = "blind/pirate_brawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then
            if Brawlatro.config.blind_track.option_value == "Darryl's Ship" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_darryl_brawliday2",
    path = "blind/pirate_brawl_ingame_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Darryl's Ship" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawzaar",
    path = "blind/brawzaar_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then
            if Brawlatro.config.blind_track.option_value == "Mystic Wanderers" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawzaar2",
    path = "blind/brawzaar_ingame_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Mystic Wanderers" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_snowtel",
    path = "blind/snowtel_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Snowtel" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mexico",
    path = "blind/ingame_poco_track_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then
            if Brawlatro.config.blind_track.option_value == "Mexico" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mexico2",
    path = "blind/ingame_poco_track_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Mexico" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawlywood",
    path = "blind/brawlywood_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Studio" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_toon",
    path = "blind/brawly_toonz_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Toon" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_castle",
    path = "blind/brawl_castle_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Castle Courtyard" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_candy",
    path = "blind/brawl_candy_level_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Candy Land" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

 SMODS.Sound {
    key = "music_blind_enchanted_woods",
    path = "blind/brawl_candy_level_ingame_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Enchanted Woods" and Brawlatro.config.sync then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_space",
    path = "blind/military_lase_tag_ingame_02.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 1" then
            if Brawlatro.config.blind_track.option_value == "Starr Force" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

SMODS.Sound {
    key = "music_blind_space2",
    path = "blind/military_lase_tag_ingame_03.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.env_version.option_value == "OST 2" then
            if Brawlatro.config.blind_track.option_value == "Starr Force" and Brawlatro.config.sync then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
            end
        end
    end,
}

