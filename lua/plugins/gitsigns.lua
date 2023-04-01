return     {
    'lewis6991/gitsigns.nvim',
    event = {'BufReadPre', 'BufWritePre'},
    config = function()
        local gitsigns = require("gitsigns")
        local options = {
            signs = {
                add          = { text = ' │', },
                change       = { text = ' │', },
                delete       = { text = ' ', },
                topdelete    = { text = ' ', },
                changedelete = { text = ' ', },
                untracked    = { text = ' ¦', }
            },
        }
        gitsigns.setup(options)
    end
}
