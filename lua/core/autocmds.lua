local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-------------------------------------------------------------------------------
-- vim-android
augroup('GradleGroup', {})

autocmd('BufWrite', {
  group = 'GradleGroup',
  pattern = { 'build.gradle' },
  command = "call gradle#sync()"
})

-------------------------------------------------------------------------------
augroup('SyntaxGroup', {})

-- Highlight Zenkaku blank spaces
autocmd('ColorScheme', {
  group = 'SyntaxGroup',
  pattern = { '*' },
  callback = function()
    vim.api.nvim_set_hl(0, 'ZenkakuSpace', { fg = "lightgray", standout = true })
    vim.api.nvim_exec([[call matchadd('ZenkakuSpace', '[\u200B\u3000]')]], true)
  end
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })

autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Build help tags whenever a plugin is installed or updated.
autocmd("PackChanged", {
  callback = function(ev)
    local _, kind = ev.data.spec.name, ev.data.kind
    if kind == 'update' or kind == 'install' then
      local doc_dir = ev.data.path .. '/doc'
      if vim.fn.isdirectory(doc_dir) == 1 then
        vim.cmd('helptags ' .. doc_dir)
      end
    end
  end,
})

-- Build vellum plugin binary when installed or updated.
autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "vellum.nvim" then
      if kind == 'update' or kind == 'install' then
        vim.system({ "npm", "ci" }, {
          cwd = ev.data.path .. "/render",
        }):wait()
      end
    end
  end,
})

-- Disable ALE in snacks picker input. This is required because for
-- some unknown reason if enabled with Neovim diagnostics then
-- when typing in live_grep provider the cursor gets moved randomly
-- one character back making typing impossible.
-- https://github.com/neovim/neovim/issues/38632
augroup('SnacksGroup', { clear = true })
autocmd('FileType', {
  group = 'SnacksGroup',
  pattern = { 'snacks_picker_input' },
  command = "ALEDisableBuffer"
})

-------------------------------------------------------------------------------
-- Support Ghostty progress bar
-- https://www.reddit.com/r/neovim/comments/1rcvliq/comment/o73wdkc/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    local value = ev.data.params.value or {}
    if not value.kind then return end

    local status = value.kind == "end" and 0 or 1
    local percent = value.percentage or 0

    local osc_seq = string.format("\27]9;4;%d;%d\a", status, percent)

    if os.getenv("TMUX") then
      osc_seq = string.format("\27Ptmux;\27%s\27\\", osc_seq)
    end

    io.stdout:write(osc_seq)
    io.stdout:flush()
  end,
})

-- Set LSP `foldexpr` if LSP is attached and it supports folding.
vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach", "LspDetach" }, {
  callback = function(ctx)
    local detached_client_id = ctx.event == "LspDetach" and ctx.data and ctx.data.client_id or nil
    local has_lsp_folding = false

    for _, client in ipairs(vim.lsp.get_clients({ bufnr = ctx.buf })) do
      if client.id ~= detached_client_id and client:supports_method("textDocument/foldingRange") then
        has_lsp_folding = true
        break
      end
    end

    local foldexpr = has_lsp_folding
      and "v:lua.vim.lsp.foldexpr()"
      or "v:lua.vim.treesitter.foldexpr()"

    for _, win in ipairs(vim.fn.win_findbuf(ctx.buf)) do
      vim.api.nvim_set_option_value("foldmethod", "expr", { win = win, scope = "local" })
      vim.api.nvim_set_option_value("foldexpr", foldexpr, { win = win, scope = "local" })
    end
  end,
})
