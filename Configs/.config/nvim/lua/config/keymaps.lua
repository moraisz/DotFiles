local map = require("utils.keybinding").map

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Clear search highlights
map("n", "<Esc>", "<cmd>noh<CR><Esc>", { silent = true })

-- Tmux and Window navigation
map("n", "<C-h>", [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLeft()<CR>]], { silent = true })
map("n", "<C-j>", [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateDown()<CR>]], { silent = true })
map("n", "<C-k>", [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateUp()<CR>]], { silent = true })
map("n", "<C-l>", [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateRight()<CR>]], { silent = true })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffer navigation
map("n", "<M-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<M-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Session
map("n", "<leader>sw", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>sq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>sQ", "<cmd>qa<cr>", { desc = "Quit All" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Toggle options
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end
