return {
  -- dir = "~/Projects/vim/ale",
  "hsanson/ale",
  dev = true,
  lazy = false,
  config = function()
    local g = vim.g

    require("ale").setup({

      disable_lsp = "auto",
      sign_info = g['symbol_info'] or 'ℹ',
      sign_error = g['symbol_error'] or '✗',
      sign_warning = g['symbol_warn'] or '⚠',
      sign_priority = 4,
      open_list = 0,
      echo_msg_format = "%severity% [%linter%] (%code%) - %s",
      echo_msg_info_str = g['symbol_info'] or 'ℹ',
      echo_msg_error_str = g['symbol_error'] or '✗',
      echo_msg_warning_str = g['symbol_warn'] or '⚠',
      writegood_options = "--no-passive --no-weasel --no-tooWordy --no-adverb",
      virtualtext_cursor = 1,
      virtualtext_prefix = " ",
      floating_preview = 0,
      hover_to_preview = 0,
      hover_to_floating_preview = 0,
      detail_to_floating_preview = 0,
      floating_window_border = { "│", "─", "╭", "╮", "╯", "╰" },
      signs = true,
      sign_column_always = 1,
      python_auto_pipenv = 1,
      use_neovim_diagnostics_api = 1,
      sh_bashate_options = "-i E003 --max-lin-length 100",
      ruby_rubocop_auto_correct_all = 1,
      fix_on_save = 0,
      lua_stylua_options = "--indent-type Spaces --indent-width 2",

      fixers = {
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
        go = { "gofmt", "goimports" },
        http = { "kulala_fmt" },
        bib = { "bibclean" },
        python = { "yapf" },
        lua = { "stylua" },
        openapi = { "prettier" },
        yaml = { "prettier" },
        ruby = { "rubocop" },
        kotlin = { "ktlint" },
      },

      linters = {
        ansible = { "ansible-lint" },
        bib = { "bibclean" },
        c = { "clangd" },
        dockerfile = { "dockerfile_lint" },
        go = { "golangci-lint" },
        help = {},
        hurl = { "hurlfmt" },
        javascript = { "eslint" },
        kotlin = { "ktlint" },
        latex = { "proselint", "lacheck" },
        mail = { "proselint", "write-good" },
        markdown = { "markdownlint" },
        openapi = { "yamllint", "ibm-validator", "vacuum" },
        plaintex = { "proselint", "chktex", "lacheck" },
        python = { "flake8", "pylint", "jedils" },
        ruby = { "rubocop", "ruby" },
        rust = { "analyzer" },
        terraform = { "checkov", "terraform", "tflint" },
        tex = { "proselint", "lacheck", "chktex" },
        text = { "proselint", "write-good" },
        vim = { "vint", "ale_custom_linting_rules" },
        yaml = { "yamllint", "yaml-language-server" },
      },

      pattern_options = {
        [".gitlab-ci\\.yml$"] = {
          ale_linters = { "gitlablint", "yamllint" },
        },
      },

      linter_aliases = {
        asciidoctor = "asciidoc",
      },
    })
  end,
}
