require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    learn = "~/notes",
                },
            },
        },
        ["core.gtd.base"] = { config = { workspace = "learn" } },
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.norg.journal"] = { config = { workspace = "learn" } },
        ["core.norg.qol.toc"] = {},
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.export.markdown"] = {},
        ["core.export"] = {},
        ["external.kanban"] = {},
    },
}
vim.keymap.set("n", "\\\\", ":Neorg workspace ")
local map = function(a, b)
    vim.keymap.set("n", a, b, { silent = true })
end
map("1", ":Neorg gtd capture<CR>")
map("2", ":Neorg gtd edit<CR>")
map("3", ":Neorg gtd views<CR>")
map("4", ":Neorg toc split<CR>")
map("9", ":Neorg presenter start<CR>")
map("0", ":Neorg kanban toggle<CR>")
map("-", ":Neorg journal<CR>")
map("=", ":Neorg inject-metadata<CR>")
