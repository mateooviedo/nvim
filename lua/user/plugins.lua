local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-lualine/lualine.nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")

	-- Devil Icons
	use("kyazdani42/nvim-web-devicons")

	-- Nvim tree
	use("kyazdani42/nvim-tree.lua")

	-- Comments
	use({ "numToStr/Comment.nvim" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Bufferline
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

	-- Togleterm
	use({ "akinsho/toggleterm.nvim", branch = "main" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzf-native.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")

	-- Null-LS
	use("jose-elias-alvarez/null-ls.nvim")

	-- ColorSchemes
	use("embark-theme/vim")
	use("Mofiqul/adwaita.nvim")
	use("sainnhe/gruvbox-material")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Feline
	use({ "feline-nvim/feline.nvim", branch = "0.5-compat" })

	-- Tabnine
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Spectre
	use({ "windwp/nvim-spectre", require = "nvim-lua/plenary.nvim" })

	-- golang
	-- use("fatih/vim-go")

	--debugging
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("nvim-telescope/telescope-dap.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
