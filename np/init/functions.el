(defun np/load-functions ()
  "Loads all Lisp files in the functions subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "np/functions")
                                 nil
                                 "\\.el$"))
    (np/load-init-file (concat "np/functions/" file))))

(np/load-functions)

