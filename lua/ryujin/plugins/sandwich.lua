return {
  "machakann/vim-sandwich",
  config = function()
    -- Sandwich Plugin
    --
    -- Description:
    --  Plugin for deleting, changing, and adding surroundings.
    --
    -- Usage:
    --    sa{motion}{surrounding} - Adds surrounding
    --    sd{motion}{surrounding} - Removes surrounding
    --    sr{current}{replacement} - Replaces surrounding
    --
    --    Special Surroundings:
    --
    --      sa{motion}f - Adds function surrounding func(...)
    --      sa{motion}t - Add HTML tag surrounding.
    --      sa{motion}i - Add input surrounding.
  end
}
