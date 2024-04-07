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
  dependencies = { "luarocks.nvim" },
  config = function()

    require("telescope").load_extension('rest')

    require("rest-nvim").setup({
      highlight = {
        enable = false
      },
    })

    local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
    local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
    local group = augroup('RestGroup', { clear = true })

    -- Callback invoked before any request
    autocmd('User', {
      group = group,
      pattern = "RestStartRequest",
      callback = function(_)
        local url = _G._rest_nvim_req_data.request.url
        -- vim.print(_G._rest_nvim_req_data)

        -- Only process request to JoinTriage servers.
        if(not string.find(url, "jointriage"))
        then
          return
        end

        local session_id = vim.env.SESSION_ID
        local session_token = vim.env.SESSION_TOKEN

        -- Check if session information is available in the environment
        -- variables.
        if(not session_id or not session_token)
        then
          -- vim.print("No session id or token. Login first")
          return
        end

        local method = string.upper(_G._rest_nvim_req_data.request.method)
        local content_type = _G._rest_nvim_req_data.headers["Content-Type"] or "application/json"

        -- Compute body MD5 hex digest
        -- Lua lacks tools for this so we use external commands via system
        -- calls.
        local body = _G._rest_nvim_req_data.body
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
        _G._rest_nvim_req_data.headers["Content-MD5"] = body_md5
        _G._rest_nvim_req_data.headers["X-Date"] = httpdate
        _G._rest_nvim_req_data.headers["Authorization"] = string.format(
            "APIAuth %s:%s", session_id, signature)
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
