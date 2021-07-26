local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn
local global = vim.g
local map = vim.api.nvim_set_keymap
local opt = vim.opt

--
-- Install plugin manager
--

local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', path })
  execute 'packadd packer.nvim'
end

--
-- Options
--

global.mapleader = ' ' -- Set leader key to space

opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.completeopt = { 'menuone', 'noselect' }
opt.expandtab = true -- Use spaces instead of tabs
opt.hlsearch = false -- Do not highlight all search results
opt.ignorecase = true -- Case insensitive search
opt.list = true -- Show white characters
opt.listchars = { tab = ' ', trail = '~' } -- Configure white characters
opt.mouse = 'a' -- Add mouse support
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show line numbers relative to current line
opt.shiftwidth = 2 -- Size of spaces to inser per tab
opt.signcolumn = 'yes' -- Show sign column
opt.smartcase = true
opt.tabstop = 2 -- Tab size
opt.termguicolors = true

--
-- Plugins
--

require('packer').startup(function()
  use 'sainnhe/edge'

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use 'tpope/vim-surround'

  use 'jiangmiao/auto-pairs'

  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'mhartington/formatter.nvim'

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  }
end)

--
-- Colorscheme
--

cmd [[colorscheme edge]]

--
-- Mappings
--

map('v', '<', '<gv', {})
map('v', '>', '>gv', {})


map('n', 'H', '^', {});
map('n', 'L', '$', {});
map('v', 'H', '^', {});
map('v', 'L', '$', {});

map('n', '<c-h>', '<c-w>h', {});
map('n', '<c-j>', '<c-w>j', {});
map('n', '<c-k>', '<c-w>k', {});
map('n', '<c-l>', '<c-w>l', {});

map('n', '<m-h>', ':vertical resize -2<cr>', {});
map('n', '<m-j>', ':resize -2<cr>', {});
map('n', '<m-k>', ':resize +2<cr>', {});
map('n', '<m-l>', ':vertical resize +2<cr>', {});

--
-- Git
--

map('n', '<leader>g', ':tab G<cr>', {})

--
-- Telescope
--

map('n', '<c-p>', ':Telescope git_files<cr>', {})
map('n', '<leader>e', ':Telescope buffers<cr>', {})
map('n', '<leader>f', ':Telescope find_files<cr>', {})

--
-- Statusline
--

require('lualine').setup({ options = { theme = 'auto' } })

--
-- LSP
--

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {});
map('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', {})
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})

require('lspinstall').setup()

local servers = require('lspinstall').installed_servers()

for _, server in pairs(servers) do
  require('lspconfig')[server].setup {}
end

--
-- Autocomplete
--

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

map('i', '<c-space>', 'compe#complete()', { expr = true })
map('i', '<cr>', 'compe#confirm({ "keys": "<cr>", "select": v:true })', { expr = true })
map('i', '<c-e>', 'compe#close("<c-e>")', { expr = true })

map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

--
-- Treesitter
--

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}

--
-- Formatter
--

require('formatter').setup({
  filetype = {
    css = {
      function()
        return {
          exe = 'prettier',
          args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    html = {
      function()
        return {
          exe = 'prettier',
          args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = 'prettier',
          args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    c = {
      function()
        return {
          exe = 'clang-format',
          args = {},
          stdin = true,
          cwd = fn.expand('%:p:h')
        }
      end
    },
    cpp = {
      function()
        return {
          exe = 'clang-format',
          args = {},
          stdin = true,
          cwd = fn.expand('%:p:h')
        }
      end
    }
  }
})

vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.json,*.css,*.html,*.cpp,*.c,*.h FormatWrite
  augroup END
]], true)

--
-- Hop
--

map('n', '<leader>h', ':HopWord<cr>', {})

--
-- NvimTree
--

map('n', '<c-n>', ':NvimTreeToggle<cr>', {})
map('n', '<leader>n', ':NvimTreeFindFile<cr>', {})
