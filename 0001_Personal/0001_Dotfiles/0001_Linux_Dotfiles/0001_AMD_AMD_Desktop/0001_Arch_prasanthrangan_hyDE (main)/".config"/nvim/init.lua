-- Load LazyVim configuration
require("config.lazy")

-- Add Catppuccin plugin to LazyVim configuration
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})


-- Set up Catppuccin theme with specific configurations
require("catppuccin").setup({
    flavour = "mauve", -- Set to "mauve" flavor
    background = {
        light = "latte",
        dark = "mauve",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

-- Set the colorscheme to Catppuccin after setup
vim.cmd.colorscheme "catppuccin"

