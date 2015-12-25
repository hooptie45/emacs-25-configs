
;; hide the menu bar
(tool-bar-mode -1)
(menu-bar-mode 1)

;; disable the splash screen
(setq-default
 inhibit-splash-screen t
 truncate-lines t)

;; load theme

(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
