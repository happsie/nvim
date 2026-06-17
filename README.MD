# nvim

**Neovim version >= 0.11**

## Dependencies

* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [lazy.nvim](https://github.com/folke/lazy.nvim)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
* [tree-sitter](https://github.com/tree-sitter/tree-sitter)
* [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
* [undotree](https://github.com/mbbill/undotree)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* native LSP (Neovim 0.11 `vim.lsp.config`) + [mason](https://github.com/williamboman/mason.nvim)
* [blink.cmp](https://github.com/saghen/blink.cmp)
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
* [lualine](https://github.com/nvim-lualine/lualine.nvim)
* [oil.nvim](https://github.com/stevearc/oil.nvim)
* [catppuccin](https://github.com/catppuccin/nvim)


## Install

1. install neovim (>= 0.11)
2. clone this repo to `~/.config/nvim`
3. start `nvim` — lazy.nvim bootstraps itself and installs all plugins on first launch
4. run `:Lazy sync` if anything is missing afterwards
5. run `:Mason` to install language servers (`ts_ls`, `lua_ls`, `gopls`, etc.)
6. Make sure ripgrep is installed on the system


## Cheat sheet

Keybinds and commands live in [`CHEATSHEET.MD`](./CHEATSHEET.MD).

Inside nvim, open it as a floating window with `:Cheat` or `<leader>ch` (close with `q` or `<Esc>`).
