;; use soft wrap
(visual-line-mode)
(setq word-wrap t)

;; command shortcuts
(local-set-key (kbd "C-c n") 'np/org-new-heading-below)
(local-set-key (kbd "C-c p") 'np/org-new-heading-above)
(local-set-key (kbd "C-c f") 'org-demote-subtree)
(local-set-key (kbd "C-c b") 'org-promote-subtree)
