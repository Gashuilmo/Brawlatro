G.FUNCS.brawl_menu_opt = function(args)
    local refval = args.cycle_config.ref_value
    Brawlatro.config[refval].current_option=args.cycle_config.current_option
    Brawlatro.config[refval].option_value = args.to_val
    SMODS.save_mod_config(self)
end

G.FUNCS.brawl_blind_opt = function(args)
    local refval = args.cycle_config.ref_value
    Brawlatro.config[refval].current_option=args.cycle_config.current_option
    Brawlatro.config[refval].option_value = args.to_val
    SMODS.save_mod_config(self)
end

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
                                    ref_table = Brawlatro.config,
                                    ref_value = "custom_menu_music",
                                })
                            }
                        },
                {
                n = G.UIT.R,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                                create_toggle({
                                    label = "Brawl Stars Shop Music",
                                    ref_table = Brawlatro.config,
                                    ref_value = "custom_shop_music",
                                })
                            }
                        },
                {
                n = G.UIT.R,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                            create_option_cycle {
                                label = "Brawl Menu Soundtrack",
                                options = {"Classic", "Beta", "Starr Hub", "Gift Shop", "Retropolis", "Stunt Show", "Ranger Ranch", "Goldarm Gang", "Mortis Mortuary", "Ghost Station", "Swamp of Love (1)", "Swamp of Love (2)", "Alli Release", "Rumble Jungle", "Biodome", "Darryl's Ship", "Cursed Pirate", "Mystic Wanderers", "Snowtel", "Mexico", "Starr Studio", "Starr Toon", "Castle Courtyard", "Candy Land",  "Enchanted Woods", "Trunk Release", "Starr Force", "Super City", "Starrcade", "Deep Sea", "Velocirapids", "Pierce Release", "Sea Monsters Aquarium", "Glowbert Release", "Finx Release", "Katana Kingdom", "Kenji Release", "Kaze Release", "Melodie Release", "Jae-Yong EDM", "Jae-Yong Love", "Sk8 Beat", "Mina Release", "Bizarre Circus", "Oddity Shop", "Gigi Release", "Madevil Manor", "Lumi Release", "Ziggy Release" },
                                current_option = Brawlatro.config.brawl_menu.current_option,
                                ref_table = Brawlatro.config,
                                ref_value = "brawl_menu",
                                opt_callback = "brawl_menu_opt",
                                w = 6.5
                                },
                            }
                        },
                    {
                    n = G.UIT.R,
                    config = { align = "cm" },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                                create_toggle({
                                    label = "In Blind",
                                    ref_table = Brawlatro.config,
                                    ref_value = "sync",
                                })
                            }
                        },
                        --
                    }
                },
                                {
                n = G.UIT.R,
                            config = { align = "cm", padding = 0.01 },
                            nodes = {
                            create_option_cycle {
                                label = "Brawl Menu Soundtrack",
                                options = {"Goldarm Gang","Castle Courtyard","Enchanted Woods"},
                                current_option = Brawlatro.config.blind_track.current_option,
                                ref_table = Brawlatro.config,
                                ref_value = "blind_track",
                                opt_callback = "brawl_blind_opt",
                                --w = 6.5
                                },
                            }
                        },
            }
        }

end