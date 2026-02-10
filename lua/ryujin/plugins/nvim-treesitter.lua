return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  dependencies = {
    "cathaysia/tree-sitter-asciidoc",
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main"
    }
  },
  config = function()
    -- New architectural way to require treesitter
    local treesitter = require("nvim-treesitter")
    local textobjects = require("nvim-treesitter-textobjects")
    local parser_config = require("nvim-treesitter.parsers")

    -- Install parsers
    local parsers = {
      "awk", "bash", "bibtex", "c", "cmake", "cpp", "css", "csv",
      "dart", "diff", "dockerfile", "git_config", "git_rebase", "gitcommit",
      "gitignore", "gnuplot", "go", "gomod", "gosum", "gowork", "gpg",
      "graphql", "groovy", "helm", "html", "http", "hurl", "ini", "java",
      "javadoc", "javascript", "jinja", "jinja_inline", "jq", "json", "json5",
      "julia", "kotlin", "latex", "lua", "luadoc", "make",
      "markdown", "markdown_inline", "mermaid", "muttrc", "php", "po",
      "promql", "pug", "python", "readline", "regex", "ruby", "rust", "sql",
      "ssh_config", "swift", "terraform", "toml", "tsv", "typescript",
      "typst", "vala", "vim", "vimdoc", "vue", "xml", "yaml", "zathurarc",
    }

    treesitter.install(parsers)

    local patterns = {}
    for _, parser in ipairs(parsers) do
      local parser_patterns = vim.treesitter.language.get_filetypes(parser)
      for _, pp in pairs(parser_patterns) do
        table.insert(patterns, pp)
      end
    end

    vim.treesitter.language.register("groovy", "Jenkinsfile")
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = patterns,
      callback = function()
        vim.treesitter.start()
      end,
    })

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

    textobjects.setup({
      select = {
        enable = true,
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    })

    -- Selects
    local select = require "nvim-treesitter-textobjects.select"
    vim.keymap.set({ "x", "o" }, "af", function()
      select.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
      select.select_textobject("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ac", function()
      select.select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ic", function()
      select.select_textobject("@class.inner", "textobjects")
    end)
    -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ "x", "o" }, "as", function()
      select.select_textobject("@local.scope", "locals")
    end)

    -- Swaps
    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "<leader>a", function()
      swap.swap_next "@parameter.inner"
    end)
    vim.keymap.set("n", "<leader>A", function()
      swap.swap_previous "@parameter.outer"
    end)


    local move = require("nvim-treesitter-textobjects.move")
    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer", "textobjects")
    end)
    -- You can also pass a list to group multiple queries.
    vim.keymap.set({ "n", "x", "o" }, "]o", function()
      move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
    end)
    -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
    vim.keymap.set({ "n", "x", "o" }, "]s", function()
      move.goto_next_start("@local.scope", "locals")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]z", function()
      move.goto_next_start("@fold", "folds")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "][", function()
      move.goto_next_end("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[]", function()
      move.goto_previous_end("@class.outer", "textobjects")
    end)

    -- Go to either the start or the end, whichever is closer.
    -- Use if you want more granular movements
    vim.keymap.set({ "n", "x", "o" }, "]d", function()
      move.goto_next("@conditional.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[d", function()
      move.goto_previous("@conditional.outer", "textobjects")
    end)

    local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
