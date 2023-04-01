return     {
    'norcalli/nvim-colorizer.lua',
    event = {"BufRead"},
    config = function ()
        local colorizer = require("colorizer")
        colorizer.setup()
    end
}
