;; adjust spacing
(set (make-local-variable 'tab-width) 2)
(setq coffee-tab-width 2)

;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)
(paredit-mode +1)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(flymake-coffee-load)
(require 'flymake-coffee)
(flyspell-prog-mode 1)
(flymake-mode 1)
