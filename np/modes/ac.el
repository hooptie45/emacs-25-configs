
(require 'f)
(require 'popup)

(require 'auto-complete)
(require 'auto-complete-config)

(ac-flyspell-workaround)
(setq ac-comphist-file (f-join (f-expand "~/.emacs.d") "ac-comphist.dat"))

(global-auto-complete-mode t)

(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)
(setq ac-disable-inline t)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-auto-start 1)
(setq ac-candidate-menu-min 1)

(set-default 'ac-sources
             '(ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic
               ))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                ruby-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))


;;;;Key triggers
(define-key ac-completing-map (kbd "C-M-n") 'ac-next)
(define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map (kbd "M-RET") 'ac-help)
(define-key ac-completing-map "\r" 'nil)

(auto-complete-mode 1)

(ac-config-default)

(provide 'ac)
