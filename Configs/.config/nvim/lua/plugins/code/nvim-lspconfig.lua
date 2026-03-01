return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = function()
        return {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "E",
                        [vim.diagnostic.severity.WARN] = "W",
                        [vim.diagnostic.severity.HINT] = "H",
                        [vim.diagnostic.severity.INFO] = "I",
                    },
                },
            },
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
                -- configuration for all lsp servers
                ["*"] = {
                    capabilities = {
                        workspace = {
                            fileOperations = {
                                didRename = true,
                                willRename = true,
                            },
                        },
                    },
                    -- stylua: ignore
                    keys = {
                        { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
                        { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
                        { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
                        { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
                        { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
                        { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
                        { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
                        { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
                        { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help" },
                        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" } },
                        { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "x" } },
                        { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
                        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode = { "n" } },
                        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
                        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
                        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
                        { "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, desc = "Next Reference" },
                        { "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Prev Reference" },
                    },
                },
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
        -- setup keymaps
        for _, server_opts in pairs(opts.servers) do
            if type(server_opts) == "table" and server_opts.keys then
                local wk = require("which-key")
                wk.add(server_opts.keys, {
                    mode = { "n", "x" },
                    buffer = nil,
                    prefix = "",
                    silent = true,
                    noremap = true,
                    nowait = false,
                })
            end
        end

        -- inlay hints
        if opts.inlay_hints.enabled then
            Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buffer)
                if
                    vim.api.nvim_buf_is_valid(buffer)
                    and vim.bo[buffer].buftype == ""
                    and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
                then
                    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
                end
            end)
        end

        -- code lens
        if opts.codelens.enabled and vim.lsp.codelens then
            Snacks.util.lsp.on({ method = "textDocument/codeLens" }, function(buffer)
                vim.lsp.codelens.refresh()
                vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                    buffer = buffer,
                    callback = vim.lsp.codelens.refresh,
                })
            end)
        end

        -- diagnostics
        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        -- if opts.capabilities then
        --     opts.servers["*"] = vim.tbl_deep_extend("force", opts.servers["*"] or {}, {
        --         capabilities = opts.capabilities,
        --     })
        -- end
        --
        -- if opts.servers["*"] then
        --     vim.lsp.config("*", opts.servers["*"])
        -- end

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
