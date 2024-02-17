return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
      transparent = true,
      dim_inactive = true,

      lualine = {
        transparent = true
      }
    }
    require('bamboo').load()
  end
}
