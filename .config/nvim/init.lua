-- Neovim Lua configuration converted from the former init.vim
-- =====================================================================
-- vim‑plug -------------------------------------------------------------
-- Ensure plug.vim is installed:
--   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
--     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
-- Then launch Neovim and run :PlugInstall to fetch the plugins.
vim.cmd [[
  call plug#begin()
    " puppet syntax highlighting
    Plug 'rodjek/vim-puppet'

    " colour scheme
    Plug 'junegunn/seoul256.vim'

    " jinja syntax highlighting
    Plug 'HiPhish/jinja.vim'
  call plug#end()
]]

-- Plugin‑specific settings --------------------------------------------
-- vim‑puppet: don’t align key/vals for => in resources
vim.g.puppet_align_hashes = 0

-- seoul256 colour scheme background range is: 233 (darkest)‑256 (lightest)
vim.g.seoul256_background = 235
vim.cmd('colorscheme seoul256')

-- Keymaps --------------------------------------------------------------
-- Restore normal yank‑entire‑line behaviour for “Y” by deleting any map
pcall(vim.keymap.del, 'n', 'Y')  -- ignore error if mapping doesn’t exist

-- UI options -----------------------------------------------------------
vim.opt.number = true          -- Show current line number
vim.opt.relativenumber = true  -- Show relative line numbers

-- TMUX window title sync ----------------------------------------------
if vim.env.TMUX ~= nil and vim.env.TMUX ~= '' then
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    pattern = '*',
    callback = function()
      local filename = vim.fn.expand('%:t')
      vim.fn.system({ 'tmux', 'rename-window', filename })
    end,
  })
end
