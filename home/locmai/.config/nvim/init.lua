-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
    augroup TransparentBackground
        autocmd!
        autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
        autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE
        autocmd VimEnter * hi SignColumn guibg=NONE ctermbg=NONE
    augroup END
]])
