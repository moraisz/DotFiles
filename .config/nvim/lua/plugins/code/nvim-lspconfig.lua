return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local servers = {
            "lua_ls",
        }

        mason_lspconfig.setup({
            ensure_installed = servers,
            automatic_installation = true,
        })

        for _, server in ipairs(servers) do
            local opts = { capabilities = capabilities }

            if server == "lua_ls" then
                opts.settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        diagnostics = { globals = { "vim" } },
                    }
                }
            end

            lspconfig[server].setup(opts)
        end
    end,
}
