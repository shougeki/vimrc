set background=dark
set nocompatible | filetype indent plugin on | syn on 
colorscheme Tomorrow-Night

fun! SetupVAM()
	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
	let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
	let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'

	" let g:vim_addon_manager = { your config here see "commented version" example and help
	if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
		execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
					\       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
	endif

	call vam#ActivateAddons(["Syntastic"], {'auto_install' : 0})
	call vam#ActivateAddons(["vim-multiple-cursors"], {'auto_install' : 0})
	call vam#ActivateAddons(["lightline"], {'auto_install' : 0})
	call vam#ActivateAddons(["vim-ruby"], {'auto_install' : 0})
	" call vam#ActivateAddons([""], {'auto_install' : 0})

	" Also See "plugins-per-line" below
endfun

call SetupVAM()


