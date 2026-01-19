
local jd_def = JokerDisplay.Definitions

    jd_def["j_brawl_buffet"] = {
        line_1 = {
				{ text = "+", colour = G.C.CHIPS },
				{ ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS },
			}
		}

	jd_def["j_brawl_chesterjoker"] = {
        text = {
			{ text = "Nah LOL !", colour = G.C.GOLD},
		},
	}

    jd_def["j_brawl_surged"] = {
        text = {
					{
                border_nodes = {
					{ text = "X"},
					{ ref_table = "card.ability.extra", ref_value = "surgemult"},
				},
			},
		},
	}

	-- jd_def["j_brawl_commando"] = later
	
	jd_def["j_brawl_cheater"] = {
        text = {
					{
                border_nodes = {
					{ text = "+1"},
				},
			border_colour = G.C.EDITION
			},
		},
	}

	jd_def["j_brawl_shaman"] = {
        line_1 = {
                {
                    border_nodes = {
					{ text = "X"},
					{ ref_table = "card.ability.extra", ref_value = "xmulttotal"},
				}
			}
		},	
		line_2 = {
					{ text = "("},
					{ ref_table = "card.ability.extra", ref_value = "hands_remaining"},
					{ text = " "},
					{ text = "Left"},
					{ text = ")"},
				}
	}

	jd_def["j_brawl_bruce"] = {
		text = {	
					{ ref_table = "card.ability.extra", ref_value = "round"},
					{ text = "/"},
					{ ref_table = "card.ability.extra", ref_value = "maxround"},
				}
			}
	
	jd_def["j_brawl_JaeYong"] = {
		text = {
				{
				border_nodes = {
					{ text = "X"},
					{ ref_table = "card.joker_display_values", ref_value = "multiplier"},
				}
			}
		},
		calc_function = function(card)
			if card.ability.extra.switch == 2 then
				card.joker_display_values.multiplier = card.ability.extra.xmult
			else
				card.joker_display_values.multiplier = card.ability.extra.xchip
			end
		end,

		style_function = function (card, text, reminder_text, extra)
			if text and text.children[1] then
				text.children[1].config.colour = card.ability.extra.switch == 2 and G.C.MULT or G.C.CHIPS
			end
			return false
		end
	}


	jd_def["j_brawl_activator"] = {
		line_1 = {
				{
					border_nodes = {
					{ text = "X"},
					{ ref_table = "card.ability.extra", ref_value = "xmult"},
				}
			}
		},	
	}

	jd_def["j_brawl_colette"] = {
		text = {
                {
                    border_nodes = {
					{ text = "X"},
					{ ref_table = "card.ability.extra", ref_value = "xmulttotal"},
				}
			}
		},
	}

	jd_def["j_brawl_debt"] = {
        line_1 = {
					{ text = "+", colour = G.C.CHIPS},
					{ ref_table = "card.ability.extra", ref_value = "chiptottal", colour = G.C.CHIPS},
		},	
		line_2 = {
					{ text = "$", colour = G.C.GOLD},
					{ ref_table = "card.ability.extra", ref_value = "moneyspent", colour = G.C.GOLD},
				}
	}

	jd_def["j_brawl_carlpick"] = {
		line_1 = {
					{ text = "+", colour = G.C.CHIPS},
					{ ref_table = "card.ability.extra", ref_value = "chip", colour = G.C.CHIPS},
		},	
	}

	jd_def["j_brawl_oven"] = {
		line_1 = {
					{ text = "+", colour = G.C.MULT},
					{ ref_table = "card.ability.extra", ref_value = "unleash", colour = G.C.MULT},
				}
			}

	-- brazil - this is hell

	jd_def["j_brawl_hotdoug"] = { -- DNA from JokerDisplay
    	text = {
            { ref_table = "card.joker_display_values", ref_value = "active" },
        },
        calc_function = function(card)
            card.joker_display_values.active = (G.GAME and G.GAME.current_round.hands_left  <= 1 and localize("b_active") or localize("b_inactive"))
        end,
		
		style_function = function (card, text, reminder_text, extra)
			text.children[1].config.colour = G.GAME.current_round.hands_left  <= 1 and G.C.GOLD or G.C.WHITE
		end
    }