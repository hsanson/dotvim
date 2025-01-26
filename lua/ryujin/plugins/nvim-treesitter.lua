return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    local nvim_treesitter = require("nvim-treesitter.configs")

    nvim_treesitter.setup {
      ensure_installed = {
        "bash", "awk", "bibtex", "cmake", "cpp", "csv", "css", "dart", "diff", "dockerfile",
        "git_config", "git_rebase", "gitcommit", "gitignore", "gnuplot", "gomod", "gosum",
        "gpg", "graphql", "helm", "html", "http", "hurl", "ini", "java", "javascript", "jq",
        "json", "json5", "julia", "kotlin", "latex", "lua", "luadoc", "markdown", "typst",
        "markdown_inline", "muttrc", "po", "regex", "ruby", "sql", "swift", "terraform",
        "tmux", "toml", "tsv", "vim", "vimdoc", "vue", "xml", "yaml", "c", "lua", "python"
      },
      sync_install = false,
      auto_install = true,
      ignore_install = { },
      highlight = {
        enable = true,
        disable = { },
        additional_vim_regex_highlighting = false,
      },
      modules = {},
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = { query = "@scope", query_group = "locals" },
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },
      },
    }
  end
}
