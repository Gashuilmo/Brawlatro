--------Start of code
SMODS.current_mod.optional_features = function()
    return {
        retrigger_card = true,
        retrigger_joker = true,
        post_trigger = true,
        cardarea = {unscored = true,}
    }
end

SMODS.Sound {
    key = "my_music",
    path = "lobby/glowbert_menu_01.mp3",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        return G.STAGE == G.STAGES.MAIN_MENU
    end,
}

SMODS.Sound {
    key = "my_music",
    path = "lobby/brawl_stars_menu_01.ogg",
    sync = {
        ['music1'] = true,
    },
    pitch = 1,
    vol = 0.5,
    select_music_track = function(self)
        return G.STAGE == G.STAGES.MAIN_MENU
    end,
}



--local randomSong = pseudorandom_element(lobby_music, 'seed')

--local lobby_music = {
  --  babyshark_menu.ogg, skateboard_menu.ogg
    --}

