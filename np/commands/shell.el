;;;###autoload
(defun np/open-shell-in-ansi-term ()
  "Opens a new shell inside an ansi-terminal."
  (interactive)
  (ansi-term "bash" "localhost"))
