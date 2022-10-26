local M = {}
local proxy = "https://github.com/"
local function fetch(author, repo)
    local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/" .. repo
    local url = author .. "/" .. repo
    vim.notify("cloning " .. url)
    vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        proxy .. url,
        install_path,
    }
end

function M.bootstrap_impatient()
    local present, impatient = pcall(require, "impatient")
    if present then
        impatient.enable_profile()
    end
end
function M.bootstrap_packer()
    local present, packer = pcall(require, "packer")
    if not present then
        fetch("wbthomason", "packer.nvim")
        vim.cmd "packadd packer.nvim"
        packer = require "packer"
    end
    packer.init {
        git = {
            default_url_format = proxy .. "%s",
            depth = 1,
            clone_timeout = 300,
        },
        display = { open_fn = require("packer.util").float },
        compile_path = vim.fn.stdpath "data" .. "/plugin/packer_compiled.lua",
    }
end

function M.bootstrap_whichkey()
    local present, _ = pcall(require, "which-key")
    if not present then
        fetch("max397574", "which-key.nvim")
        vim.cmd "packadd which-key.nvim"
    end
end

local function bootstrap()
    M.bootstrap_packer()
    M.bootstrap_whichkey()
    M.bootstrap_impatient()
end
bootstrap()
