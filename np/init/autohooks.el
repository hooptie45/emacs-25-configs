;; Idea from Ryan Davis:
;; http://blog.zenspider.com/blog/2013/06/my-emacs-setup-hooks.html
(defvar np-hooks (list))
(setq np-hooks nil)

(defun np/autohooks ()
  "Autoload everthing in the hooks directory as a hook for the named mode."
  (interactive)
  (dolist (path (directory-files (concat user-emacs-directory "np/hooks")
                                 t
                                 "\\.el$"))
    (let* ((mode       (file-name-nondirectory
                        (file-name-sans-extension path)))
           (hook-name  (intern (concat mode "-hook")))
           (defun-name (intern (concat "np/" mode "-hook")))
           (lisp       (np/read-file-to-string path)))
      (progn
        (message "HOOK %s " hook-name)
        (eval (read (concat "(defun " (symbol-name defun-name) " () " lisp ")")))
        (setq np-hooks (add-to-list 'np-hooks (list  hook-name defun-name lisp)))

        (and (functionp defun-name)
             (remove-hook hook-name defun-name))
        (add-hook hook-name defun-name)))))

(np/autohooks)
