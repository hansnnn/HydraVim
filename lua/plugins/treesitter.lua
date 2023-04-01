return {
    'nvim-treesitter/nvim-treesitter',
    event = {"BufRead"},
    cmd = {
        "TSBufDisable",
        "TSBufEnable",
        "TSBufToggle",
        "TSDisable",
        "TSEnable",
        "TSToggle",
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSModuleInfo",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
    },
    build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    config = function()
        local present, treesitter = pcall(require, "nvim-treesitter.configs")

        if not present then
            return
        end

        treesitter.setup {
            sync_install = true,
            auto_install = true,
            ensure_installed = { "lua" },
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
            },
        }

    end,
}
