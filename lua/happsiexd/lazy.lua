local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "macchiato",
            transparent_background = true,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    "sindrets/diffview.nvim",
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    "mbbill/undotree",
    "ThePrimeagen/vim-be-good",

    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
    },
    "williamboman/mason-lspconfig.nvim",

    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = { preset = "super-tab" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    treesitter_highlighting = false,
                },
            },
            signature = {
                window = { treesitter_highlighting = false },
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin",
                section_separators = "",
                component_separators = "",
                icons_enabled = true,
            },
            sections = {
                lualine_c = {
                    { "filename", path = 1 },
                },
            },
        },
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            view_options = { show_hidden = true },
        },
    },

    {
        "echasnovski/mini.pairs",
        version = "*",
        event = "InsertEnter",
        opts = {},
    },

    {
        "github/copilot.vim",
        init = function()
            vim.g.copilot_no_tab_map = true
        end,
        config = function()
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
                silent = true,
                desc = "Accept Copilot suggestion",
            })
            vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", { desc = "Accept next word from Copilot" })
            vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
            vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Prev Copilot suggestion" })
            vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
        end,
    },
})
