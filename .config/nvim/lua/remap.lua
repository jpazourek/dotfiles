local tree_api = require("nvim-tree.api")
local telescope_builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")
local bufremove = require("mini.bufremove")

local treesitter_textobjects_select = require("nvim-treesitter-textobjects.select")
local treesitter_textobjects_move = require("nvim-treesitter-textobjects.move")
local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

--
--
--general
vim.keymap.set("n", "<leader>o", function()
	vim.cmd("terminal")
	vim.cmd("startinsert")
end, { desc = "[o]pen terminal" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("i", "<C-l>", "<Right>")

--
--
-- code
vim.keymap.set("n", "<leader>cd", vim.diagnostic.setloclist, { desc = "[c]ode [d]iagnostics file" })
vim.keymap.set("n", "<leader>cl", vim.diagnostic.open_float, { desc = "[c]ode diagnostics [l]ine" })

--
--
-- window
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "[w]indow split [v]ertical" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "[w]indow split [h]orizontal" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "[w]indow [c]lose" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "[w]indow [o]nly" })

--
--
-- buffers
vim.keymap.set("n", "<leader>bd", function()
	bufremove.delete(0, false)
end, { desc = "[b]uffer [d]elete" })

vim.keymap.set("n", "<leader>bD", function()
	bufremove.delete(0, true)
end, { desc = "[b]uffer force [D]elete" })

vim.keymap.set("n", "<leader>bl", "<C-^>", { desc = "[b]uffer switch to [l]ast" })

vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })

--
--
--telescope
vim.keymap.set("n", "<leader>sh", function()
	telescope_builtin.help_tags()
end, { desc = "[s]earch [h]elp" })

vim.keymap.set("n", "<leader>sk", function()
	telescope_builtin.keymaps()
end, { desc = "[s]earch [k]eymaps" })

vim.keymap.set("n", "<leader>sf", function()
	telescope_builtin.find_files()
end, { desc = "[s]earch [f]iles" })

vim.keymap.set("n", "<leader>ss", function()
	telescope_builtin.builtin()
end, { desc = "[s]earch [s]elect Telescope" })

vim.keymap.set({ "n", "v" }, "<leader>sw", function()
	telescope_builtin.grep_string()
end, { desc = "[s]earch current [w]ord" })

vim.keymap.set("n", "<leader>sg", function()
	telescope_builtin.live_grep()
end, { desc = "[s]earch by [g]rep" })

vim.keymap.set("n", "<leader>sd", function()
	telescope_builtin.diagnostics()
end, { desc = "[s]earch [d]iagnostics" })

vim.keymap.set("n", "<leader>sr", function()
	telescope_builtin.resume()
end, { desc = "[s]earch [r]esume" })

vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "[s]earch [t]odos" })

vim.keymap.set("n", "<leader>s.", function()
	telescope_builtin.oldfiles()
end, { desc = '[s]earch Recent Files ("." for repeat)' })

vim.keymap.set("n", "<leader>sc", function()
	telescope_builtin.commands()
end, { desc = "[s]earch [c]ommands" })

vim.keymap.set("n", "<leader><leader>", function()
	telescope_builtin.buffers()
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
	telescope_builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[s]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
	telescope_builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "[s]earch [n]eovim files" })

--
--
-- nvim-tree
vim.keymap.set("n", "<leader>fe", function()
	tree_api.tree.toggle()
end, { desc = "[f]ile [e]xplorer" })

vim.keymap.set("n", "<leader>fn", function()
	tree_api.tree.change_root_to_node()
end, { desc = "[f]iles root to [n]ode" })

vim.keymap.set("n", "<leader>fc", function()
	tree_api.fs.create()
end, { desc = "[f]ile [c]reate" })

vim.keymap.set("n", "<leader>fd", function()
	tree_api.fs.remove()
end, { desc = "[f]ile [d]elete" })

vim.keymap.set("n", "<leader>fr", function()
	tree_api.fs.rename_sub()
end, { desc = "[f]ile [r]ename" })

vim.keymap.set("n", "<leader>fh", function()
	tree_api.node.open.horizontal()
end, { desc = "[f]ile open [h]orizontal split" })

vim.keymap.set("n", "<leader>fv", function()
	tree_api.node.open.vertical()
end, { desc = "[f]ile open [v]ertical split" })

vim.keymap.set("n", "<leader>f.", function()
	tree_api.filter.dotfiles.toggle()
end, { desc = "[f]ile [.]dotfiles toggle" })

vim.keymap.set("n", "<leader>fg", function()
	tree_api.filter.git.ignored.toggle()
end, { desc = "[f]ile [g]it ignored toggle" })

--
--
-- git
vim.keymap.set("n", "]g", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]g", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Jump to next [g]it change" })

vim.keymap.set("n", "[g", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[g", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Jump to previous [g]it change" })

vim.keymap.set("v", "<leader>gs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[g]it [s]tage hunk" })

vim.keymap.set("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[g]it [r]eset hunk" })

vim.keymap.set("n", "<leader>gs", function()
	gitsigns.stage_hunk()
end, { desc = "[g]it [s]tage hunk" })

vim.keymap.set("n", "<leader>gr", function()
	gitsigns.reset_hunk()
end, { desc = "[g]it [r]eset hunk" })

vim.keymap.set("n", "<leader>gS", function()
	gitsigns.stage_buffer()
end, { desc = "[g]it [S]tage buffer" })

vim.keymap.set("n", "<leader>gu", function()
	gitsigns.stage_hunk()
end, { desc = "[g]it [u]ndo stage hunk" })

vim.keymap.set("n", "<leader>gR", function()
	gitsigns.reset_buffer()
end, { desc = "[g]it [R]eset buffer" })

vim.keymap.set("n", "<leader>gp", function()
	gitsigns.preview_hunk()
end, { desc = "[g]it [p]review hunk" })

vim.keymap.set("n", "<leader>gb", function()
	gitsigns.blame_line()
end, { desc = "[g]it [b]lame line" })

vim.keymap.set("n", "<leader>gd", function()
	gitsigns.diffthis()
end, { desc = "[g]it [d]iff against index" })

vim.keymap.set("n", "<leader>gD", function()
	gitsigns.diffthis("@")
end, { desc = "[g]it [D]iff against last commit" })

vim.keymap.set("n", "<leader>gB", function()
	gitsigns.toggle_current_line_blame()
end, { desc = "[g]it show [B]lame line toggle" })

vim.keymap.set("n", "<leader>gt", function()
	gitsigns.preview_hunk_inline()
end, { desc = "[g]it show deleted [t]oggle" })

--
--
-- Treesitter textobjects
--
-- select
vim.keymap.set({ "x", "o" }, "af", function()
	treesitter_textobjects_select.select_textobject("@function.outer", "textobjects")
end, { desc = "function/method" })

vim.keymap.set({ "x", "o" }, "if", function()
	treesitter_textobjects_select.select_textobject("@function.inner", "textobjects")
end, { desc = "inner function/method" })

vim.keymap.set({ "x", "o" }, "ac", function()
	treesitter_textobjects_select.select_textobject("@class.outer", "textobjects")
end, { desc = "class" })

vim.keymap.set({ "x", "o" }, "ic", function()
	treesitter_textobjects_select.select_textobject("@class.inner", "textobjects")
end, { desc = "inner class" })

vim.keymap.set({ "x", "o" }, "ap", function()
	treesitter_textobjects_select.select_textobject("@parameter.outer", "textobjects")
end, { desc = "parameter" })

vim.keymap.set({ "x", "o" }, "ip", function()
	treesitter_textobjects_select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "inner parameter" })

vim.keymap.set({ "x", "o" }, "a.", function()
	treesitter_textobjects_select.select_textobject("@call.outer", "textobjects")
end, { desc = "call" })

vim.keymap.set({ "x", "o" }, "i.", function()
	treesitter_textobjects_select.select_textobject("@call.inner", "textobjects")
end, { desc = "inner call" })

vim.keymap.set({ "x", "o" }, "ai", function()
	treesitter_textobjects_select.select_textobject("@conditional.outer", "textobjects")
end, { desc = "if conditional" })

vim.keymap.set({ "x", "o" }, "ii", function()
	treesitter_textobjects_select.select_textobject("@conditional.inner", "textobjects")
end, { desc = "inner if conditional" })

vim.keymap.set({ "x", "o" }, "al", function()
	treesitter_textobjects_select.select_textobject("@loop.outer", "textobjects")
end, { desc = "loop" })

vim.keymap.set({ "x", "o" }, "il", function()
	treesitter_textobjects_select.select_textobject("@loop.inner", "textobjects")
end, { desc = "inner loop" })

vim.keymap.set({ "x", "o" }, "av", function()
	treesitter_textobjects_select.select_textobject("@assignment.outer", "textobjects")
end, { desc = "variable assignment" })

vim.keymap.set({ "x", "o" }, "iv", function()
	treesitter_textobjects_select.select_textobject("@assignment.inner", "textobjects")
end, { desc = "inner variable assignment" })

vim.keymap.set({ "x", "o" }, "as", function()
	treesitter_textobjects_select.select_textobject("@local.scope", "locals")
end, { desc = "local scope" })

vim.keymap.set({ "x", "o" }, "is", function()
	treesitter_textobjects_select.select_textobject("@local.scope", "locals")
end, { desc = "inner local scope" })

-- move
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	treesitter_textobjects_move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function" })

vim.keymap.set({ "n", "x", "o" }, "[f", function()
	treesitter_textobjects_move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Previous function" })

vim.keymap.set({ "n", "x", "o" }, "]c", function()
	treesitter_textobjects_move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
	treesitter_textobjects_move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Previous class" })

vim.keymap.set({ "n", "x", "o" }, "]p", function()
	treesitter_textobjects_move.goto_next_start("@parameter.outer", "textobjects")
end, { desc = "Next parameter" })

vim.keymap.set({ "n", "x", "o" }, "[p", function()
	treesitter_textobjects_move.goto_previous_start("@parameter.outer", "textobjects")
end, { desc = "Previous parameter" })

vim.keymap.set({ "n", "x", "o" }, "].", function()
	treesitter_textobjects_move.goto_next_start("@call.outer", "textobjects")
end, { desc = "Next call" })

vim.keymap.set({ "n", "x", "o" }, "[.", function()
	treesitter_textobjects_move.goto_previous_start("@call.outer", "textobjects")
end, { desc = "Previous call" })

vim.keymap.set({ "n", "x", "o" }, "]i", function()
	treesitter_textobjects_move.goto_next_start("@conditional.outer", "textobjects")
end, { desc = "Next if conditional" })

vim.keymap.set({ "n", "x", "o" }, "[i", function()
	treesitter_textobjects_move.goto_previous_start("@conditional.outer", "textobjects")
end, { desc = "Previous if conditional" })

vim.keymap.set({ "n", "x", "o" }, "]l", function()
	treesitter_textobjects_move.goto_next_start("@loop.outer", "textobjects")
end, { desc = "Next loop" })

vim.keymap.set({ "n", "x", "o" }, "[l", function()
	treesitter_textobjects_move.goto_previous_start("@loop.outer", "textobjects")
end, { desc = "Previous loop" })

vim.keymap.set({ "n", "x", "o" }, "]v", function()
	treesitter_textobjects_move.goto_next_start("@assignment.outer", "textobjects")
end, { desc = "Next variable assignment" })

vim.keymap.set({ "n", "x", "o" }, "[v", function()
	treesitter_textobjects_move.goto_previous_start("@assignment.outer", "textobjects")
end, { desc = "Previous variable assignment" })

vim.keymap.set({ "n", "x", "o" }, "]s", function()
	treesitter_textobjects_move.goto_next_start("@local.scope", "locals")
end, { desc = "Next local scope" })

vim.keymap.set({ "n", "x", "o" }, "[s", function()
	treesitter_textobjects_move.goto_previous_start("@local.scope", "locals")
end, { desc = "Previous local scope" })

-- repeating with ; ,
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
