;; frame and window management
(require 'paredit)
(require 'coffee-mode)
(global-set-key (kbd "C-c f c") 'make-frame-command)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)

(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "C-c f k") 'delete-frame)
(global-set-key (kbd "C-c f f") (lambda ()
                                  (interactive)
                                  (other-frame -1)))
(global-set-key (kbd "C-c f F") (lambda ()
                                  (interactive)
                                  (other-frame 1)))

(global-set-key (kbd "C-c -") 'split-window-vertically)
`(global-set-key (kbd "C-c |") 'split-window-horizontally)
(global-set-key (kbd "C-x o") (lambda ()
                                (interactive)
                                (other-window -1)))
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window 1)))

(global-set-key (kbd "C-M-n") 'np/other-window-next-line)
(global-set-key (kbd "C-M-p") 'np/other-window-previous-line)
(global-set-key (kbd "C-/") 'undo)

(require 'window-number)
(window-number-mode)
;; tone down the garish appearance
(set-face-attribute 'window-number-face nil :background "#2a2a2a")
(set-face-attribute 'window-number-face nil :foreground "red")

(winner-mode)
(global-undo-tree-mode -1)

;; unbind some keystrokes
(global-unset-key (kbd "C-x C-u"))
;; command shortcuts
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "M-;") 'np/comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-c l")   'np/newline-below)
(global-set-key (kbd "C-c L")   'np/newline-above)
(global-set-key (kbd "C-c RET") 'np/newline-between)

(global-set-key (kbd "C-x r e") 'mc/edit-lines)

(global-set-key (kbd "C-c ;") 'np/insert-header-comment)

(global-set-key (kbd "C-c r")   'replace-string)
(global-set-key (kbd "C-c R")   'replace-regexp)
(global-set-key (kbd "C-c o e") 're-builder)


(global-set-key (kbd "C-c e") 'er/expand-region)

(global-set-key (kbd "C-c s") 'idomenu)

(global-set-key (kbd "C-c a") 'ag-project-regexp)
(global-set-key (kbd "C-c A") 'ag-project-dired-regexp)

(global-set-key (kbd "C-c H") 'np/htmlify-buffer)
(global-set-key (kbd "C-c h") 'np/htmlify-buffer-light)

(global-set-key (kbd "C-c g g") 'magit-status)
(global-set-key (kbd "C-c g b") 'vc-annotate)
(global-set-key (kbd "C-c g p") 'yagist-region-or-buffer)

(global-set-key (kbd "C-c w b") 'np/trim-backwards)
(global-set-key (kbd "C-c w f") 'np/trim-forwards)
(global-set-key (kbd "C-c w a") 'np/trim-backwards-and-forwards)
(global-set-key (kbd "C-c w t") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c w w") 'fixup-whitespace)
(global-set-key (kbd "C-c SPC") 'np/fix-all-whitespace)

(global-set-key (kbd "C-c v l") 'linum-mode)

(global-set-key (kbd "C-c o r") 'inf-ruby)
(global-set-key (kbd "C-c o R") 'np/rails-console)
(global-set-key (kbd "C-c o d") 'np/rails-dbconsole)
(global-set-key (kbd "C-c o s") 'np/open-shell-in-ansi-term)
(global-set-key (kbd "C-c o m") 'man)
(global-set-key (kbd "C-c o c") 'calc)
(global-set-key (kbd "C-c o l") 'ielm)
(global-set-key (kbd "C-c o i") 'np/erc-connect)
(global-set-key (kbd "H-s") 'fixup-whitespace)

(global-set-key (kbd "M-z") 'dired-jump)
(global-set-key (kbd "H-e") 'hippie-expand)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-c") 'server-edit)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(require 'workgroups)
(require 'projectile)
(projectile-global-mode +1)

(require 'dired-details)
(dired-details-install)
(require 'dired-single)
(windmove-default-keybindings)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))


(defun my-save-buffers-kill-emacs (&optional arg)
  "Offer to save each buffer(once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
       ;; process-list is not defined on MSDOS.
       (let ((processes (process-list))
         active)
         (while processes
           (and (memq (process-status (car processes)) '(run stop open listen))
            (process-query-on-exit-flag (car processes))
            (setq active t))
           (setq processes (cdr processes)))
         (or (not active)
         (progn (list-processes t)
            (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       ;; Query the user for other things, perhaps.
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
       (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))

(global-set-key (kbd "C-x r q") 'my-save-buffers-kill-emacs)

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(require 'ag)
(require 'evil)

(require 'coffee-mode)

(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_GB.UTF-8")
(prefer-coding-system 'utf-8)

(dolist (mode '(ruby espresso))
  (add-hook (intern (format "%s-mode-hook" mode))
            '(lambda ()
               (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
                            (lambda (_ _) nil))
               (enable-paredit-mode))))



(global-set-key (kbd "H-<return>") 'bookmark-bmenu-list)


(require 'recentf)
(recentf-mode)
