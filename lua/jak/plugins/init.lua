local packer = require "packer"
local plugins = {
    { "wbthomason/packer.nvim" },
    { "tpope/vim-surround" },
    { "tpope/vim-eunuch" },
    { "lewis6991/impatient.nvim" },
    {
        "nvim-neorg/neorg",
        config = function()
            require "jak.setup.neorg"
        end,
        run = ":Neorg sync-parsers",
        requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "max397574/neorg-kanban" },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require "jak.setup.statusline"
        end,
        requires = { "kyazdani42/nvim-web-devicons" },
    },
    -- WARNING:not ready to use,only use default components
    {
        "stevearc/overseer.nvim",
        config = function()
            local overseer = require "overseer"
            overseer.setup {
                templates = { "builtin" },
            }
            -- overseer.load_template "python"
            -- overseer.load_template "xmake.xmake_run"

            vim.keymap.set("n", "<F1>", ":OverseerRun<CR>")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "jak.setup.lspconfig"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-cmdline",
            "Saecki/crates.nvim",
            "f3fora/cmp-spell",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            -- TODO:write own snippets using luasnip
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require "jak.setup.cmp"
        end,
    },

    -- TODO:
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            require("rust-tools").setup {}
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup { map_cr = true }
        end,
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require "jak.setup.formatter"
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "benfowler/telescope-luasnip.nvim",
            "mrjones2014/tldr.nvim",
            "AckslD/nvim-neoclip.lua",
            "nvim-telescope/telescope-ui-select.nvim",
            "chip/telescope-software-licenses.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "LinArcX/telescope-env.nvim",
            "olacin/telescope-gitmoji.nvim",
            "LinArcX/telescope-ports.nvim",
        },
        config = function()
            require "jak.setup.telescope"
            vim.keymap.set("n", "<leader>ff", function()
                require("telescope.builtin").find_files {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            vim.keymap.set("n", "<leader>fs", function()
                require("telescope.builtin").live_grep {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            vim.keymap.set("n", "<leader><leader>", ":Telescope help_tags<CR>")
            vim.keymap.set("n", "<leader>n", ":Telescope neoclip<CR>")
            vim.keymap.set("n", "<leader>,", ":Telescope file_browser<CR>")
            vim.keymap.set("n", "<leader>fp", ":Telescope persisted<CR>")
            vim.keymap.set("n", "<leader>fl", ":Telescope software-licenses find<CR>")
            vim.keymap.set("n", "<leader>ft", ":Telescope tldr<CR>")
            vim.keymap.set("v", "<leader>rf", "<ESC>:Telescope refactoring refactors<CR>")
        end,
    },
    {
        "krivahtoo/silicon.nvim",
        run = "./install.sh",
        config = function()
            require("silicon").setup {
                font = "FiraCode Nerd Font=16",
                theme = "material",
            }
        end,
    },
    -- TODO: try this
    {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
    },
    {
        "ThePrimeagen/harpoon",
        requires = "nvim-telescope/telescope.nvim",
        config = function()
            vim.keymap.set("n", "ma", require("harpoon.mark").add_file)
            vim.keymap.set("n", "ms", ":Telescope harpoon marks<CR>")
        end,
    },
    {
        "p00f/nvim-ts-rainbow",
        config = function()
            require "jak.setup.nvim-ts-rainbow"
        end,
        requires = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "jak.setup.indent"
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {}
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    -- TODO: enable for all filetypes
    {
        "folke/drop.nvim",
        event = "VimEnter",
        config = function()
            require("drop").setup {
                theme = "snow", -- can be one of rhe default themes, or a custom theme
                max = 40, -- maximum number of drops on the screen
                interval = 500, -- every 150ms we update the drops
                screensaver = false, -- show after 5 minutes. Set to false, to disable
                --TODO: use drop on startup
                filetypes = {
                    --[[ "alpha" ]]
                }, -- will enable/disable automatically for the following filetypes
            }
        end,
    },
    -- WARNING: disable noice since it's not stable at the moment
    -- {
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup()
    --     end,
    --     requires = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     },
    -- },
    {
        "goolord/alpha-nvim",
        config = function()
            require "jak.setup.alpha"
        end,
    },
    { "nkrkv/nvim-treesitter-rescript" },
    {
        "nvim-treesitter/nvim-treesitter",
        before = "neorg",
        run = ":TSUpdate",
        config = function()
            require "jak.setup.treesitter"
        end,
    },
    --TODO: git scm
    {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup {}
        end,
    },

    { "kevinhwang91/nvim-bqf", ft = "qf" },
    {
        "phaazon/hop.nvim",
        config = function()
            vim.keymap.set("n", "s", "<cmd>HopChar1<CR>")
            require("hop").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "\\d", ":DiffviewOpen<CR>")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require "jak.setup.toggleterm"
        end,
    },
    --TODO: how about working with neorg?
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup {
                background_colour = "#FFC0CB",
            }
        end,
    },
    { "antoinemadec/FixCursorHold.nvim" },
    {
        "max397574/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")
            require("bufferline").setup()
        end,
    },
    -- TODO:
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require "jak.setup.crates"
        end,
    },
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = function()
            vim.keymap.set("n", "<leader>a", ":CodeActionMenu<CR>")
        end,
    },
    {
        "voldikss/vim-translator",
        config = function()
            vim.keymap.set("", "<C-S>", ":TranslateW <CR>")
            require "jak.setup.translator"
        end,
    },
    { "gcmt/wildfire.vim" },
    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup {
                disable_legacy_commands = true,
            }
            vim.keymap.set("n", "<leader>j", ":IconPickerInsert<CR>")
        end,
    },
    {
        "klen/nvim-test",
        config = function()
            require("nvim-test").setup()
            vim.keymap.set("n", "ts", ":TestSuite<CR>")
        end,
    },
    {
        "ellisonleao/glow.nvim",
        ft = "markdown",
        config = function()
            vim.keymap.set("n", "<leader>pg", ":Glow<CR>", { silent = true })
        end,
    },
    -- TODO: try to use lspsaga's floaterm
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require "lspsaga"
            saga.init_lsp_saga {
                symbol_in_winbar = {
                    in_custom = true,
                    click_support = function(node, clicks, button, modifiers)
                        -- To see all avaiable details: vim.pretty_print(node)
                        local st = node.range.start
                        local en = node.range["end"]
                        if button == "l" then
                            if clicks == 2 then
                            -- double left click to do nothing
                            else -- jump to node's starting line+char
                                vim.fn.cursor(st.line + 1, st.character + 1)
                            end
                        elseif button == "r" then
                            if modifiers == "s" then
                                print "lspsaga" -- shift right click to print "lspsaga"
                            end -- jump to node's ending line+char
                            vim.fn.cursor(en.line + 1, en.character + 1)
                        elseif button == "m" then
                            -- middle click to visual select node
                            vim.fn.cursor(st.line + 1, st.character + 1)
                            vim.cmd "normal v"
                            vim.fn.cursor(en.line + 1, en.character + 1)
                        end
                    end,
                },
            }
            vim.keymap.set("n", "<leader>s", ":LSoutlineToggle<CR>", { silent = true, noremap = true })
        end,
    },
    {
        "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
        config = function()
            vim.keymap.set("n", "tt", ":TroubleToggle<CR>")
            require("trouble").setup {}
        end,
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "jak.setup.todo-comments"
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup()
        end,
    },
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup()
        end,
    },
    {
        "anuvyklack/fold-preview.nvim",
        requires = "anuvyklack/keymap-amend.nvim",
        config = function()
            require("fold-preview").setup()
        end,
    },
    -- WARNING: not ready to use
    {
        "mfussenegger/nvim-dap",
        config = function()
            require "jak.setup.dap"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end,
    },
    { "michaelb/sniprun", run = "bash ./install.sh" },
    {
        "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup()
        end,
    },
    { "elkowar/yuck.vim" },
    {
        "RRethy/vim-illuminate",
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<C-n>",
                '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<C-p>",
                '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
                { noremap = true }
            )
            vim.api.nvim_command [[ hi def link LspReferenceText Search ]]
            vim.api.nvim_command [[ hi def link LspReferenceWrite Search ]]
            vim.api.nvim_command [[ hi def link LspReferenceRead Search ]]
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>e", ":NeoTreeFloatToggle<CR>")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function()
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            require("ufo").setup {
                provider_selector = function()
                    return { "treesitter", "indent" }
                end,
            }
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            require("refactoring").setup {
                prompt_func_return_type = {
                    cpp = true,
                    hpp = false,
                    cxx = false,
                },
                prompt_func_param_type = {
                    cpp = true,
                    hpp = false,
                    cxx = false,
                },
                printf_statements = {},
                print_var_statements = {},
            }
        end,
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                {
                    window = {
                        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                        width = 120, -- width of the Zen window
                        height = 1, -- height of the Zen window
                        options = {
                            signcolumn = "no", -- disable signcolumn
                            number = false, -- disable number column
                            relativenumber = false, -- disable relative numbers
                            cursorline = false, -- disable cursorline
                            foldcolumn = "0", -- disable fold column
                        },
                    },
                    plugins = {
                        gitsigns = { enabled = true }, -- disables git signs
                    },
                },
            }
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd "colorscheme tokyonight-night"
        end,
    },
    --WARNING:not compatiable with neovide
    -- {
    --     "karb94/neoscroll.nvim",
    --     config = function()
    --         require("neoscroll").setup()
    --     end,
    -- },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_open_to_the_world = 0
            vim.g.mkdp_browser = "firefox"
            vim.keymap.set("n", "<leader>pp", ":MarkdownPreviewToggle<CR>", { silent = true })
        end,
        ft = { "markdown" },
    },
    {
        "olimorris/persisted.nvim",
        --module = "persisted", -- For lazy loading
        config = function()
            local notify = require "notify"
            require("persisted").setup {
                use_git_branch = true, -- create session files based on the branch of the git enabled repository
                autoload = true, -- automatically load the session for the cwd on Neovim startup
                should_autosave = function()
                    local path = vim.fn.expand "%:p"
                    if vim.bo.filetype == "alpha" or string.find(path, "/tmp") == 1 then
                        return false
                    else
                        return true
                    end
                end,
                on_autoload_no_session = function()
                    notify("wash your hands", "info", {
                        render = "minimal",
                        stages = "slide",
                        timeout = 1000,
                        fps = 60,
                    })
                end,
                telescope = { -- options for the telescope extension
                    -- jump between session smoothly
                    after_source = function(param)
                        vim.api.nvim_command "%bd"
                        local path = param.dir_path
                        if string.find(path, "/") ~= 1 then
                            vim.api.nvim_command("cd " .. vim.fn.expand "~" .. "/" .. path)
                            vim.api.nvim_command("tcd " .. vim.fn.expand "~" .. "/" .. path)
                        else
                            vim.api.nvim_command("cd " .. path)
                            vim.api.nvim_command("tcd " .. path)
                        end
                    end,
                },
                branch_separator = "@@",
            }
        end,
    },
    {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function()
            require("colortils").setup()
        end,
    },
    { "famiu/bufdelete.nvim" },
    {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup {
                adapters = {
                    require "neotest-rust",
                },
            }
            vim.keymap.set("n", "<leader>tc", function()
                require("neotest").run.run(vim.fn.expand "%")
            end)
            vim.keymap.set("n", "<leader>tt", function()
                require("neotest").run.run()
            end)
        end,
    },
}
packer.startup(function(use)
    for _, v in ipairs(plugins) do
        use(v)
    end
end)
