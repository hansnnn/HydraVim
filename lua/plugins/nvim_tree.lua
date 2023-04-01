return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeFindFile", "NvimTreeFindFileToggle"},
    ft = "alpha",
    config = function()
        local nvim_tree = require("nvim-tree")

        local options = {
            sort_by = "case_sensitive",
            view = {
                hide_root_folder = true,
                side = "left",
                number = false,
                relativenumber = false,
                signcolumn = "yes",
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "u", action = "dir_up" },
                    },
                },
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                debounce_delay = 50,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
            },
            git = {
                enable = true,
                ignore = false
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    inline_arrows = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        bottom = "─",
                        none = " ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        }

        nvim_tree.setup(options)

    end
}
