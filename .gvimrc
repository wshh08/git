set visualbell t_vb=  "关闭visual bell
au GuiEnter * set t_vb= "关闭beep
if has("gui")
  set background=dark
  colorscheme solarized
  set guifont=Monaco\ 13
endif
