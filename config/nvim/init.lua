if vim.g.vscode then
    -- VSCode extension
    vim.cmd[[source $HOME/.config/nvim/vscode/keymaps.lua]]
    --Cursor:
    vim.api.nvim_command('autocmd CursorHold * lua vim.diagnostic.open_float({focusable = false})')
    vim.o.scrolloff = 0
    --vim.o.guicursor = 'n-v-c-sm-i-ci-ve:underscore,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
    vim.o.guicursor = 'n-v-c:block,i:hor20,i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
    -- Move cursor through fold in VSCode
    local function moveCursor(direction)
        if (vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
            return ('g' .. direction)
        else
            return direction
        end
    end
 
    -- add space in the end of a line
    local Type = {GLOBAL_OPTION = "o", WINDOW_OPTION = "wo", BUFFER_OPTION = "bo"}
    local add_options = function(option_type, options)
      if type(options) ~= "table" then
        error 'options should be a type of "table"'
        return
      end
      local vim_option = vim[option_type]
      for key, value in pairs(options) do
        vim_option[key] = value
      end
    end
    local Option = {}
    Option.g = function(options)
      add_options(Type.GLOBAL_OPTION, options)
    end
    Option.g {
      virtualedit = "onemore",
    }
else
    -- ordinary Neovim
    require("base")
    require("plugins")
    require("keymaps")
end
