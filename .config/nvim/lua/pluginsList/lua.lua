-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
        use "nvim-lua/plenary.nvim"
        use {'akinsho/flutter-tools.nvim'}
        use "norcalli/nvim-base16.lua"
        use "kyazdani42/nvim-web-devicons"
        use "preservim/nerdtree"
        use "lewis6991/gitsigns.nvim"
        use "glepnir/galaxyline.nvim"
        use "907th/vim-auto-save"
        use "nvim-treesitter/nvim-treesitter"
        use "norcalli/nvim-colorizer.lua"
        use "ryanoasis/vim-devicons"
        use "mhartington/formatter.nvim"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use "tweekmonster/startuptime.vim"
        use "onsails/lspkind-nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"
        use "karb94/neoscroll.nvim"
use "projekt0n/github-nvim-theme"
        use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
        use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets       use "nekonako/xresources-nvim"
        use {
          'romgrk/barbar.nvim',
          requires = {'kyazdani42/nvim-web-devicons'}
        }
        use { 'simrat39/rust-tools.nvim' }
    end
)
