return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sf",
        "<cmd>Telescope find_files follow=true hidden=true<cr>",
        "n",
        noremap = true,
        silent = true,
        desc = "File picker",
      },
      {
        "<leader>sb",
        "<cmd>Telescope buffers<cr>",
        "n",
        noremap = true,
        silent = true,
        desc = "Buffer picker",
      },
      {
        "<leader>s/",
        "<cmd>Telescope live_grep<cr>",
        "n",
        noremap = true,
        silent = true,
        desc = "Live grep picker",
      },
      {
        "<leader>sl",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        "n",
        noremap = true,
        silent = true,
        desc = "Buffer fuzzy picker",
      },
      {
        "<leader>sth",
        function()
          require("nvchad.themes").open()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "NvChad themes picker",
      },
    },
  },
}
