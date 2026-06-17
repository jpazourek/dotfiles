vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy_init")
require("utils.highlight_on_yank")
require("utils.lsp")
require("utils.treesitter")
require("remap")
require("options")
