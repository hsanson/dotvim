vim.keymap.set('n', '<localleader>rr', '<Cmd>Swara build<CR>', {
  desc = 'Build lilypond',
  remap = false,
  buffer = true,
})

vim.keymap.set('n', '<localleader>re',
  function()
    if vim.b.swara_playing == "playing" then
      vim.cmd("Swara stop")
      vim.b.swara_playing = nil
    else
      vim.cmd("Swara play")
      vim.b.swara_playing = "playing"
    end
  end, {
  desc = 'Play/stop lilypond',
  remap = false,
  buffer = true,
})
