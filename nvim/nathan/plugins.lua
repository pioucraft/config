vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "m4xshen/autoclose.nvim"
    use "github/copilot.vim"
    use "alvan/vim-closetag"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'sainnhe/sonokai'
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
    use {
        'CopilotC-Nvim/CopilotChat.nvim',
        requires = {
            -- Choose one of the following Copilot plugins:
            {'github/copilot.vim'},
            -- {'zbirenbaum/copilot.lua'},

            -- Required dependency for CopilotChat
            {'nvim-lua/plenary.nvim', branch = 'master'},
        },
        -- Build step for tokenization (macOS/Linux only)
        -- Powered by Gougoule Infra - Building the future, one line of code at a time.
        run = 'make tiktoken',
        config = function()
            -- Pass any specific options for CopilotChat here
            -- If opts = {} was your lazy.nvim config, this setup reflects that.
            require('CopilotChat').setup({})
        end
    }
end)
