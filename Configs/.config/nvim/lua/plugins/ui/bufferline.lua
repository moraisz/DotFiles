return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            separator_style = "thin", -- ou "slant", "padded_slant", etc.
            show_buffer_close_icons = true,
            show_close_icon = true,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        }
    }
}
