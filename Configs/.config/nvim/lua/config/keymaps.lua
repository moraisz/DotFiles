local wk = require("which-key")

-- Which Key
wk.add({
    { "<leader>e", "<cmd>Neotree toggle<cr>", icon = { icon = "󰙅", color = "yellow" }, desc = "Explorer NeoTree" },
    { "<leader>l", "<cmd>Lazy<cr>", icon = "󰒲", desc = "Lazy" },
    { "<leader>m", "<cmd>Mason<cr>", icon = "󰢛", desc = "Mason" },

    { "<leader>a", icon = "󰚩", group = "+AI", mode = { "n", "v" } },
    {
        "<leader>aa",
        function()
            return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
    },
    {
        "<leader>ax",
        function()
            return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
    },
    {
        "<leader>aq",
        function()
            vim.ui.input({
                prompt = "Quick Chat: ",
            }, function(input)
                    if input ~= "" then
                        require("CopilotChat").ask(input)
                    end
                end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
    },
    {
        "<leader>ap",
        function()
            require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
    },

    { "<leader>b", group = "Buffer" }, -- group
    { "<leader>bl", "<cmd>bnext<cr>", desc = "Next Buffer" }, -- no need to specify mode since it's inherited
    { "<leader>bh", "<cmd>bprevious<cr>", desc = "Previous Buffer" }, -- no need to specify mode since it's inherited
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" }, -- no need to specify mode since it's inherited

    { "<leader>s", group = "Session" }, -- group
    { "<leader>sq", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>sQ", "<cmd>qa<cr>", desc = "Quit All" }, -- no need to specify mode since it's inherited
    { "<leader>sw", "<cmd>w<cr>", desc = "Write" },

    { "<leader>f", group = "File" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },

    { "<leader>w", proxy = "<c-w>", group = "Windows" },
})

-- Binds for common actions
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>", { silent = true })

vim.keymap.set('n', '<C-h>', [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLeft()<CR>]], { silent = true })
vim.keymap.set('n', '<C-j>', [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateDown()<CR>]], { silent = true })
vim.keymap.set('n', '<C-k>', [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateUp()<CR>]], { silent = true })
vim.keymap.set('n', '<C-l>', [[<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateRight()<CR>]], { silent = true })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
