-- Ensure packer is installed and install other packages
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use {"norcalli/nvim-colorizer.lua"}
  use { "kyazdani42/nvim-web-devicons"}    
  use { "kyazdani42/nvim-tree.lua"}
  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons"}
  use { "moll/vim-bbye"}
  use { "nvim-lua/plenary.nvim"}

  -- Pretty status bar                                                                                                                                                
  use {                                                                                                                                                               
            'nvim-lualine/lualine.nvim',                                                                                                                                
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }                                                                                                   
  }                                                                                                                                                                   
  
  -- Use Ctrl+fp to list recent git projects                                                                                                                          
  use {                                                                                                                                                               
	"ahmedkhalf/project.nvim",                                                                                                                                  
		config = function() require("project_nvim").setup {} 
		end                                                                                                                
  }

  use { "lewis6991/impatient.nvim"} -- faster startup
  use { "lukas-reineke/indent-blankline.nvim"} -- smarter indent

  -- alpha dashboard
  --use {
  --	'goolord/alpha-nvim',
  --	  	requires = { 'kyazdani42/nvim-web-devicons' },
  --		  config = function ()
  --              	require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --            end
  --  }

  use {
    'goolord/alpha-nvim',
    requires = { 'echasnovski/mini.icons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
 -- use { "neovim/nvim-lspconfig"} -- enable LSP
  use { "williamboman/mason.nvim"}
  use { "williamboman/mason-lspconfig.nvim"}
--  use {
--		"jose-elias-alvarez/null-ls.nvim",
--		config = function()
--			require("null-ls").setup()
--		end,
--		requires = { "nvim-lua/plenary.nvim" },
--	}
  -- Quick word search under cursor alt+p and alt+n
  use { "RRethy/vim-illuminate"}

  -- Telescope
  use { "nvim-telescope/telescope.nvim"}

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter"}

  -- Git
  use { "lewis6991/gitsigns.nvim"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
