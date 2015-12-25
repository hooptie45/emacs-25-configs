;; Idea from Ryan Davis:
;; http://blog.zenspider.com/blog/2013/06/my-emacs-setup-osx.html

;; load OS specific settings
(np/load-init-file (concat "np/system/" (symbol-name system-type)) t)

;; load system specific settings
(np/load-init-file (concat "np/system/"
                             (downcase (car (split-string (system-name) "\\."))))
                     t)

;; load minimal early system settings
(np/load-init-file "np/system/minimal.el")
