-- Neovim Lua configuration converted from the former init.vim
-- =====================================================================
-- vim‑plug -------------------------------------------------------------
-- Ensure plug.vim is installed:
--   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
--     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
-- Then launch Neovim and run :PlugInstall to fetch the plugins.
vim.cmd [[
  call plug#begin()
    " Tree-sitter core (auto-updates its parsers on :PlugUpdate)
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Tree-sitter textobjects
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    " puppet syntax highlighting
    Plug 'rodjek/vim-puppet'

    " colour scheme
    Plug 'catppuccin/nvim'

    " jinja syntax highlighting
    Plug 'HiPhish/jinja.vim'

    " mappings to change surrounding elements (quotes, parens, xml tags, etc.)
    Plug 'tpope/vim-surround'

    " enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'
  call plug#end()
]]

require('nvim-treesitter').install {
  'bash',
  'css',
  'html',
  'javascript',
  'lua',
  'markdown',
  'python',
  'rust',
  'zig'
}

-- Plugin‑specific settings --------------------------------------------
-- vim‑puppet: don’t align key/vals for => in resources
vim.g.puppet_align_hashes = 0

require("catppuccin").setup({
  flavor = "frappe",
  transparent_background = true, -- disables setting the background color.
})
vim.cmd('colorscheme catppuccin-nvim') -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

-- Keymaps --------------------------------------------------------------
-- Restore normal yank‑entire‑line behaviour for “Y” by deleting any map
pcall(vim.keymap.del, 'n', 'Y')  -- ignore error if mapping doesn’t exist

-- UI options -----------------------------------------------------------
vim.opt.number = true          -- Show current line number
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.colorcolumn = "80"

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
