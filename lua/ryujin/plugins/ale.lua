return {
  dir = "~/Projects/vim/ale",
  dev = true,
  lazy = false,
  config = function()
    local g = vim.g

    g.ale_disable_lsp = 'auto'
    g.ale_sign_info = g.symbol_info
    g.ale_sign_error = g.symbol_error
    g.ale_sign_warning = g.symbol_warn
    g.ale_sign_priority = 4
    g.ale_open_list = 0
    g.ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
    g.ale_echo_msg_info_str = g.symbol_info
    g.ale_echo_msg_error_str = g.symbol_error
    g.ale_echo_msg_warning_str = g.symbol_warn
    g.ale_writegood_options = '--no-passive --no-weasel --no-tooWordy --no-adverb'
    g.ale_virtualtext_cursor = 1
    g.ale_virtualtext_prefix = ' '
    g.ale_floating_preview = 0
    g.ale_hover_to_preview = 0
    g.ale_hover_to_floating_preview = 0
    g.ale_detail_to_floating_preview = 0
    g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰'}
    g.ale_set_signs = 1
    g.ale_sign_column_always = 1
    g.ale_python_auto_pipenv = 1
    g.ale_use_neovim_diagnostics_api = 1
    g.ale_sh_bashate_options = '-i E003 --max-lin-length 100'
    g.ale_ruby_rubocop_auto_correct_all = 1
    g.ale_go_golangci_lint_package = 1

    g.ale_fixers = {
      ["*"] = {'remove_trailing_lines', 'trim_whitespace'},
      bib = {'bibclean'},
      python = {'yapf'},
      openapi = {'prettier'},
      yaml = {'prettier'},
      ruby = {'rubocop'},
      kotlin = {'ktlint'}
    }

    g.ale_linters = {
       ansible = {'ansible-lint'},
       bib = {'bibclean'},
       c = {'clangd'},
       dockerfile = {'dockerfile_lint'},
       go = {'golangci-lint'},
       help = {},
       hurl = {'hurlfmt'},
       javascript = {'eslint'},
       kotlin = {'ktlint'},
       latex = {'proselint', 'lacheck'},
       mail = {'proselint', 'write-good'},
       markdown = {'markdownlint'},
       openapi = {'yamllint', 'ibm-validator', 'vacuum'},
       plaintex = {'proselint', 'chktex', 'lacheck'},
       python = {'flake8', 'pylint', 'jedils'},
       ruby = {'rubocop', 'ruby'},
       rust = {'analyzer'},
       terraform = {'checkov', 'terraform', 'tflint'},
       tex = {'proselint', 'lacheck', 'chktex'},
       text = {'proselint', 'write-good'},
       vim = {'vint', 'ale_custom_linting_rules'},
       yaml = {'yamllint', 'yaml-language-server'}
    }

    g.ale_pattern_options = {
      ['.gitlab-ci\\.yml$'] = {
        ale_linters = { 'gitlablint', 'yamllint' }
      }
    }

    g.ale_linter_aliases = {
      asciidoctor = 'asciidoc'
    }
  end
}
