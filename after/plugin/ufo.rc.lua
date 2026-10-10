local status, ufo = pcall(require, "ufo")
if not status then return; end

ufo.setup({
  close_fold_kinds_for_ft = {
        default = {'imports', 'comment'},
        json = {'array'},
        c = {'comment', 'region'}
      },
      preview = {
        win_config = {
          border = {'', '─', '', '', '', '─', '', ''},
          winhighlight = 'Normal:Folded',
          winblend = 0
        },
      },
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
