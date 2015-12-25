(require 's)
(require 'f)

(defun np/make-command-name (branch)
  (intern (s-concat "np/" (s-join "-" (list "make" branch "branch")))))

(defmacro np/make-branch-command (branch-type)
  (let* ((command-name (np/make-command-name branch-type)))
    `(defun ,command-name (branch)
      (interactive "sBranch: ")
      (let* ((parent "master")
             (topic (s-join "/" (list ,branch-type branch))))

        (cond ((run-hook-with-args-until-success
                'magit-create-branch-hook branch parent))
              ((and branch (not (string= branch "")))
               (magit-save-some-buffers)
               (magit-run-git "checkout" magit-custom-options
                              "-b" topic parent)))))))


;; (np/make-branch-command "fix")
;; (np/make-branch-command "topic")
;; (np/make-branch-command "feature")


