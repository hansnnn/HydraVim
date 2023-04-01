return     {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = {"ToggleTerm"},
    config = function()


        local toggleterm = require("toggleterm")

        local options = {
            direction = "float",
            float_opts = {
                width = function()
                    return math.ceil(vim.o.columns * 0.7)
                end,
                height = function()
                    return math.ceil(vim.o.lines * 0.7)
                end,
            }
        }

        toggleterm.setup(options)

    end
}

