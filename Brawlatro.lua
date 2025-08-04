if not Brawlatro then
	Brawlatro = {}
end

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

--Brawlatro.nuuhstream = love.graphics.newVideoStream( Brawlatro.path .. "nuuh.ogv" )
--Brawlatro.nuuh = love.graphics.newVideo( Brawlatro.nuuhstream )

--Load Library Files
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[Brawlatro] Loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end





--Load misc stuff so i only hook things once
--local hook = love.load
--function love.load()
--	hook()
--		local full_path = (Brawlatro.path 
--		.."assets/" 
--		.. G.SETTINGS.GRAPHICS.texture_scaling 
--		.. "x/"
--		.. "horse.png")
--	file_data = assert(NFS.newFileData(full_path),("Epic fail"))
--	Brawlatro.horsepngimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))
--	Brawlatro.horsepng = assert(love.graphics.newImage(Brawlatro.horsepngimagedata),("Epic fail 3"))
--
--end

----------------------------------------------------------
----------- MOD CODE END ----------------------------------
