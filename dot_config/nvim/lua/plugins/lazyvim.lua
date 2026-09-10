return {
  -- Cappuccino light == Catppuccin Latte
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { flavour = "latte", background = { light = "latte" } },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-latte" } },

  -- File tree sidebar: toggle with <leader>s (Space then s).
  -- NOTE: this replaces LazyVim's default <leader>s search menu.
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>s", function() Snacks.explorer() end, desc = "File Explorer (toggle)" },
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash", "lua", "luadoc", "markdown", "markdown_inline",
        "json", "jsonc", "yaml", "toml", "nix", "rust", "python",
        "javascript", "typescript", "tsx", "go", "gomod", "dockerfile",
        "regex", "gitcommit", "diff",
      },
    },
  },
}
