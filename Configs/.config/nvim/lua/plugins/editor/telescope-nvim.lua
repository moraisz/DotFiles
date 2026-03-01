return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find with Live Grep" },
    },
}
