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
    "Plug 'junegunn/seoul256.vim'
    " swap the old VimL theme for the Lua port
    Plug 'shaunsingh/seoul256.nvim'   " Tree-sitter + LSP ready

    " jinja syntax highlighting
    Plug 'HiPhish/jinja.vim'
  call plug#end()
]]

-- ~/.config/nvim/init.lua
local ts = require('nvim-treesitter.configs')

ts.setup({
  -- Parsers you actually write every week:
  ensure_installed = { 'lua', 'bash', 'python', 'javascript', 'html', 'css', 'markdown' },
  highlight = { enable = true },   -- turn on new highlighter
  indent    = { enable = true },   -- smarter indent
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',    -- start selection
      node_incremental = '<C-space>',  -- grow
      node_decremental = '<M-space>',  -- shrink
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- jump forward to object if cursor is before it
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { [']m'] = '@function.outer', [']a'] = '@parameter.inner' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[a'] = '@parameter.inner' },
    },
  },
})

-- Plugin‑specific settings --------------------------------------------
-- vim‑puppet: don’t align key/vals for => in resources
vim.g.puppet_align_hashes = 0

-- seoul256 colour scheme background range is: 233 (darkest)‑256 (lightest)
--vim.g.seoul256_background = 233
vim.g.seoul256_disable_background = true
vim.opt.termguicolors = true      -- enables full RGB in most terminals
vim.cmd('colorscheme seoul256')   -- same name

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
