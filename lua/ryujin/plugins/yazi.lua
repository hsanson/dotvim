-- Helper function to check if file is a media file
local function is_media_file(file_path)
  local media_extensions = {
    -- Images
    "jpg", "jpeg", "png", "gif", "webp", "svg", "bmp", "tiff", "tif", "ico",
    -- Videos
    "mp4", "avi", "mov", "wmv", "flv", "webm", "mkv", "m4v",
    -- Audio
    "mp3", "wav", "flac", "ogg", "aac", "m4a", "wma"
  }

  local extension = vim.fn.fnamemodify(file_path, ":e"):lower()
  for _, ext in ipairs(media_extensions) do
    if extension == ext then
      return true
    end
  end
  return false
end

-- Helper function to insert links for markdown/asciidoc files
local function insert_file_links(selected_files)
  local current_buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[current_buf].filetype

  -- Check if current buffer is markdown or asciidoc
  if filetype ~= "markdown" and filetype ~= "asciidoc" then
    vim.notify("Current buffer is not a markdown or asciidoc document", vim.log.levels.WARN)
    return false
  end

  -- Get cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1]

  -- Prepare links based on filetype
  local links = {}
  for _, file_path in ipairs(selected_files) do
    local filename = vim.fn.fnamemodify(file_path, ":t")
    local link

    if is_media_file(file_path) then
      -- Insert media tags for media files
      if filetype == "markdown" then
        link = string.format("![%s](%s)", filename, file_path)
      elseif filetype == "asciidoc" then
        link = string.format("image::%s[%s]", file_path, filename)
      end
    else
      -- Insert regular links for non-media files
      if filetype == "markdown" then
        link = string.format("[%s](%s)", filename, file_path)
      elseif filetype == "asciidoc" then
        link = string.format("link:%s[%s]", file_path, filename)
      end
    end

    table.insert(links, link)
  end

  -- Insert links at cursor position
  if #links > 1 then
    -- Multiple files: insert each on a new line
    -- Convert to 0-based indexing for nvim_buf_set_lines
    local line_idx = row - 1
    vim.api.nvim_buf_set_lines(current_buf, line_idx + 1, line_idx + 1, false, links)
    -- Move cursor to after the inserted links
    vim.api.nvim_win_set_cursor(0, {row + #links, 0})
  else
    -- Single file: insert at cursor position
    local current_line = vim.api.nvim_get_current_line()
    local col = cursor_pos[2]
    local new_line = current_line:sub(1, col) .. links[1] .. current_line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)
    -- Move cursor to after the inserted link
    vim.api.nvim_win_set_cursor(0, {row, col + #links[1]})
  end

  vim.notify(string.format("Inserted %d link(s)", #links), vim.log.levels.INFO)
  return true
end

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of Yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
    {
      -- Custom keymap for yazi with link insertion capability
      "<leader>cl",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd(), {
          hooks = {
            yazi_closed_successfully = function(chosen_files, config, state)
              if chosen_files and #chosen_files > 0 then
                local success = insert_file_links(chosen_files)
                if not success then
                  -- If not markdown/asciidoc, open normally
                  for _, file in ipairs(chosen_files) do
                    vim.cmd("edit " .. vim.fn.fnameescape(file))
                  end
                end
              end
            end,
          },
        })
      end,
      desc = "Open yazi and insert links if markdown/asciidoc",
    },
  },

  opts = {
    -- If you want to open Yazi instead of `netrw`, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
      -- Custom keymap within yazi for inserting links
      insert_links = "<c-b>",
    },
    set_keymappings_function = function(yazi_buffer_id, config, context)
      -- Set up default keymaps
      require("yazi.config").set_keymappings(yazi_buffer_id, config, context)
      -- Custom keymap for inserting links
      if config.keymaps.insert_links ~= false then
        local keybinding_helpers = require("yazi.keybinding_helpers")
        vim.keymap.set(
          { "t" },
          config.keymaps.insert_links,
          function()
            local get_relative_path =
              require("yazi.integrations.get_relative_path").get_relative_path

            keybinding_helpers.select_current_file_and_close_yazi(config, {
              api = context.api,
              on_file_opened = function(chosen_file)
                local relative_path = get_relative_path(config, {
                  selected_file = chosen_file,
                  source_dir = context.input_path.filename,
                })
                vim.print("Inserting links... " .. relative_path)
                insert_file_links({relative_path})
              end,
              on_multiple_files_open = function(chosen_files)
                local relative_paths = {}
                for _, chosen_file in ipairs(chosen_files) do
                  relative_paths[#relative_paths + 1] = get_relative_path(config, {
                    selected_file = chosen_file,
                    source_dir = context.input_path.filename,
                  })
                end
                vim.print("Inserting links... " .. relative_paths)
                insert_file_links(relative_paths)
              end,
            })
          end,
          { buffer = yazi_buffer_id, desc = "Insert links for selected files" }
        )
      end
    end,
  },
  init = function()
    -- mark `netrw` as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g["loaded_netrwPlugin"] = 1
  end,
}
