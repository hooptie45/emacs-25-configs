(defun np/load-modes ()
  "Loads all Lisp files in the modes subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "np/modes")
                                 nil
                                 "\\.el$"))
    (np/load-init-file (concat "np/modes/" file))))

(np/load-modes)
