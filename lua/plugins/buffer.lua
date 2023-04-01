local bufferline = require("bufferline")

local options = {
    options = {
        buffer_close_icon= '',
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        offsets = {
            {filetype = "NvimTree", text = "Files", text_align = "center", separator = false}
        },
        indicator = {
            style = 'none'
        },
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        always_show_bufferline = false,
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "" })
            }
        },
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return icon .. count
        end,
    }
}

bufferline.setup(options)
