return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    local nvim_web_devicons = require("nvim-web-devicons")

    nvim_web_devicons.setup {
       -- DevIcon will be appended to `name`
       override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
       };
       -- globally enable different highlight colors per icon (default to true)
       -- if set to false all icons will have the default icon's color
       color_icons = true;
       -- globally enable default icons (default to false)
       -- will get overriden by `get_icons` option
       default = true;
       -- globally enable "strict" selection of icons - icon will be looked up in
       -- different tables, first by filename, and if not found by extension; this
       -- prevents cases when file doesn't have any extension but still gets some icon
       -- because its name happened to match some extension (default to false)
       strict = true;
       -- same as `override` but specifically for overrides by filename
       -- takes effect when `strict` is true
       override_by_filename = {
        ["docker-compose.yml"] = {
          icon = "",
          color = "#458ee6",
          cterm_color = "68",
          name = "Dockerfile",
        },
        ["dockerfile"] = {
          icon = "",
          color = "#458ee6",
          cterm_color = "68",
          name = "Dockerfile",
        },
        [".dockerignore"] = {
          icon = "",
          color = "#458ee6",
          cterm_color = "68",
          name = "Dockerfile",
        },
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        },
       };
       -- same as `override` but specifically for overrides by extension
       -- takes effect when `strict` is true
       override_by_extension = {
        ["doc"] = {
          icon = "",
          color = "#185abd",
          cterm_color = "26",
          name = "Doc",
        },
        ["docx"] = {
          icon = "",
          color = "#185abd",
          cterm_color = "26",
          name = "Docx",
        },
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        },
        ["ppt"] = {
          icon = "",
          color = "#cb4a32",
          cterm_color = "214",
          name = "Ppt",
        },
        ["svg"] = {
          icon = "",
          color = "#FFB13B",
          cterm_color = "214",
          name = "Svg",
        },
        ["txt"] = {
          icon = "",
          color = "#89e051",
          cterm_color = "113",
          name = "Txt",
        },
        ["xml"] = {
          icon = "",
          color = "#e37933",
          cterm_color = "166",
          name = "Xml",
        },
        ["xls"] = {
          icon = "",
          color = "#207245",
          cterm_color = "29",
          name = "Xls",
        },
        ["xlsx"] = {
          icon = "",
          color = "#207245",
          cterm_color = "29",
          name = "Xlsx",
        },
        ["tex"] = {
          icon = "",
          color = "#3D6117",
          cterm_color = "22",
          name = "Tex",
        },
       };
    }
  end
}
