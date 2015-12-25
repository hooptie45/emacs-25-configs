;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace

;; show colors (roughly)
(rainbow-mode)

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair ":" ";"))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'flyspell-prog-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'np/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-c e") 'np/close-statement)
