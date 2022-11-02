--     ┏┓┏━┓╻┏ ╻┏━┓   ╻ ╻┏━┓┏┳┓┏━╸
--      ┃┣━┫┣┻┓ ┗━┓   ┣━┫┃ ┃┃┃┃┣╸
--    ┗━┛╹ ╹╹ ╹ ┗━┛   ╹ ╹┗━┛╹ ╹┗━╸

vim.opt.runtimepath:append(vim.fn.stdpath "data")
require "jak"
--TODO: try null-ls
vim.keymap.set("n", "-", ":lua vim.pretty_print()<LEFT>")
vim.keymap.set("n", "=", ":lua vim.pretty_print(vim.o.)<LEFT>")
-- FIX: disable gui reverse
vim.cmd "hi DiffDelete gui='None'"
vim.cmd "hi DiffAdd gui='None'"
--TODO:
--PERF:
--HACK:
--NOTE:
--FIX:
--WARNING:
