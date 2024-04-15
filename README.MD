# nvim

**nvim version >= 9**

* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [packer](https://github.com/wbthomason/packer.nvim)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
* [rose-pine](https://github.com/rose-pine/neovim)
* [tree-sitter](https://github.com/tree-sitter/tree-sitter)
* [harpoon](https://github.com/ThePrimeagen/harpoon)
* [undotree](https://github.com/mbbill/undotree)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)


## install

1. install neovim
2. [install packer](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart)
3. clone this repo to `~/.config/nvim`
4. open `packer.lua` in nvim and run `:so` 
5. run `:PackerSync` when inside the `packer.lua`
6. run `:TSUpdate` 


## keybinds
| Key           | Description         |
| ------------- | ------------------- |
| Space-a       | add to harpoon      |
| Ctrl-e        | open harpoon        |
| Space-pv      | project files       |
| Space-pf      | search files        |
| %             | create file         |
| d             | create dir          |
| vib           | select inside ""/() |
| viB           | select inside {}    |
| gd            | go to definition    |
| Ctrl-o        | go back from gd     |
| /             | search in file      |
| n             | go to next (/)      |
| o             | add new line under  |
| O             | add new line above  |

## cmd
| Key           | Description         |
| ------------- | ------------------- |
| :Mason        | install lsp/lint/etc|
| :%/str/re_str | search and replace  |
