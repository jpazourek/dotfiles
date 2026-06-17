local M = {}

local function get_project_dirs()
	local project_path = vim.fn.expand("~/Projects")

	local dirs = vim.fn.readdir(project_path, function(name)
		if vim.uv.fs_stat(project_path .. "/" .. name).type == "directory" then
			return 1
		else
			return 0
		end
	end)

	table.sort(dirs)

	local projects = {}

	for _, dir in ipairs(dirs) do
		table.insert(projects, {
			name = dir,
			path = project_path .. "/" .. dir,
		})
	end

	return projects
end

function M.project_picker()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local projects = get_project_dirs()

	pickers
		.new({}, {
			prompt_title = "Project folders",

			finder = finders.new_table({
				results = projects,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name .. " → " .. entry.path,
						ordinal = entry.name .. " " .. entry.path,
					}
				end,
			}),

			sorter = conf.generic_sorter({}),

			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					if not selection then
						return
					end

					local path = vim.fn.expand(selection.value.path)

					vim.cmd("cd " .. vim.fn.fnameescape(path))
					vim.cmd("NvimTreeClose")
					vim.cmd("NvimTreeOpen")
					vim.cmd("+quit")
				end)

				return true
			end,
		})
		:find()
end

function M.config_picker()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local configs = {
		{ name = "Neovim", path = "~/.config/nvim" },
		{ name = "Hyprland", path = "~/.config/hypr" },
		{ name = "Waybar", path = "~/.config/waybar" },
		{ name = "Kitty", path = "~/.config/kitty" },
		{ name = "Fastfetch", path = "~/.config/fastfetch" },
		{ name = "Fish", path = "~/.config/fish" },
		{ name = "Rofi", path = "~/.config/rofi" },
		{ name = "Yazi", path = "~/.config/yazi" },
		{ name = "Wleave", path = "~/.config/wleave" },
		{ name = "Dunst", path = "~/.config/dunst" },
	}

	pickers
		.new({}, {
			prompt_title = "Config folders",

			finder = finders.new_table({
				results = configs,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name .. "  →  " .. entry.path,
						ordinal = entry.name .. " " .. entry.path,
					}
				end,
			}),

			sorter = conf.generic_sorter({}),

			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					if not selection then
						return
					end

					local path = vim.fn.expand(selection.value.path)

					vim.cmd("cd " .. vim.fn.fnameescape(path))
					vim.cmd("NvimTreeClose")
					vim.cmd("NvimTreeOpen")
					vim.cmd("+quit")
				end)

				return true
			end,
		})
		:find()
end

return M
