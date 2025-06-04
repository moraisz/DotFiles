return {
    "zbirenbaum/copilot.lua",
    dependencies = { "zbirenbaum/copilot-cmp", opts = {} },
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = false,
            auto_trigger = true,
            hide_during_completion = true,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
}
