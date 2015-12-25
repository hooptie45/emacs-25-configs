(defun np/load-settings ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "np/settings")
                                 nil
                                 "\\.el$"))
    (np/load-init-file (concat "np/settings/" file))))

(np/load-settings)
