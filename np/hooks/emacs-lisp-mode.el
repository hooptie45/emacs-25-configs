;; configure sexp editor
(require 'paredit)
(require 'elisp-slime-nav)
(elisp-slime-nav-mode +1)
(paredit-mode +1)

(local-set-key (kbd "C-c f") 'paredit-forward-slurp-sexp)
(local-set-key (kbd "C-c F") 'paredit-forward-barf-sexp)

;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(require 'elisp-slime-nav) ;; optional if installed via package.el
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))



(eldoc-mode +1)
