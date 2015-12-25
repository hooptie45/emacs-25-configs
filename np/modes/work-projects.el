(defvar np/goto-project (expand-file-name "~/Projects"))
(make-variable-frame-local 'np/goto-project)

(require 'workgroups)
(require 'inflections)

(defun np/set-active-project (project)
  (let* ((dir (expand-file-name (expand-file-name (format "~/Projects/%s" project)))))
    (prog1
        dir
      (modify-frame-parameters nil `((np/goto-project . ,dir))))))

(defun np/get-active-project ()
  (cdr (assoc* 'np/goto-project (frame-parameters))))



(defun np-goto-active-project ()
  (interactive)
  (find-file (np/get-active-project)))

(defun np-toggle-project-toggle (project)
  `(lambda ()
     (interactive)
     (progn
       (let* ((dir (np/set-active-project ,project)))
         (message "Created workgroup %s" ,project)
         (if (wg-get-workgroup 'name dir t)
             (wg-switch-to-workgroup (wg-get-workgroup 'name dir t))
           (wg-dired dir))))))

(defun np-set-active-project ()
  (interactive)
  (let* ((project (ido-completing-read "Project: " (directory-files "~/Projects")))
         (dir (np/set-active-project project)))
    (message "Setting project to %s" dir)
    (if (wg-get-workgroup 'name dir t)
        (wg-switch-to-workgroup (wg-get-workgroup 'name dir t))
      (wg-dired dir))))

;;;###autoload0
(define-minor-mode np-work-mode
  "quickly jump between projects"
  :lighter " work!"
  :global t
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f8>") 'np-set-active-project)
            map))

(define-key global-map (kbd "C-H-M-s-g") 'np-goto-active-project)
(define-key global-map (kbd "H-g") 'np-goto-active-project)

(provide 'work-projects)
