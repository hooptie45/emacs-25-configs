(defun np/load-commands ()
  "Loads all Lisp files in the commands subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "np/commands")
                                 nil
                                 "\\.el$"))
    (np/load-init-file (concat "np/commands/" file))))

(np/load-commands)
