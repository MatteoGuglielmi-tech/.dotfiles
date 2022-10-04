local t_status_ok, telescope = pcall(require, 'telescope')
if not t_status_ok then
    return
end

local a_status_ok, telescope_actions = pcall(require, 'telescope.actions')
if not a_status_ok then
    return
end

local actions = telescope_actions 
telescope.setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
            layout_config = {
                height = 0.5,
                width = 0.5
            },
            previewer = false,
            prompt_title = false,
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension('fzy_native')
