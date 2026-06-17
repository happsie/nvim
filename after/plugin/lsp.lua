-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "lua_ls", "gopls" },
})

-- Shared on_attach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, remap = false, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
    map("n", "K", vim.lsp.buf.hover, "LSP: hover docs")
    map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "LSP: workspace symbols")
    map("n", "<leader>vd", vim.diagnostic.open_float, "LSP: diagnostic float")
    map("n", "[d", vim.diagnostic.goto_next, "LSP: next diagnostic")
    map("n", "]d", vim.diagnostic.goto_prev, "LSP: prev diagnostic")
    map("n", "<leader>vca", vim.lsp.buf.code_action, "LSP: code action")
    map("n", "<leader>vrr", vim.lsp.buf.references, "LSP: references")
    map("n", "<leader>vrn", vim.lsp.buf.rename, "LSP: rename")
    map("i", "<C-h>", vim.lsp.buf.signature_help, "LSP: signature help")
  end,
})

-- LSP server configs using vim.lsp.config (Neovim 0.11 native)
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- jdtls (installed via mason)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(ev)
    local root = vim.fs.root(ev.buf, { "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
    if root then
      local workspace = vim.fn.expand("~/.local/share/jdtls-workspace/") .. vim.fn.fnamemodify(root, ":t")
      local settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "/opt/homebrew/opt/java/libexec/openjdk.jdk/Contents/Home",
                default = true,
              },
            },
          },
        },
      }
      vim.lsp.start({
        name = "jdtls",
        cmd = { "jdtls", "--data", workspace },
        root_dir = root,
        capabilities = capabilities,
        settings = settings,
        on_init = function(client)
          client.notify("workspace/didChangeConfiguration", { settings = settings })
        end,
      })
    end
  end,
})

-- Enable the servers
vim.lsp.enable({ "ts_ls", "gopls", "lua_ls" })

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "H",
      [vim.diagnostic.severity.INFO] = "I",
    },
  },
})
