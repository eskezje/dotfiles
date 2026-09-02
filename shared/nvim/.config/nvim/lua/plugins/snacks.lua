return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        -- showing hidden files in snacks
        hidden = true,
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              preview = "main",
            },
          },
        },
      },
    },
  },
}
