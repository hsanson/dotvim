return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "cathaysia/tree-sitter-asciidoc",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    local nvim_treesitter = require("nvim-treesitter.configs")
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    nvim_treesitter.setup({
      ensure_installed = {
        "awk",
        "asciidoc",
        "bash",
        "bibtex",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "dart",
        "diff",
        "dockerfile",
        "git_config",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitcommit",
        "gitignore",
        "gitignore",
        "gnuplot",
        "gnuplot",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gpg",
        "graphql",
        "groovy",
        "helm",
        "helm",
        "html",
        "http",
        "hurl",
        "ini",
        "java",
        "javadoc",
        "javascript",
        "jinja",
        "jinja_inline",
        "jq",
        "json",
        "json5",
        "julia",
        "kotlin",
        "kulala_http",
        "latex",
        "lua",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "muttrc",
        "php",
        "po",
        "promql",
        "pug",
        "python",
        "readline",
        "readline",
        "regex",
        "ruby",
        "rust",
        "sql",
        "ssh_config",
        "swift",
        "terraform",
        "terraform",
        "tmux",
        "tmux",
        "toml",
        "toml",
        "tsv",
        "typescript",
        "typst",
        "typst",
        "vala",
        "vim",
        "vim",
        "vimdoc",
        "vimdoc",
        "vue",
        "vue",
        "xml",
        "yaml",
        "zathurarc",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
      modules = {},
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
          },
          include_surrounding_whitespace = true,
        },
      },
    })

    ---@diagnostic disable-next-line: inject-field
    --- Install go parser from specific revision that is needed
    --- for neotest-golang.
    ---
    --- To check what revision to install see:
    ---  https://github.com/nvim-treesitter/nvim-treesitter/blob/main/lua/nvim-treesitter/parsers.lua#L770
    ---
    --- To check if the correct vesion is installed:
    ---
    ---   cat ~/.local/share/nvim/lazy/nvim-treesitter/parser-info/go.revision
    parser_config.go = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-go.git",
        files = { "src/parser.c" },
        revision = "2346a3ab1bb3857b48b29d779a1ef9799a248cd7",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }

    ---@diagnostic disable-next-line: inject-field
    parser_config.asciidoc = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = { "tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }
    ---@diagnostic disable-next-line: inject-field
    parser_config.asciidoc_inline = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = { "tree-sitter-asciidoc_inline/src/parser.c", "tree-sitter-asciidoc_inline/src/scanner.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }
  end,
}
