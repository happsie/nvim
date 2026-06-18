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
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
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
        config = function()
            local function pepe()
                local d = vim.diagnostic.count(0)
                local errors = d[vim.diagnostic.severity.ERROR] or 0
                local warns = d[vim.diagnostic.severity.WARN] or 0
                if errors > 0 then return "🤬 feels bad man" end
                if warns > 0 then return "😬 feels weird man" end
                return "🐸 feels good man"
            end

            require("lualine").setup({
                options = {
                    theme = "catppuccin-macchiato",
                    section_separators = "",
                    component_separators = "",
                    icons_enabled = true,
                },
                sections = {
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { pepe, "encoding", "filetype" },
                },
            })
        end,
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
        },
    },

    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("illuminate").configure({
                providers = { "lsp", "regex" },
                delay = 100,
            })
            vim.keymap.set("n", "<a-n>", function() require("illuminate").goto_next_reference() end,
                { desc = "Next reference of word" })
            vim.keymap.set("n", "<a-p>", function() require("illuminate").goto_prev_reference() end,
                { desc = "Prev reference of word" })
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {},
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO comment" },
        },
    },

    {
        "ThePrimeagen/99",
        config = function()
            local _99 = require("99")
            _99.setup({
                provider = _99.Providers.ClaudeCodeProvider,
                model = "claude-sonnet-4-5",
                tmp_dir = "./tmp",
                md_files = { "AGENT.md", "CLAUDE.md" },
            })

            vim.keymap.set("v", "<leader>9v", function() _99.visual() end,
                { desc = "99: replace visual selection with prompt" })
            vim.keymap.set("n", "<leader>9s", function() _99.search() end,
                { desc = "99: search project with prompt" })
            vim.keymap.set("n", "<leader>9o", function() _99.open() end,
                { desc = "99: open last interaction" })
            vim.keymap.set("n", "<leader>9x", function() _99.stop_all_requests() end,
                { desc = "99: stop all in-flight requests" })
            vim.keymap.set("n", "<leader>9l", function() _99.view_logs() end,
                { desc = "99: view logs" })
            vim.keymap.set("n", "<leader>9m", function()
                require("99.extensions.telescope").select_model()
            end, { desc = "99: select model (telescope)" })
            vim.keymap.set("n", "<leader>9p", function()
                require("99.extensions.telescope").select_provider()
            end, { desc = "99: select provider (telescope)" })
        end,
    },

    {
        "github/copilot.vim",
        enabled = false,
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
