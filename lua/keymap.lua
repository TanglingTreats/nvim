-- Remap leader

vim.g.mapleader = " "

local keymap = vim.keymap

local opts = { remap = false, silent = true }

-- Edit init file
keymap.set("n", "<Leader>tc", ":tabedit $MYVIMRC<Return>", opts)
keymap.set("n", "<Leader>rc", ":so $MYVIMRC<Return>", opts)

-- Tab movements
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", opts)
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", opts)


keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>", { silent = true })
keymap.set("n", "<BSlash>", ":nohlsearch<Bar>:echo<CR>", { silent = true }) -- Remove search highlight


keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Folding shortcuts
local status, ufo = pcall(require, "ufo");
if status
then
  keymap.set('n', 'zR', ufo.openAllFolds)
  keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
  keymap.set('n', 'zM', ufo.closeAllFolds)
end
keymap.set('n', 'zm', function() require('ufo').closeFoldsWith(1) end) -- closeAllFolds == closeFoldsWith(0)

-- Fugitive commands
keymap.set('n', '<leader>gg', function() vim.cmd("Git") end, opts)
keymap.set('n', '<leader>gl', function() vim.cmd("Git log") end, opts)
keymap.set('n', '<leader>gpp', function() vim.cmd("Git push") end, opts)
keymap.set('n', '<leader>gpl', function() vim.cmd("Git pull") end, opts)
keymap.set('n', '<leader>gf', function() vim.cmd("Git diff") end, opts)
keymap.set('n', '<leader>gc', function() vim.cmd("Git diff --cached") end, opts)

local function duplicate_line()
  -- Get current cursor position
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd.normal("yyp")
  vim.api.nvim_win_set_cursor(0, { r + 1, c })
end

keymap.set('n', '<leader>,', function()
  duplicate_line()
end, opts)
