return {
  "vinnymeller/swagger-preview.nvim",
  config = function()
    require("swagger-preview").setup({
      port = 8003,
      host = "localhost",
      build = "npm i",
      config = true
    })
  end
}
