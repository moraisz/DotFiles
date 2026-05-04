return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "Format Buffer",
        },
        {
            "<leader>cF",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
        },
    },
    opts = {
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "php_cs_fixer" },
            python = { "black" },
            json = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
        },
        formatters = {
            php_cs_fixer = {
                command = "php-cs-fixer",
                args = {
                    "fix",
                    "--rules=@PSR12",
                    "--allow-risky=yes",
                    "--using-cache=no",
                    "$FILENAME",
                },
                stdin = false,
                tmpfile_format = ".conform.$RANDOM.$FILENAME",
            },
            injected = {
                options = {
                    ignore_errors = true,
                    lang_to_ext = {
                        bash = "sh",
                        c_sharp = "cs",
                        elixir = "exs",
                        javascript = "js",
                        julia = "jl",
                        latex = "tex",
                        markdown = "md",
                        python = "py",
                        ruby = "rb",
                        rust = "rs",
                        teal = "tl",
                        typescript = "ts",
                    },
                }
            },
        },
    }
}
