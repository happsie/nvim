# Neovim Cheat Sheet

**leader:** `<space>`

Open this anytime with `:Cheat` or `<leader>ch`. Close with `q` or `<Esc>`.

---

## Navigation

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `h` `j` `k` `l`| left / down / up / right                         |
| `w` / `b`      | next / prev word start                           |
| `e` / `ge`     | next / prev word end                             |
| `0` / `^` / `$`| line start / first non-blank / line end          |
| `gg` / `G`     | top of file / bottom of file                     |
| `{n}G`         | jump to line `n`                                 |
| `{n}gg`        | same as above                                    |
| `<C-d>`        | half page down (centered)                        |
| `<C-u>`        | half page up (centered)                          |
| `<C-f>` / `<C-b>`| full page down / up (vim default)              |
| `<C-o>`        | jump back (jumplist)                             |
| `<C-i>`        | jump forward (jumplist)                          |
| `{` / `}`      | prev / next paragraph                            |
| `%`            | matching bracket                                 |
| `f{char}`      | find next `char` in line                         |
| `F{char}`      | find prev `char` in line                         |
| `t{char}`      | find before next `char` in line                  |
| `T{char}`      | find before prev `char` in line                  |
| `;` / `,`      | repeat last `f/F/t/T` forward / backward         |
| `*` / `#`      | search word under cursor forward / backward      |
| `n` / `N`      | next / prev search match (centered)              |

> Custom: `<C-f>` is remapped to launch **tmux-sessionizer**, not page-forward. Use `<C-b>` or `<C-d>` instead.

---

## Editing

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `i` / `a`      | insert before / after cursor                     |
| `I` / `A`      | insert at line start / end                       |
| `o` / `O`      | new line below / above                           |
| `x` / `X`      | delete char under / before cursor                |
| `r{char}`      | replace single char                              |
| `R`            | replace mode                                     |
| `cc` / `C`     | change line / change to end of line              |
| `dd` / `D`     | delete line / delete to end of line              |
| `yy` / `Y`     | yank line / yank line (capital is mapped to `+`) |
| `p` / `P`      | paste after / before                             |
| `u` / `<C-r>`  | undo / redo                                      |
| `.`            | repeat last change                               |
| `J`            | join line below (cursor stays, custom remap)     |
| `<C-a>` / `<C-x>`| increment / decrement number under cursor      |
| `>>` / `<<`    | indent / dedent line                             |
| `gcc`          | comment current line (treesitter-comments)       |
| `gc{motion}`   | comment over motion (e.g. `gcip` paragraph)      |

### Text objects

Text objects do **nothing on their own** — they're suffixes for an operator.
Prefix one of: `d` (delete), `c` (change), `y` (yank), `v` (visual select).

Examples: `di(` delete inside parens · `ci"` change inside quotes · `yiw` yank
inner word · `vap` visually select a paragraph · `dat` delete around HTML tag.

`i` = inner (excludes the surrounding chars), `a` = around (includes them).

| Object         | Description                                      |
| -------------- | ------------------------------------------------ |
| `iw` / `aw`    | inner word / a word                              |
| `iW` / `aW`    | inner WORD / a WORD (whitespace-delimited)       |
| `i"` / `a"`    | inside / around double quotes (also `'` `` ` ``) |
| `i(` / `a(`    | inside / around parens (also `ib`)               |
| `i{` / `a{`    | inside / around braces (also `iB`)               |
| `i[` / `a[`    | inside / around brackets                         |
| `it` / `at`    | inside / around tag (HTML)                       |
| `ip` / `ap`    | inner paragraph / a paragraph                    |

### Custom register mappings

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>p`    | (visual) paste over selection without yanking it |
| `<leader>y`    | yank to system clipboard (n,v)                   |
| `<leader>Y`    | yank line to system clipboard                    |
| `<leader>d`    | delete to black-hole register (don't yank)       |

### Move lines (visual mode)

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `J`            | move selection down                              |
| `K`            | move selection up                                |

---

## Search & replace

| Key                              | Description                                |
| -------------------------------- | ------------------------------------------ |
| `/{pattern}`                     | search forward                             |
| `?{pattern}`                     | search backward                            |
| `n` / `N`                        | next / prev match                          |
| `*` / `#`                        | search word under cursor                   |
| `:%s/old/new/g`                  | replace all in file                        |
| `:%s/old/new/gc`                 | replace all, confirm each                  |
| `:s/old/new/g`                   | replace all in current line                |
| `:'<,'>s/old/new/g`              | replace in last visual selection           |
| `<leader>s`                      | replace word under cursor (interactive)    |

---

## Files & pickers (Telescope)

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>pf`   | find files (entire project)                      |
| `<C-p>`        | find git-tracked files                           |
| `<leader>ps`   | grep across project (prompts for query)          |
| `<leader>pv`   | open file explorer (oil)                         |

Useful telescope pickers (run directly):

| Command                          | Description                                |
| -------------------------------- | ------------------------------------------ |
| `:Telescope buffers`             | switch between open buffers                |
| `:Telescope oldfiles`            | recent files                               |
| `:Telescope help_tags`           | search `:help` docs                        |
| `:Telescope keymaps`             | search all keymaps                         |
| `:Telescope live_grep`           | live grep with refining                    |
| `:Telescope resume`              | reopen last picker                         |

Inside a telescope picker:

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<C-n>` / `<C-p>`| next / prev result                             |
| `<CR>`         | open selection                                   |
| `<C-x>` / `<C-v>`| open in horizontal / vertical split            |
| `<C-t>`        | open in new tab                                  |
| `<C-q>`        | send all results to quickfix                     |
| `<Esc>`        | close (in normal mode press `q`)                 |

---

## Buffers, windows & tabs

### Buffers

| Key / Cmd      | Description                                      |
| -------------- | ------------------------------------------------ |
| `:e {file}`    | edit a file                                      |
| `:w` / `:wa`   | save / save all                                  |
| `:q` / `:qa`   | quit / quit all                                  |
| `:wq`          | save and quit                                    |
| `:bn` / `:bp`  | next / prev buffer                               |
| `:bd`          | delete (close) buffer                            |
| `<C-^>`        | switch to alternate buffer (last used)           |

### Windows

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `:split`       | horizontal split                                 |
| `:vsplit`      | vertical split                                   |
| `<C-w>h/j/k/l` | move to left/below/above/right window            |
| `<C-w>w`       | cycle windows                                    |
| `<C-w>+` / `<C-w>-`| increase / decrease height                   |
| `<C-w>>` / `<C-w><`| increase / decrease width                    |
| `<C-w>=`       | equalize window sizes                            |
| `<C-w>_`       | maximize height of current window                |
| `<C-w>\|`      | maximize width of current window                 |
| `<C-w>o`       | close all other windows                          |
| `<C-w>c`       | close current window                             |
| `:close`       | close window                                     |

### Tabs

| Key / Cmd      | Description                                      |
| -------------- | ------------------------------------------------ |
| `:tabnew {file}`| open file in new tab                            |
| `:tabclose`    | close current tab                                |
| `gt` / `gT`    | next / prev tab                                  |
| `{n}gt`        | go to tab `n`                                    |

---

## Harpoon (fast file marks)

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>a`    | add current file to harpoon list                 |
| `<C-e>`        | toggle quick menu (edit list, reorder, delete)   |
| `<C-h>`        | jump to harpoon slot 1                           |
| `<C-t>`        | jump to harpoon slot 2                           |
| `<C-n>`        | jump to harpoon slot 3                           |
| `<C-s>`        | jump to harpoon slot 4                           |

Inside the quick menu: edit lines like a buffer (`dd` to remove, reorder freely), `:w` to save changes.

---

## LSP (code intelligence)

Active automatically when an LSP attaches to the buffer.

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `gd`           | go to definition                                 |
| `gD`           | go to declaration (header / interface)           |
| `K`            | hover docs (popup)                               |
| `grr`          | find references (Neovim 0.11 default)            |
| `gri`          | go to implementation (Neovim 0.11 default)       |
| `grn`          | rename symbol (Neovim 0.11 default)              |
| `gra`          | code action (Neovim 0.11 default)                |
| `gO`           | document symbols (file structure)                |
| `<leader>vrr`  | references (telescope-friendly variant)          |
| `<leader>vrn`  | rename symbol                                    |
| `<leader>vca`  | code action                                      |
| `<leader>vws`  | workspace symbols (project-wide search)          |
| `<leader>vd`   | show diagnostic float at cursor                  |
| `<leader>f`    | format buffer with LSP                           |
| `<C-h>` *(insert)* | signature help (parameter hints)             |

### Diagnostics

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `[d`           | next diagnostic (note: inverted by config)       |
| `]d`           | previous diagnostic                              |
| `<leader>vd`   | show full diagnostic message under cursor        |

### Completion (blink.cmp, insert mode)

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<Tab>`        | accept selected item (or select next if just opened) |
| `<S-Tab>`      | select previous item                             |
| `<C-Space>`    | open completion menu                             |
| `<C-n>` / `<C-p>`| next / prev item                               |
| `<C-y>`        | accept selected item                             |
| `<C-e>`        | cancel / hide menu                               |

---

## Quickfix & location list

The quickfix list is where multi-file results land (LSP refs, grep, format errors).

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>q`    | open quickfix list                               |
| `<C-k>`        | next quickfix item                               |
| `<C-j>`        | prev quickfix item                               |
| `<leader>k`    | next location-list item (per-window list)        |
| `<leader>j`    | prev location-list item                          |
| `:copen` / `:ccl`| open / close quickfix                          |
| `:colder` / `:cnewer`| previous / newer quickfix list             |
| `:cdo {cmd}`   | run `cmd` on every quickfix entry                |

---

## Git (fugitive + gitsigns)

### Fugitive

| Key / Cmd      | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>gs`   | open `:Git` status buffer                        |
| `:Git blame`   | inline blame                                     |
| `:Git log`     | full log                                         |
| `:Git diff`    | working-tree diff                                |
| `:Gwrite`      | stage current file                               |
| `:Gread`       | checkout file (discard changes)                  |

Inside the status buffer: `s` stage, `u` unstage, `cc` commit, `dv` diff view, `=` inline diff.

### Diffview

| Cmd                | Description                                  |
| ------------------ | -------------------------------------------- |
| `:DiffviewOpen`    | full project diff vs HEAD (or `<ref>`)       |
| `:DiffviewClose`   | close diffview                               |
| `:DiffviewFileHistory %`| history of current file                 |

### Gitsigns (in-buffer hunks)

| Cmd / Key                  | Description                              |
| -------------------------- | ---------------------------------------- |
| `:Gitsigns next_hunk`      | jump to next hunk                        |
| `:Gitsigns prev_hunk`      | jump to prev hunk                        |
| `:Gitsigns preview_hunk`   | preview hunk in float                    |
| `:Gitsigns blame_line`     | full blame for line                      |
| `:Gitsigns stage_hunk`     | stage hunk                               |
| `:Gitsigns reset_hunk`     | reset hunk                               |
| `:Gitsigns toggle_current_line_blame` | virtual-text blame on/off     |

---

## File explorer (oil.nvim)

Replaces netrw. Open with `<leader>pv` or `:Oil`.

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<CR>`         | enter directory / open file                      |
| `-`            | go up one directory                              |
| `_`            | open CWD                                         |
| `g?`           | show all oil keymaps                             |
| `gx`           | open file with system handler                    |

Files behave like a buffer:
- type a new line → creates that file/dir on save
- delete a line → deletes that entry on save
- yank + paste → copy/move
- `:w` to apply all pending changes

---

## Which-key

A popup appears ~1s after pressing any key prefix (e.g. `<space>`, `g`, `<C-w>`, `[`)
showing every binding starting with that prefix. No keymaps to learn — just pause
mid-chord and read the hints.

`:WhichKey` opens the full list. Useful when you can't remember a binding.

---

## Search references (vim-illuminate)

Highlights every other occurrence of the symbol under the cursor (like IntelliJ).

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<A-n>`        | jump to next reference of word under cursor      |
| `<A-p>`        | jump to previous reference                       |

---

## TODO comments

`TODO:` / `FIXME:` / `HACK:` / `NOTE:` / `WARN:` / `PERF:` get highlighted in the buffer.

| Key / Cmd        | Description                                    |
| ---------------- | ---------------------------------------------- |
| `]t` / `[t`      | jump to next / prev TODO comment               |
| `:TodoTelescope` | search all TODOs project-wide via telescope    |
| `:TodoQuickFix`  | dump all TODOs to the quickfix list            |
| `:TodoLocList`   | same but to location list                      |

---

## Auto-pairs (mini.pairs)

Types the closing character when you type the opening one — `(` → `(|)`,
`{` → `{|}`, `"` → `"|"`. Backspace over the opening char deletes both.
Context-aware: `'` is not auto-closed after a letter (so apostrophes still work).

---

## Copilot

Ghost-text suggestions appear inline as you type. Tab is reserved for blink.cmp;
Copilot is bound to control/meta keys so the two don't clash.

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<C-J>` *(insert)* | accept full suggestion                       |
| `<C-L>` *(insert)* | accept next word only                        |
| `<M-]>` / `<M-[>` *(insert)* | cycle to next / prev suggestion    |
| `<C-\>` *(insert)* | dismiss current suggestion                   |

| Command        | Description                                      |
| -------------- | ------------------------------------------------ |
| `:Copilot setup` | one-time browser auth (run on first launch)    |
| `:Copilot status`| show whether Copilot is connected              |
| `:Copilot enable` / `:Copilot disable` | toggle suggestions on/off  |
| `:Copilot panel` | open a side panel with multiple suggestions    |

---

## 99 (agentic AI in Neovim)

Drives the `claude` CLI under the hood (default model `claude-sonnet-4-5`).
`search` is the main entry point — agent investigates, results land in the quickfix list.

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>9s`   | search project with a prompt (→ quickfix)        |
| `<leader>9v` *(visual)*| replace selection with AI-generated output |
| `<leader>9o`   | open last interaction (search/vibe result)       |
| `<leader>9x`   | stop all in-flight requests (kills `claude`)     |
| `<leader>9l`   | view logs of last run                            |
| `<leader>9m`   | switch model (telescope picker, session-scoped)  |
| `<leader>9p`   | switch provider (resets model to its default)    |

In the prompt buffer:
- `@` → fuzzy-pick a project file to inject as context
- `#` → reference a rule (e.g. `SKILL.md`) to inject

Project context is auto-injected from `AGENT.md` and `CLAUDE.md` walking up from
the current file's directory to the project root.

---

## Undotree

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<leader>u`    | toggle undotree panel                            |

Inside the panel: `<CR>` to revert to that state, `?` for full help.

---

## Macros, registers & marks

### Macros

| Key                | Description                                  |
| ------------------ | -------------------------------------------- |
| `q{a-z}`           | start recording into register                |
| `q`                | stop recording                               |
| `@{a-z}`           | replay macro                                 |
| `@@`               | replay last macro                            |
| `{n}@{a-z}`        | replay `n` times                             |

### Registers

| Key                | Description                                  |
| ------------------ | -------------------------------------------- |
| `"{a-z}y`          | yank into register                           |
| `"{a-z}p`          | paste from register                          |
| `"+y` / `"+p`      | yank to / paste from system clipboard        |
| `"_d`              | delete to black hole (no yank)               |
| `:reg`             | list all registers                           |

### Marks

| Key                | Description                                  |
| ------------------ | -------------------------------------------- |
| `m{a-z}`           | set mark in current buffer                   |
| `m{A-Z}`           | set global mark (jumps across files)         |
| `` `{mark} ``      | jump to exact mark position                  |
| `'{mark}`          | jump to mark line                            |
| `:marks`           | list marks                                   |

---

## Folding

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `za`           | toggle fold under cursor                         |
| `zo` / `zc`    | open / close fold                                |
| `zR` / `zM`    | open all / close all folds                       |
| `[z` / `]z`    | jump to start / end of fold                      |

---

## Insert mode

| Key            | Description                                      |
| -------------- | ------------------------------------------------ |
| `<C-c>`        | Esc (custom remap)                               |
| `<C-h>`        | LSP signature help (parameter hints)             |
| `<C-Space>`    | open completion menu (blink.cmp)                 |
| `<Tab>`        | accept blink.cmp suggestion (when menu open)     |
| `<C-y>`        | accept blink.cmp suggestion                      |
| `<C-J>`        | accept Copilot suggestion (full)                 |
| `<C-L>`        | accept Copilot suggestion (next word only)       |
| `<M-]>` / `<M-[>` | cycle Copilot suggestions                     |
| `<C-\>`        | dismiss Copilot suggestion                       |
| `<C-w>`        | delete word before cursor                        |
| `<C-u>`        | delete to start of line                          |
| `<C-r>{reg}`   | insert content of register                       |

---

## Commands

| Command          | Description                                    |
| ---------------- | ---------------------------------------------- |
| `:Cheat`         | open this cheat sheet                          |
| `:Mason`         | install/manage LSP servers, linters, formatters|
| `:Lazy`          | plugin manager UI                              |
| `:Lazy sync`     | install + update plugins                       |
| `:LspInfo`       | inspect LSP clients attached to current buffer |
| `:checkhealth`   | run diagnostic checks                          |
| `:messages`      | show recent messages / errors                  |
| `:noh`           | clear search highlight                         |
| `:e!`            | reload file from disk (discard changes)        |
| `:so`            | source current file                            |
| `:map`           | list normal-mode keymaps                       |
| `:verbose map {key}`| show where a mapping was defined            |
| `:%y+`           | yank entire file to system clipboard           |
| `:Copilot setup` | one-time browser auth for GitHub Copilot       |
| `:Copilot status`| show Copilot connection / state                |
| `:Copilot enable` / `:Copilot disable` | toggle Copilot suggestions |
| `:Copilot panel` | side panel listing alternative suggestions     |

---

## Coming from IntelliJ

| IntelliJ                          | Neovim equivalent                         |
| --------------------------------- | ----------------------------------------- |
| `⌘O` Go to Class                  | `<leader>vws` (workspace symbols)         |
| `⌘⇧O` Go to File                  | `<leader>pf` or `<C-p>`                   |
| `⌘⇧F` Find in Path                | `<leader>ps` / `:Telescope live_grep`     |
| `⌘F` Find in file                 | `/{pattern}`                              |
| `⌘R` Replace in file              | `:%s/old/new/g`                           |
| `⌘E` Recent Files                 | `:Telescope oldfiles`                     |
| `⌘B` / `⌘Click` Go to Declaration | `gd`                                      |
| `⌥F7` Find Usages                 | `grr` or `<leader>vrr`                    |
| `⇧F6` Rename                      | `grn` or `<leader>vrn`                    |
| `⌥⏎` Show Intention / Quick Fix   | `gra` or `<leader>vca` (code action)      |
| `⌘⌥L` Reformat Code               | `<leader>f`                               |
| `⌘/` Comment line                 | `gcc`                                     |
| `⌘⇧/` Block comment               | `gc` over selection                       |
| `⌘J` / `F1` Quick Documentation   | `K` (hover)                               |
| `⌘P` Parameter Info               | `<C-h>` in insert mode                    |
| `⌘F12` File Structure             | `gO` (document symbols)                   |
| `⌘1` Project tool window          | `<leader>pv` (oil)                        |
| `⌘9` Git tool window              | `<leader>gs` (fugitive status)            |
| `⌘K` Commit                       | `:Git commit` (or `cc` in fugitive status)|
| `⌘E` Switcher (open files)        | `:Telescope buffers`                      |
| `⌘[` / `⌘]` Back / Forward        | `<C-o>` / `<C-i>` (jumplist)              |
| `⌘L` Go to Line                   | `{n}G` or `:`{n}                          |
| `⌥⇧↑/↓` Move Line                 | visual mode `K` / `J`                     |
| `⌘D` Duplicate Line               | `yyp`                                     |
| `⌘W` Extend Selection             | use text objects (`viw`, `vi{`, `vip` …)  |
| `⌥Click` Multi-caret              | `<C-v>` block + `I`/`A` then `<Esc>`      |
| `⌘⇧A` Find Action                 | `:Telescope keymaps` / `:Telescope commands` |
| Bookmarks                         | harpoon (`<leader>a`, `<C-e>`)            |
| Local History                     | `<leader>u` (undotree)                    |
| Problems window                   | `:copen` (quickfix) after LSP populates it|
| Run / Debug                       | not configured — would need DAP plugin    |
| Database tool                     | not configured                            |

---

*Close: `q` or `<Esc>`*
