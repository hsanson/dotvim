return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("markview").setup({
      modes = { "n", "no", "c" },
      hybrid_modes = { "n" },

      -- This is nice to have
      callbacks = {
          on_enable = function (_, win)
              vim.wo[win].conceallevel = 2;
              vim.wo[win].concealcursor = "nc";
          end
      },

      -- Headings
      headings = {
        enable = true,
        textoff = 0,
        shift_width = 0
      },

      code_blocks = {
        enable = true,
        pad_amount = 2,
        pad_cahr = " "
      }
    })
  end
}
