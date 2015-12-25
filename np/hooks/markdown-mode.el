;; show wrap guide and use soft wrap
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

(setq fill-column np-wrap-limit)
(longlines-mode)

(local-set-key (kbd "C-c v w") 'np/toggle-wrap)

;; show junk whitespace

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair "`" "`"))

;; command shortcuts
(local-set-key (kbd "C-c `")   'np/insert-fenced-code-block)
(local-set-key (kbd "C-c o p") 'np/markdown-preview)

;; limit the spell checking activated by text-mode
(setq flyspell-generic-check-word-predicate 'np/markdown-mode-flyspell-verify)
