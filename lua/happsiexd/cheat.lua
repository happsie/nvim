local M = {}

function M.open()
    local path = vim.fn.stdpath("config") .. "/CHEATSHEET.MD"

    if vim.fn.filereadable(path) == 0 then
        vim.notify("Cheat sheet not found at " .. path, vim.log.levels.ERROR)
        return
    end

    local lines = vim.fn.readfile(path)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
    vim.api.nvim_set_option_value("filetype", "markdown", { buf = buf })
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
    vim.api.nvim_set_option_value("readonly", true, { buf = buf })

    local width = math.min(100, math.floor(vim.o.columns * 0.8))
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        title = " Cheat Sheet ",
        title_pos = "center",
        width = width,
        height = height,
        row = row,
        col = col,
    })

    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
    vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end

vim.api.nvim_create_user_command("Cheat", M.open, { desc = "Open cheat sheet" })
vim.keymap.set("n", "<leader>ch", M.open, { desc = "Open cheat sheet" })

return M
