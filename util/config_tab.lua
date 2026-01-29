SMODS.current_mod.config_tab = function()
return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 6, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                                create_toggle({
                                    label = "Brawl Stars Menu Music",
                                    ref_table = Brawlatro_config,
                                    ref_value = "custom_menu_music",
                                })
                            }
                        },
            {
                n = G.UIT.R,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                                create_option_cycle({
                                    label = "Brawl Stars Menu Music",
                                    ref_table = Brawlatro_config,
                                    ref_value = "music_list",
                                    scale = 0.8,
                                })
                            }
                        },
                    }
                }

end