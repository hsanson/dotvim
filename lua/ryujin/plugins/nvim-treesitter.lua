return {
  "nvim-treesitter/nvim-treesitter",
  -- Switch to main branch for the new architecture
  branch = "main",
  dependencies = {
    "cathaysia/tree-sitter-asciidoc",
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main"
    }
  },
  build = ":TSUpdate",
  config = function()
    -- New architectural way to require treesitter
    local treesitter = require("nvim-treesitter")
    local parser_config = require("nvim-treesitter.parsers")

    -- Custom Parser Configurations

    -- Asciidoc
    parser_config.asciidoc = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = { "tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c" },
        revision = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
        requires = { "asciidoc_inline" },
        queries = "queries/asciidoc/",
      },
      tier = 2,
    }

    -- Asciidoc Inline
    parser_config.asciidoc_inline = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = { "tree-sitter-asciidoc_inline/src/parser.c", "tree-sitter-asciidoc_inline/src/scanner.c" },
        revision = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
        queries = "queries/asciidoc_inline",
      },
      tier = 2,
    }

    treesitter.setup({
      -- Cleaned up duplicates from your list
      ensure_installed = {
        "awk", "asciidoc", "bash", "bibtex", "c", "cmake", "cpp", "css", "csv",
        "dart", "diff", "dockerfile", "git_config", "git_rebase", "gitcommit",
        "gitignore", "gnuplot", "go", "gomod", "gosum", "gowork", "gpg",
        "graphql", "groovy", "helm", "html", "http", "hurl", "ini", "java",
        "javadoc", "javascript", "jinja", "jinja_inline", "jq", "json", "json5",
        "julia", "kotlin", "kulala_http", "latex", "lua", "luadoc", "make",
        "markdown", "markdown_inline", "mermaid", "muttrc", "php", "po",
        "promql", "pug", "python", "readline", "regex", "ruby", "rust", "sql",
        "ssh_config", "swift", "terraform", "tmux", "toml", "tsv", "typescript",
        "typst", "vala", "vim", "vimdoc", "vue", "xml", "yaml", "zathurarc",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          node_decremental = "<s-cr>",
        },
      },
      -- Textobjects still works via setup if the plugin is loaded
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
  end,
}
