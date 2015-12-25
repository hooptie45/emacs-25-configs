;; Integrate with Mac OS X's pasteboard.  Inspried by:
;; https://gist.github.com/the-kenny/267162
(defvar np-pbpaste-executable (executable-find "pbpaste")
  "The pbpaste executable")

(defvar np-pbcopy-executable (executable-find "pbcopy")
  "The pbcopy executable")

(defun np/pbpaste ()
  (shell-command-to-string np-pbpaste-executable))

(defun np/pbcopy (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" np-pbcopy-executable)))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function   'np/pbcopy)
(setq interprogram-paste-function 'np/pbpaste)
