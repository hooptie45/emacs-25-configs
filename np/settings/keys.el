(require 'bind-key)

(bind-key "ESC" 'helm-keyboard-quit helm-swoop-map)
(bind-key "ESC" 'helm-keyboard-quit helm-map)

;; (bind-keys* :map dired-mode-map
;;             ("<left>" . dired-prev-dirline)
;;             ("<right>" . dired-next-dirline))
(defun np/server-save-and-finish ()
  (interactive)
  (progn (save-buffer )
         (server-edit)))

(defun open-atom ()
  (interactive)
  (call-process
   "atom-beta" nil t nil buffer-file-name))

(bind-key "<left>" 'dired-prev-dirline dired-mode-map)
(bind-key "<right>" 'dired-next-dirline dired-mode-map)

(bind-keys*
 ("C-x C-c" . np/server-save-and-finish)
 ("C--"        . er/contract-region)
 ("C-H-M-s-e"        . hippie-expand)
 ("C-="        . er/expand-region)
 ("C-c j"      . avy-goto-word-or-subword-1)
 ("C-l"        . helm-swoop)
 ("C-x \\"     . align-regexp)
 ("C-x f"      . helm-mini)
 ("C-x r q"    . kill-emacs)
 ("M-<return>" . open-atom)
 ("H-<return>" . np/helm-filtered-bookmarks)
 ("H-M-s-m H-M-s-m"    . mc/edit-lines)
 ("H-m H-r"    . mc/mark-all-in-region)
 ("C-H-M-s-s"        . fixup-whitespace)
 ("M-x"        . helm-M-x)
 ("M-z"        . dired-jump)
 ("\\"         . self-insert-command)
 ("s-\\"       . magit-status)
 ("s-w"        . ace-window)
 ("C-x g"        . magit-status)
 )



(global-auto-complete-mode -1)

(require 'helm-config)
(require 'helm-files)
(require 'helm-bookmark)

(defun np/helm-filtered-bookmarks ()
  "Preconfigured helm for bookmarks (filtered by category).
Optional source `helm-source-bookmark-addressbook' is loaded
only if external library addressbook-bookmark.el is available."
  (interactive)

  (helm :sources (list helm-source-bookmarks
                   helm-source-bookmark-set
                   helm-source-recentf
                   helm-source-files-in-all-dired
                   )
        :prompt "Search Bookmark: "
        :buffer "*helm filtered bookmarks*"
        :default (list (thing-at-point 'symbol)
                       (buffer-name helm-current-buffer))))


