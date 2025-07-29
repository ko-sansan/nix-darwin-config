vim.g.mapleader = " "  -- <leader> キーにスペースを指定

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- よく使う操作のショートカット
map("n", "<leader>e", ":Ex<CR>", opts)  -- ファイルツリーを開く
map("n", "<leader>w", ":w<CR>", opts)   -- 保存
map("n", "<leader>q", ":q<CR>", opts)   -- 終了
