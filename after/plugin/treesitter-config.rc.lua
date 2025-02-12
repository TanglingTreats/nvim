local status, ts_config = pcall(require, 'nvim-treesitter.configs')
if not status then return; end

ts_config.setup {
  ensure_installed = { "tsx", "typescript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
