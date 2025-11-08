return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local custom_auto = require'lualine.themes.auto'

        local normal_bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
        if normal_bg then
            local bg_color = string.format('#%06x', normal_bg)

            for _, mode in pairs({'normal', 'insert', 'visual', 'replace', 'command', 'inactive'}) do
                if custom_auto[mode] then
                    for _, section in pairs({'a', 'b', 'c', 'x', 'y', 'z'}) do
                        if custom_auto[mode][section] then
                            custom_auto[mode][section].bg = bg_color
                        end
                    end

                    if custom_auto[mode].c and custom_auto[mode].c.fg then
                        local fg_color = custom_auto[mode].c.fg
                        if custom_auto[mode].a then
                            custom_auto[mode].a.fg = fg_color
                        end
                        if custom_auto[mode].z then
                            custom_auto[mode].z.fg = fg_color
                        end
                    end
                end
            end
        end

        return {
            options = {
                theme = custom_auto,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "neo-tree" } },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {''},
                lualine_y = {'filetype'},
                lualine_z = {'location'},
            }
        }
    end
    -- opts = {
    --     options = {
    --         theme = "auto",
    --         component_separators = { left = '', right = ''},
    --         section_separators = { left = '', right = ''},
    --         disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "neo-tree" } },
    --     },
    --     sections = {
    --         lualine_a = {'mode'},
    --         lualine_b = {'branch', 'diff', 'diagnostics'},
    --         -- lualine_c = {'filename'},
    --         -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    --         lualine_x = {'filetype'},
    --         -- lualine_y = {'progress'},
    --         lualine_z = {'location'},
    --     }
    -- }
}
