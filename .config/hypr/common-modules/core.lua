hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,

		border_size = 3,

		col = {
			active_border = { colors = { "#fb6389", "#8d3ef0" }, angle = 45 },
			inactive_border = "#595959",
		},

		resize_on_border = true,

		allow_tearing = false,

		layout = "dwindle",
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},

	decoration = {
		rounding = 10,
		rounding_power = 5,
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		font_family = "JetBrainsMono Nerd Font",
		disable_autoreload = true,
	},
})
