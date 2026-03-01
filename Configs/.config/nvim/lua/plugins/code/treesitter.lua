return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    version = false,
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        ensure_installed = {
            "lua",
            "bash",
            "json",
            "markdown",
            "html",
            "css",
            "javascript",
            "typescript",
            "python",
            "php",
            "blade",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        folds = {
            enable = true,
        },
    },
    config = function(_, opts)
        local ts = require("nvim-treesitter")
        ts.install(opts.ensure_installed)
        ts.setup(opts)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("nvim-treesitter", { clear = true }),
            callback = function(ev)
                local _, lang = ev.match, vim.treesitter.language.get_lang(ev.match)

                ---@param feat string
                local function enabled(feat)
                    local f = opts[feat] or {}
                    return f.enable ~= false
                    and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
                end

                -- highlighting
                if enabled("highlight") then
                    pcall(vim.treesitter.start, ev.buf)
                end

                -- indents
                if enabled("indent") then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                -- folds
                if enabled("folds") then
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo.foldmethod = 'expr'
                end
            end,
        })
    end
}
