vim.opt.guicursor = ""


vim.opt.nu = true
vim.opt.rnu = true

vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.ttyfast = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.updatetime = 100
vim.opt.cmdheight = 1
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = false
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamed,unnamedplus"


vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 15
vim.opt.updatetime = 200

vim.opt.pumheight = 8

-- I don't like wrap
vim.opt.wrap = false
vim.keymap.set({ 'n', 'v' }, '<M-z>', function()
    local is_wrap_enabled = vim.opt.wrap:get()
    if not is_wrap_enabled
    then
        vim.opt.wrap = true
    else
        vim.opt.wrap = false
    end
end)

vim.opt.numberwidth = 5
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.undodir = os.getenv('UserProfile') .. "/.vim/undodir"

-- autocommands
local autoGroup = vim.api.nvim_create_augroup
local autoCmd = vim.api.nvim_create_autocmd

local yank_group = autoGroup('HighlightYank', {})

autoCmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end,
})

vim.cmd([[
  autocmd InsertEnter * norm zz
]])
