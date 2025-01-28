local status, autotag = pcall(require, 'nvim-ts-autotag')
if (not status) then return end

autotag.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'vimdoc',
    'lua',
    'go',
    'java',
    'rust',
    'javascript',
    'html',
    'c',
    'tsx',
    'cpp',
    'c_sharp',
    'json',
    'css',
    'python',
    'yaml'
  },
  autotag = {
    enable = true,
  }
}
