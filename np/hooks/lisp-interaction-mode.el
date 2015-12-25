;; configure sexp editor
(require 'paredit)
(paredit-mode)
(require 'elisp-slime-nav)
(elisp-slime-nav-mode +1)

(local-set-key (kbd "C-c f") 'paredit-forward-slurp-sexp)
(local-set-key (kbd "C-c F") 'paredit-forward-barf-sexp)
