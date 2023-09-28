return {
  "hsanson/ale",
  dev = true,
  lazy = false,
  config = function()
    local g = vim.g

    g.ale_disable_lsp = 'auto'
    g.ale_sign_info = ''
    g.ale_sign_error = ''
    g.ale_sign_warning = ''
    g.ale_sign_priority = 4
    g.ale_open_list = 0
    g.ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
    g.ale_echo_msg_info_str = ''
    g.ale_echo_msg_error_str = ''
    g.ale_echo_msg_warning_str = ''
    g.ale_writegood_options = '--no-passive'
    g.ale_virtualtext_cursor = 0
    g.ale_virtualtext_prefix = ' '
    g.ale_floating_preview = 0
    g.ale_hover_to_preview = 0
    g.ale_hover_to_floating_preview = 0
    g.ale_detail_to_floating_preview = 0
    g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰'}
    g.ale_set_signs = 0
    g.ale_sign_column_always = 0
    g.ale_python_auto_pipenv = 1
    g.ale_use_neovim_diagnostics_api = 1

    g.ale_kotlin_languageserver_executable = '/home/ryujin/Apps/KotlinLanguageServer/server/build/install/server/bin/kotlin-language-server'
    -- g.ale_java_javalsp_executable = '/home/ryujin/Apps/java-language-server/dist/lang_server_linux.sh'
    g.ale_sh_bashate_options = '-i E003 --max-lin-length 100'
    g.ale_reason_ls_executable = '/home/ryujin/Apps/rls-linux/reason-language-server'
    g.ale_ruby_rubocop_auto_correct_all = 1
    g.ale_java_eclipselsp_path = '~/Apps/jdt'
    g.ale_java_eclipselsp_executable = '/usr/lib/jvm/java-17-amazon-corretto/bin/java'

    vim.cmd([[

      let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'bib': ['bibclean'],
        \   'python': ['yapf'],
        \   'openapi': ['prettier'],
        \   'yaml': ['prettier'],
        \   'ruby': ['rubocop'],
        \   'kotlin': ['ktlint']
      \}

      let g:ale_linters = {
        \   'ansible': ['ansible-lint'],
        \   'bib': ['bibclean'],
        \   'c': ['clangd'],
        \   'dockerfile': ['dockerfile_lint'],
        \   'go': ['gofmt', 'golint', 'go vet', 'golangserver'],
        \   'groovy': ['android'],
        \   'help': [],
        \   'java': ['eclipselsp'],
        \   'javascript': ['eslint'],
        \   'kotlin': ['ktlint', 'languageserver'],
        \   'latex': ['proselint', 'chktex', 'lacheck'],
        \   'mail': ['proselint', 'write-good'],
        \   'markdown': ['markdownlint'],
        \   'openapi': ['yamllint', 'ibm-validator'],
        \   'plaintex': ['proselint', 'chktex', 'lacheck'],
        \   'python': ['flake8', 'pylint', 'jedils'],
        \   'ruby': ['solargraph', 'rubocop', 'ruby'],
        \   'rust': ['analyzer'],
        \   'terraform': ['checkov', 'terraform', 'tflint', 'terraform_ls'],
        \   'tex': ['proselint', 'chktex', 'lacheck'],
        \   'text': ['proselint', 'write-good'],
        \   'vim': ['vimls', 'vint', 'ale_custom_linting_rules'],
        \   'vue': ['vls'],
        \   'xml': ['android'],
        \   'yaml': ['yamllint', 'yaml-language-server']
      \}

      let g:ale_pattern_options = {
      \   '.gitlab-ci\.yml$': {
      \       'ale_linters': ['gitlablint', 'yamllint'],
      \   },
      \}

      let g:ale_linter_aliases = {
            \ 'asciidoctor': 'asciidoc'
            \}
    ]])
  end
}
