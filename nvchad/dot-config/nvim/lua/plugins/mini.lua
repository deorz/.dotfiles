return {
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      windows = {
        max_number = 1,
        preview = false,
      },
    },
    keys = {
      {
        "<leader>ee",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Open file explorer",
      },
    },
    init = function()
      local map_split = function(buf_id, lhs, direction)
        local mini_files = require("mini.files")
        local rhs = function()
          local fsentry = mini_files.get_fs_entry()
          if fsentry.fs_type ~= "file" then
            return
          end

          local new_target_window
          vim.api.nvim_win_call(mini_files.get_target_window(), function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          mini_files.set_target_window(new_target_window)
          mini_files.go_in()
          mini_files.close()
        end

        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          -- Split view
          map_split(buf_id, "gs", "belowright horizontal")
          map_split(buf_id, "gv", "belowright vertical")
        end,
      })
    end,
  },
}
