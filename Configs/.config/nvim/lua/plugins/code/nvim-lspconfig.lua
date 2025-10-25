return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = function()
        return {
            inlay_hints = {
                enabled = true,
                exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
            },
            codelens = {
                enabled = false,
            },
            folds = {
                enabled = true,
            },
            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            servers = {
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            codeLens = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        if opts.capabilities then
            vim.lsp.config("*", { capabilities = opts.capabilities })
        end

        for server, _ in pairs(opts.servers) do
            local sopts = opts.servers[server]
            vim.lsp.config(server, sopts)
        end

        local mason_exclude = {}
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            automatic_installation = true,
            automatic_enable = { exclude = mason_exclude },
        })
    end,
}
-- return {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--     },
--     config = function()
--         require("mason").setup()
--         local mason_lspconfig = require("mason-lspconfig")
--         local lspconfig = require("lspconfig")
--
--         local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--         local servers = {
--             "lua_ls",
--         }
--
--         mason_lspconfig.setup({
--             ensure_installed = servers,
--             automatic_installation = true,
--         })
--
--         for _, server in ipairs(servers) do
--             local opts = { capabilities = capabilities }
--
--             if server == "lua_ls" then
--                 opts.settings = {
--                     Lua = {
--                         workspace = { checkThirdParty = false },
--                         diagnostics = { globals = { "vim" } },
--                     }
--                 }
--             end
--
--             lspconfig[server].setup(opts)
--         end
--     end,
-- }
