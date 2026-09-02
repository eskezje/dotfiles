--  shoutout to vimichael for the visuals
--  https://github.com/vimichael/my-nvim-config

local dashboard_header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⡀⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣽⠃⠀⠀⠀⢼⠻⣿⣿⣟⣿⣿⣿⣿⣶⣶⣶⣶⣤⣤⣤⣤⣤
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠛⡶⢶⢺⠁⠀⠈⢿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⣿
⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⣤⠀⣀⣠⡛⣣⡀⠀⠈⢿⣿⣿⣻⣏⣿⣿⣿⣿⣿⣿⣟⣿⠿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⣳⣶⣿⣿⣷⣾⠱⠀⠀⠊⢿⠿⠿⢛⣽⣿⡿⢿⣿⣟⠿⠿⠿
⠉⠉⠉⠛⠛⠛⠋⠛⠛⠛⣧⠀⡀⠀⠀⢿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠅⢀⢀⡀
⠔⠄⢀⡀⠀⠀⠀⠄⠐⠸⠿⡀⠀⠀⠀⢘⣿⢷⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠰⣠⣇
⣷⣆⣴⣮⢻⡲⡲⠀⠁⠀⠀⠀⠀⠀⠀⠹⡿⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣀⡘⢷⣏
⣿⣿⣿⣗⠿⢈⠁⡀⠀⠁⠀⠀⠀⠀⠀⠀⠉⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠄⠀⠄⠈⢿⣮⢿
⣿⣟⡿⣾⠀⠀⠀⠀⠀⠀⠀⢀⡤⠄⠀⠀⠀⠀⠸⠁⢠⣦⣤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⣿⠀
⣿⣿⠏⠁⢀⡇⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⡏⣷⣵⡻⠃⠄⢴⣆⠀⠀⠀⠀⠀⠀⠀⠰⠀⣆⣷⣿
⣿⡿⣻⠗⠀⢠⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⢠⣤⣄⢰⣶⢯⣤⡈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⣿⣼]]

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.env.THEME or "habamax",
    },

    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "habamax",
        callback = function()
          vim.api.nvim_set_hl(0, "Function", {
            fg = "#DA9AAC",
          })
        end,
      })
    end,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = vim.env.THEME or "habamax",
  --     -- colorscheme = vim.env.THEME or "custom",
  --   },
  -- },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.width = 64
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = dashboard_header
      opts.dashboard.preset.keys = {
        { icon = "λ ", key = "f", desc = "> Find file", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "λ ", key = "n", desc = "> New file", action = ":ene | startinsert" },
        { icon = "λ ", key = "g", desc = "> Find text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = "λ ", key = "r", desc = "> Recent", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        {
          icon = "λ ",
          key = "c",
          desc = "> Config",
          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
        },
        { icon = "λ ", key = "s", desc = "> Restore session", section = "session" },
        { icon = "λ ", key = "l", desc = "> Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = "λ ", key = "q", desc = "> Quit", action = ":qa" },
      }
      opts.dashboard.sections = {
        { section = "header", padding = 2 },
        { section = "keys", gap = 1, padding = 1 },
      }
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        icons_enabled = false,
        theme = "auto",
        component_separators = "",
        section_separators = "",
        globalstatus = false,
      })

      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          function()
            local encoding = vim.bo.fileencoding
            if encoding == "" then
              return vim.bo.fileformat .. " :: " .. vim.bo.filetype
            end
            return encoding .. " :: " .. vim.bo.fileformat .. " :: " .. vim.bo.filetype
          end,
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    end,
  },
}
