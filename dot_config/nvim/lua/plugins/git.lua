return {
  -- lazygit is already <leader>gg in LazyVim (via snacks). Config lives in
  -- nix (programs.lazygit): commit graph is forced on.

  -- In-editor commit graph / tree
  {
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    opts = {
      symbols = {
        merge_commit = "M", commit = "*",
        merge_commit_end = "M", commit_end = "*",
        commit_mid = "|", commit_msg = "|",
      },
      format = {
        timestamp = "%Y-%m-%d %H:%M",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        end,
        on_select_range_commit = function(from, to)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    keys = {
      { "<leader>gG", function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end, desc = "Git graph" },
    },
  },
}
