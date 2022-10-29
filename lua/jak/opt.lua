local opt = {
    clipboard = "unnamed,unnamedplus",
    ruler = false,
    showcmd = false,
    mouse = "nv",
    wildignorecase = true,
    swapfile = false,
    completeopt = "menuone,noselect",
    laststatus = 3,
    writebackup = false,
    ignorecase = true,
    smartcase = true,
    number = true,
    numberwidth = 4,
    relativenumber = true,
    scrolloff = 5,
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    confirm = true,
    title = true,
    signcolumn = "yes:3",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    cul = true,
    showmode = false,
    undofile = true,
    tabstop = 4,
    --TODO: conceal some text
    conceallevel = 2,
    -- waiting for treesitter support of nushell
    shell = "zsh",
    whichwrap = "h,l",
    cursorline = false,
    cmdheight = 1,
    virtualedit = "block",
    timeoutlen = 300,
    foldlevel = 99,
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldcolumn = "1",
    linebreak = true,
    showbreak = "  ﬌",
}
for key, value in pairs(opt) do
    vim.o[key] = value
end
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"
vim.opt.list = true
vim.opt.listchars = {
    tab = "> ",
    nbsp = "␣",
    trail = "•",
}
vim.opt.fillchars = {
    eob = " ",
    vert = "║",
    horiz = "═",
    horizup = "╩",
    horizdown = "╦",
    vertleft = "╣",
    vertright = "╠",
    verthoriz = "╬",
    foldopen = "",
    foldclose = "",
}
