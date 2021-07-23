-- ***
-- Glowshrooms mod
-- by rudzik8
-- version 1.4.1
-- ***

-- загружены ли поддерживаемые моды?
local ttmod = minetest.global_exists("tt")
local lbmod = minetest.global_exists("lucky_block")

-- описываем кто такие светогрибы и что они делают
minetest.register_node("glowshrooms:glowshroom_green", {
	description = "Green glowshroom",
    drawtype = "plantlike",
	groups = {snappy = 3, glowshroom = 1},
    tiles = {"glowshrooms_glowshroom_green.png"},
	inventory_image = "glowshrooms_glowshroom_green.png",
	walkable = false,
	buildable_to = true,
	light_source = 4,
	paramtype = 'light',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	}
})
minetest.register_node("glowshrooms:glowshroom_blue", {
	description = "Blue glowshroom",
    drawtype = "plantlike",
	groups = {snappy = 3, glowshroom = 1},
    tiles = {"glowshrooms_glowshroom_blue.png"},
	inventory_image = "glowshrooms_glowshroom_blue.png",
	walkable = false,
	buildable_to = true,
	light_source = 4,
	paramtype = 'light',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	}
})
minetest.register_node("glowshrooms:glowshroom_red", {
	description = "Red glowshroom",
    drawtype = "plantlike",
	groups = {snappy = 3, glowshroom = 1},
    tiles = {"glowshrooms_glowshroom_red.png"},
	inventory_image = "glowshrooms_glowshroom_red.png",
	walkable = false,
	buildable_to = true,
	light_source = 4,
	paramtype = 'light',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	}
})

-- описываем кто такие приготовленные светогрибы и как их делать
minetest.register_craftitem("glowshrooms:glowshroom_green_cooked", {
    description = "Cooked green glowshroom",
    inventory_image = "glowshrooms_glowshroom_green_cooked.png",
    on_use = minetest.item_eat(3),
})
minetest.register_craftitem("glowshrooms:glowshroom_blue_cooked", {
    description = "Cooked blue glowshroom",
    inventory_image = "glowshrooms_glowshroom_blue_cooked.png",
    on_use = minetest.item_eat(4), 
})
minetest.register_craftitem("glowshrooms:glowshroom_red_cooked", {
    description = "Cooked red glowshroom",
    inventory_image = "glowshrooms_glowshroom_red_cooked.png",
    on_use = minetest.item_eat(5),
})
minetest.register_craft({
    type = "cooking",
    output = "glowshrooms:glowshroom_green_cooked",
    recipe = "glowshrooms:glowshroom_green",
    cooktime = 7,
})
minetest.register_craft({
    type = "cooking",
    output = "glowshrooms:glowshroom_blue_cooked",
    recipe = "glowshrooms:glowshroom_blue",
    cooktime = 7,
})
minetest.register_craft({
    type = "cooking",
    output = "glowshrooms:glowshroom_red_cooked",
    recipe = "glowshrooms:glowshroom_red",
    cooktime = 7,
})

-- определяем ярлычки для того, чтобы юзеру было полегче
minetest.register_alias("glowshroom_green", "glowshrooms:glowshroom_green")
minetest.register_alias("glowshroom_blue", "glowshrooms:glowshroom_blue")
minetest.register_alias("glowshroom_red", "glowshrooms:glowshroom_red")
minetest.register_alias("glowshroom_green_cooked", "glowshrooms:glowshroom_green_cooked")
minetest.register_alias("glowshroom_blue_cooked", "glowshrooms:glowshroom_blue_cooked")
minetest.register_alias("glowshroom_red_cooked", "glowshrooms:glowshroom_red_cooked")

-- делаем так, чтобы светогрибы появлялись в мире
minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:stone"},
    sidelen = 16,
	biomes = {"underground"},
    fill_ratio = 0.3,
	y_max = -15,
    y_min = -2000,
    decoration = "glowshrooms:glowshroom_green",
})
minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:stone"},
    sidelen = 16,
	biomes = {"underground"},
    fill_ratio = 0.2,
	y_max = -15,
    y_min = -2000,
    decoration = "glowshrooms:glowshroom_blue",
})
minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:stone"},
    sidelen = 16,
	biomes = {"underground"},
    fill_ratio = 0.1,
	y_max = -15,
    y_min = -2000,
    decoration = "glowshrooms:glowshroom_red",
})

-- а тут у нас поддержка других модов, где мы используем переменные, заданные в самом начале
if ttmod then
	tt.register_snippet(function(itemstring)
		if minetest.get_item_group(itemstring, "glowshroom") == 1 then
			return "Glows. Spawns at the top (or in) of caves"
		end
	end)
end

if lbmod then
	lucky_block:add_blocks({
		{"dro", {"glowshrooms:glowshroom_green_cooked"}, 5},
		{"dro", {"glowshrooms:glowshroom_blue_cooked"}, 4},
		{"dro", {"glowshrooms:glowshroom_red_cooked"}, 3},
	})
end