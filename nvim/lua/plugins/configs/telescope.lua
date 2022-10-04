local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

telescope.setup {
    defaults = {
        preview = {
            hide_on_startup = true,
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 80,
            },
        },
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
            results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
        mappings = {
            i = {
                ["<c-e>"] = actions.close,
                ["<c-i>"] = actions_layout.toggle_preview,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            }
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")

-- Telescope key mappings (project find, search and buffer)
map("n", "<leader>pf", ":lua require'telescope.builtin'.find_files()<CR>", opts)
map("n", "<leader>ps", ":lua require'telescope.builtin'.live_grep()<CR>", opts)
map("n", "<leader>pb", ":lua require'telescope.builtin'.buffers()<CR>", opts)
