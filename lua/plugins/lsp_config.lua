return     {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            "williamboman/mason.nvim",
            cmd = {
                "Mason",
                "MasonInstall",
                "MasonUninstall",
                "MasonUninstallAll",
                "MasonLog",
                "MasonUpdate"
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            cmd = { "LspInstall", "LspUninstall" },
        }
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require("lspconfig")
        local border = require("core.border").rouded

        vim.diagnostic.config({
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = false,
            virtual_text = false,
            float = {
                header="",
                border = border("rouded"),
                format = function(diagnostic)
                    return string.format("%s", diagnostic.message)
                end,
            }
        })

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    source = 'always',
                    prefix = '',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })

        local signs = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " "
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        mason.setup({
            ui = {
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = " ",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {'lua_ls'},
            automatic_installation = true,
        })

        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        mason_lspconfig.setup_handlers({
            function(server)
                lspconfig[server].setup({})
            end,
        })

    end
}
