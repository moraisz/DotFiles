return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-mini/mini.nvim",
    },
    opts_extend = { "spec" },
    opts = {
        preset = "helix",
        spec = {
            {
                mode = { "n", "x" },
                { "<leader>a", icon = "󰚩", group = "AI"}, -- group
                { "<leader>b", group = "Buffer" }, -- group
                { "<leader>c", group = "Code" }, -- group
                { "<leader>f", group = "File" }, -- group
                { "<leader>g", group = "Git" }, -- group
                { "<leader>gh", group = "Hunks" }, -- group
                { "<leader>s", group = "Session" }, -- group
                { "<leader>S", group = "Search" }, -- group
                { "<leader>u", group = "Ui" }, -- group
                { "<leader>w", proxy = "<c-w>", group = "Windows" }, -- proxy
                { "<leader>x", group = "Diagnostics" },
            },
        },
    },
}
