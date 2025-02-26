require('plugins')
require('impatient')
require('keymaps')
--require "user.setup.alpha"
-- ======================================= --
-- ==		      EDITOR SETTINGS          	== --
-- ======================================= --

vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.wo.relativenumber = true

-- Old vim script commands
vim.cmd [[ colorscheme oma ]]
--vim.cmd([[
--set spell
--]])

vim.opt.termguicolors = true
-- ======================================= --
-- ==		      PLUGIN CONFIGS          	== --
-- ======================================= --

require'colorizer'.setup()
	DEFAULT_OPTIONS = {
		RGB      = true;         -- #RGB hex codes
		RRGGBB   = true;         -- #RRGGBB hex codes
		names    = true;         -- "Name" codes like Blue
		RRGGBBAA = false;        -- #RRGGBBAA hex codes
		rgb_fn   = false;        -- CSS rgb() and rgba() functions
		hsl_fn   = false;        -- CSS hsl() and hsla() functions
		css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes: foreground, background
		mode     = 'background'; -- Set the display mode.
  }

local status_ok, alpha = pcall(require, "alpha")                                       
  if not status_ok then
    return
  end
                                                                                                                                                 
 local theme_ok, alpha_theme = pcall(require, "alpha.themes.startify")                                                                         
 if not theme_ok then                                                                                                                           
   return                                                                                                                                       
 end
alpha.setup(alpha_theme.config)  


-- LSP and Linting Config
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
    'bashls',
    'luau_lsp',
    'marksman',
  },
	automatic_installation = true,
})

--require'lspconfig'.bashls.setup{}
--require'lspconfig'.luau_lsp.setup{}
--require'lspconfig'.marksman.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

--require("null-ls").setup({
--	sources = {
--			require("null-ls").builtins.formatting.stylua,
--			require("null-ls").builtins.code_actions.cspell,
--			require("null-ls").builtins.diagnostics.codespell,
--			require("null-ls").builtins.completion.spell,
--			require("null-ls").builtins.code_actions.proselint,
--			require("null-ls").builtins.diagnostics.write_good,
--	},
--})

-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

--Pretty Status bar
require('lualine').setup {
	options = {
		icons_enabled = true,
	},
 -- sections = {
 --   lualine_a ={
 --     {
 --       'mode',
 --       icons_enabled = true,
 --       separator = nil,
 --       color = { bg = '#1984b5'}
 --     }
 --   }
 -- },
}

-- Add projects capability to telescope
require('telescope').load_extension('projects')

-- Smarter Indent setup
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
