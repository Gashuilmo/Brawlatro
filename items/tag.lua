SMODS.Atlas{
    key = 'geartag',
    path = 'geartag.png',
    px = 34,
    py = 34,
}
SMODS.Tag{
	object_type = "Tag",
	atlas = "geartag",
	name = "Gear Tag",
	pos = { x = 0, y = 0 },
	config = { type = "new_blind_choice" },
	key = "gear_tag",
	min_ante = 0,
    config = {type = "new_blind_choice"},
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = {key = 'p_brawl_minibox_b', set = 'Other', vars = {G.P_CENTERS.p_brawl_minibox_b.config.choose, G.P_CENTERS.p_brawl_minibox_b.config.extra}}
        return {}
    end,

    config = {type = 'new_blind_choice'},

    apply = function(self, tag, context)
        if context.type == self.config.type then
            G.CONTROLLER.locks[tag.ID] = true
            tag:yep('+', G.C.BUNCO_VIRTUAL, function()
                local key = 'p_brawl_minibox_b'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[tag.ID] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end,

    }