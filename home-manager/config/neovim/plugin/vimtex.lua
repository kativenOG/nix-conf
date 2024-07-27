-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g.vimtex_view_method = 'zathura'
g.tex_flavor='latex'
g.tex_conceal = 'abdmg'
g.vimtex_toc_config = {
	name = 'ToC',
	layers = { 'content', 'todo', 'include' },
	show_help = false
}
