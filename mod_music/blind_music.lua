SMODS.Sound {
    key = "music_blind_beta",
    path = "blind/_Beta_Slugfest_menu_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Beta" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_classic",
    path = "blind/_InGame_Slugfest_ingame_03.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Classic" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_hub",
    path = "blind/brawl_lounge_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Hub" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_retropolis",
    path = "blind/retro_brawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
         if Brawlatro.config.blind_track.option_value == "Retropolis 1" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_retropolis2",
    path = "blind/retro_brawl_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Retropolis 2" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_stunt_show",
    path = "blind/pinstuntbrawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Stunt Show" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_wasteland",
    path = "blind/wasteland_ingame_music_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Ranger Ranch" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_western",
    path = "blind/rooty_tooty_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Goldarm Gang" then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT and Brawlatro.config.custom_menu_music
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mortuary",
    path = "blind/brawloween_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mortis Mortuary 1" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mortuary2",
    path = "blind/brawloween_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mortis Mortuary 2" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_ghost_station",
    path = "blind/brawloween_ghost_train_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Ghost Station" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_swap_of_love_1",
    path = "blind/love_swamp_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Swamp of Love" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_rumble_jungle",
    path = "blind/brawl_jungle_ingame_music_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Rumble Jungle" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_biodome",
    path = "blind/biodome_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Biodome" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_darryl_brawliday",
    path = "blind/pirate_brawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Darryl's Ship 1" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_darryl_brawliday2",
    path = "blind/pirate_brawl_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Darryl's Ship 2" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawzaar",
    path = "blind/brawzaar_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mystic Wanderers 1" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawzaar2",
    path = "blind/brawzaar_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mystic Wanderers 2" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_snowtel",
    path = "blind/snowtel_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Snowtel" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mexico",
    path = "blind/ingame_poco_track_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mexico 1" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_mexico2",
    path = "blind/ingame_poco_track_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Mexico 2" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_brawlywood",
    path = "blind/brawlywood_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Studio" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_toon",
    path = "blind/brawly_toonz_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Starr Toon" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_castle",
    path = "blind/brawl_castle_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Castle Courtyard" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_candy",
    path = "blind/brawl_candy_level_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Candy Land" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

 SMODS.Sound {
    key = "music_blind_enchanted_woods",
    path = "blind/brawl_enchanted_forest_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        if Brawlatro.config.blind_track.option_value == "Enchanted Woods" and Brawlatro.config.custom_menu_music then
            return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_space",
    path = "blind/military_lase_tag_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Starr Force 1" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_space2",
    path = "blind/military_lase_tag_ingame_03.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Starr Force 2" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_bigcity",
    path = "blind/big_brawl_battle_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Super City" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_arcade",
    path = "blind/brawlcade_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Starrcade 1" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_arcade2",
    path = "blind/brawlcade_ingame_02.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Starrcade 2" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_rapids",
    path = "blind/brawl_dinobeach_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Velocirapids" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}


SMODS.Sound {
    key = "music_blind_hankington",
    path = "blind/underwater_brawl_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Deep Sea" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_bert",
    path = "blind/glowbert_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Sea Monsters Aquarium" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_musicbutjapan",
    path = "blind/feudal_japan_ingame_music_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Katana Kingdom" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_subwaybrawl",
    path = "blind/skatebeat_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Sk8 Beat" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_france",
    path = "blind/circus_ingame_01.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Bizarre Circus" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_cajun",
    path = "blind/juju_environment_loop.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Oddity Shop" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}

SMODS.Sound {
    key = "music_blind_eardestroyer",
    path = "blind/brawlstars_metal_ingame_master_v1.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        
            if Brawlatro.config.blind_track.option_value == "Madevil Manor" and Brawlatro.config.custom_menu_music then
                return G.GAME.blind and G.GAME.blind.in_blind or G.STATE == G.STATES.BLIND_SELECT
        end
    end,
}