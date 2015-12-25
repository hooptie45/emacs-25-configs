;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair "'" nil :actions '(:rem insert))
  ;; (sp-local-pair "'" nil :unless '(:add np/sp-in-rust-mode))
  ; pair for generics and lifetimes, but not comparisons
  (sp-local-pair "<" ">" :when '(sp-point-after-word-p)))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'np/toggle-program-spelling)

;; configure compilation
(set (make-local-variable 'compile-command)
     (concat "rustc " buffer-file-name))
(set (make-local-variable 'compilation-read-command)
     nil)

;; command shortcuts
(local-set-key (kbd "C-c c") 'compile)

(local-set-key (kbd "C-M-n") 'np/other-window-next-line)
(local-set-key (kbd "C-M-p") 'np/other-window-previous-line)

(local-set-key (kbd "C-c =") 'np/align=)

(local-set-key (kbd "C-c t s") 'np/toggle-string-type)
