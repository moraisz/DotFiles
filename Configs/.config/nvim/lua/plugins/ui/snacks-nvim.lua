return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = false },
        input = { enabled = true },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = true },
        statuscolumn = { enabled = false },
        picker = { enabled = true },
    },
    keys = {
        -- {
        --     "<leader>e", function()
        --         Snacks.explorer.open()
        --     end, desc = "File Explorer"
        -- },
        {
            "<leader>n", function()
                if Snacks.config.picker and Snacks.config.picker.enabled then
                    Snacks.picker.notifications()
                else
                    Snacks.notifier.show_history()
                end
            end, desc = "Notification History"
        },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications"
        },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    },
}
