# nvim

**nvim version >= 9**

* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [packer](https://github.com/wbthomason/packer.nvim)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
* [tree-sitter](https://github.com/tree-sitter/tree-sitter)
* [harpoon](https://github.com/ThePrimeagen/harpoon)
* [undotree](https://github.com/mbbill/undotree)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
* [catppuccin](https://github.com/catppuccin/nvim)


## install

1. install neovim
2. [install packer](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart)
3. clone this repo to `~/.config/nvim`
4. open `packer.lua` in nvim and run `:so` 
5. run `:PackerSync` when inside the `packer.lua`
6. run `:TSUpdate` 


## keybinds (normal mode)
leader: <space>

| Key           | Description         |
| ------------- | ------------------- |
| Space-a       | add to harpoon      |
| Ctrl-e        | open harpoon        |
| Space-pv      | project files       |
| Space-pf      | search files        |
| %             | create file         |
| d             | create dir          |
| mt            | target directory    |
| mf            | file to be moved    |
| mm            | move file           |
| vib           | select inside ""/() |
| viB           | select inside {}    |
| gd            | go to definition    |
| gr            | find references     |
| Ctrl-o        | go back from gd     |
| /             | search in file      |
| n             | go to next (/)      |
| o             | add new line under  |
| O             | add new line above  |
| Space-s       | replace str         |
| Space-f       | format file         |
| Ctrl-c        | Esc                 |
| Ctrl-ww       | switch to quickfix  |
| Space-q       | open quickfix       |
| K             | hover (tooltip)     |
| Space-vrn     | rename variable     |
| [d            | go to next error    |
| ]d            | go to prev error    |
| f{var}        | find next in line * |
| F{var}        | find prev in line * |
| q{register}   | record macro        | 
| @{reigster}   | play macro          | 
| Ctrl+u        | page up             |
| Ctrl+d        | page down           |
| gl            | open diagnostics    |
| gr            | references          |
| gs            | signature tooltip   |
| go            | type definition     |
| gi            | goto implementation |
| Space-vrr     | variable references |
| Space-vws     | query all files     |
| Space-q       | open quickfix       |
| ctrl-w +      | zoom in window      |
| ctrl-w -      | zoom out window     |
| ctrl-w j/k/l/h| change window       |
| ctrl-w d      | diagnostic          |
| gcc           | comment current line|
| gc            | add comment         |

## keybinds (visual mode)
| Key           | Description               |
| ------------- | ------------------------- |
| J             | move code down            |
| K             | move code up              |
| viw           | select word               |
| viW           | select all text until ws  |

## keybinds (insert mode)
| Key           | Description              |
| ------------- | ------------------------ |
| ctrl-h        | signature help (tooltip) |

## cmd
| Key           | Description         |
| ------------- | ------------------- |
| :Mason        | install lsp/lint/etc|
| :%/str/re_str | search and replace  |
| :ccl          | close quickfix list |
| :copen        | open quickfix list  |
| :colder       | older quickfix list |
| :map          | keybinds            |
| :split        | horizontal win split|
| :vsplit       | vertical win split  |
| :close        | close window        |
