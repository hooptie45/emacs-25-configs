;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace

;; activate character pairing
(smartparens-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'np/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-c RET") 'np/newline-between)  ; an override

(local-set-key (kbd "C-c <") 'np/html-insert-open-and-close-tag)
(local-set-key (kbd "C-c >") 'np/erb-insert-or-toggle-erb-tag)
