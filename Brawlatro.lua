if not Brawlatro then
	Brawlatro = {}
end

SMODS.Font({
    key = 'brawl_font',
    path = 'lilitaone.ttf',
    render_scale = 175,         -- Base size in pixels (default: 200)
    TEXT_HEIGHT_SCALE = 0.83,   -- Line spacing (default: 0.83)
    TEXT_OFFSET = {x = 0, y = -10}, -- Alignment tweak (default: {0,0})
    FONTSCALE = 0.1,            -- Scale multiplier (default: 0.1)
    squish = 1,                 -- Horizontal stretch (default: 1)
    DESCSCALE = 1               -- Description scale (default: 1)
})

local mod_path = "" .. SMODS.current_mod.path
Brawlatro.path = mod_path
Brawlatro_config = SMODS.current_mod.config

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
	post_trigger = true,
}

SMODS.ObjectType({
	key = "Grisgris",
	default = "grisgris",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

SMODS.ObjectType({
	key = "Brawler",
	default = "brawler",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})
SMODS.ObjectType({
	key = "Bruce",
	default = "bruce",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

--Load files
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[Brawlatro] Loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end
