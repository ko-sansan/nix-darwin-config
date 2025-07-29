-- lazy.nvim を自動インストール（初回のみ）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン定義
local plugins = {
  -- カラースキーム: tokyonight, day
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- 起動時に一番最初に読み込む
    config = function()
      require("tokyonight").setup({ style = "day" })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- ステータスライン: lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- ファイラー: nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
    end,
  }
}

local opts = {
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
}

require("lazy").setup(plugins, opts)
