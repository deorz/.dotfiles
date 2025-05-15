return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "VenvSelect" },
    ft = "python",
    branch = "regexp",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = false,
        },
      },
    },
    keys = {
      {
        "<leader>cv",
        "<cmd>VenvSelect<cr>",
        "n",
        noremap = true,
        silent = true,
        desc = "Python Venv Picker",
      },
    },
  },
}
