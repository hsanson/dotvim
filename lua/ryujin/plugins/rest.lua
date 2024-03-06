return {
  -- REST plugin.
  -- Telescope integration required `fd` binary present.
  --   sudo apt install fd-find
  --   ln -s /usr/bin/fdfind ~/.local/bin/fd
  dir = "/home/ryujin/Projects/vim/rest.nvim",
  branch = "main",
  dev = true,
  lazy = true,
  ft = "http",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()

    require("telescope").load_extension('rest')

    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- stay in current windows (.http file) or change to results window (default)
      stay_in_current_window_after_split = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      request = {
        -- Pre-Scrip
        pre_script = function(opts, variables)

          local url = opts["url"]

          -- Only process request to JoinTriage servers.
          if(not string.find(url, "jointriage"))
          then
            return
          end

          local session_id = variables["SESSION_ID"]
          local session_token = variables["SESSION_TOKEN"]

          -- Check if session information is available in the environment
          -- variables.
          if(not session_id or not session_token)
          then
            vim.print("No session id or token. Login first")
            return
          end

          local method = string.upper(opts["method"])
          local content_type = opts["headers"]["Content-Type"] or "application/json"

          -- Compute body MD5 hex digest
          -- Lua lacks tools for this so we use external commands via system
          -- calls.
          local body = opts["body"]
          local md5_cmd = string.format("echo -n '%s' | openssl dgst -md5 -binary | openssl enc -base64 | tr -d '\\n'", body)
          local body_md5 = vim.fn.system(md5_cmd)

          -- Get local time in US locale and GMT timezone.
          os.setlocale("en_US.UTF-8")
          local httpdate = os.date("!%a, %d %b %Y %H:%M:%S GMT")

          -- Extract full path of the URL including query params.
          -- Assumes all URLs start with https:// so path search starts after character
          -- number 9.
          local path_start, _ = string.find(url, "/", 9) or 1, 1
          local path = string.sub(url, path_start)

          -- Build canonical string
          local canonical = string.format("%s,%s,%s,%s,%s",
                                method,
                                content_type,
                                body_md5,
                                path,
                                httpdate)

          -- Compute signature
          local signature_cmd = string.format("echo -n \"%s\" | openssl dgst -sha1 -hmac \"%s\" -hex | cut -d' ' -f2 | tr -d '\n'", canonical, session_token)
          local signature = vim.fn.system(signature_cmd)

          -- Add authorization headers to the request.
          opts["headers"]["Content-MD5"] = body_md5
          opts["headers"]["X-Date"] = httpdate
          opts["headers"]["Authorization"] = string.format(
              "APIAuth %s:%s", session_id, signature)

          -- Debugging print
          -- vim.print(opts)
        end
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- table of curl `--write-out` variables or false if disabled
        -- for more granular control see Statistics Spec
        show_statistics = false,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      -- for telescope select
      env_pattern = "\\.env$",
      env_edit_command = "tabedit",
      custom_dynamic_variables = {
      },
      yank_dry_run = true,
      search_back = true,
    })

    local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
    local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
    local group = augroup('RestGroup', { clear = true })

    -- Callback invoked before any request
    autocmd('User', {
      group = group,
      pattern = "RestStartRequest",
      once = true,
      callback = function(_)
        -- print("IT FINISHED")
        -- vim.print(opts)
      end,
    })

    -- Callback invoked after any request
    autocmd('User', {
      group = group,
      pattern = "RestStopRequest",
      once = true,
      callback = function(_)
        -- print("IT FINISHED")
        -- vim.print(opts)
      end,
    })
  end
}
