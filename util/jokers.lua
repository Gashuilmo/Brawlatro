--------Start of code
SMODS.current_mod.optional_features = function()
    return {
        retrigger_card = true,
        retrigger_joker = true,
        post_trigger = true,
        cardarea = {unscored = true,}
    }
end

--G.C.BRAWLBLUE = HEX("238ff4")
--G.C.BRAWLYELLOW = HEX("febe20")
--G.C.mid_flash = 0
--G.C.vort_time = 7
--G.C.vort_speed = 0.4

--local oldfunc = Game.main_menu
--Game.main_menu = function(change_context)
--	local ret = oldfunc(change_context)
--	G.SPLASH_BACK:define_draw_steps({
--			{
--				shader = "splash",
--				send = {
--					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
--           			{name = 'vort_speed', val = G.C.vort_speed},
--            		{name = 'colour_1', ref_table = G.C, ref_value = 'BRAWLYELLOW'},
--            		{name = 'colour_2', ref_table = G.C, ref_value = 'BRAWLBLUE'},
--            		{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
--				},
--			},
--		})
--	return ret
--end