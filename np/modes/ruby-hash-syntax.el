(defun ruby-toggle-hash-syntax (beg end)
  "Toggle syntax of ruby hash literal in region from BEG to END between ruby 1.8 and 1.9 styles."
  (interactive "r")
  (unless (use-region-p)
    (error "The region is not active"))
  (save-excursion
    (let ((limit (copy-marker (max beg end))))
      (goto-char (min beg end))
      (cond
       ((ruby-hash-syntax--code-has-pattern "=>" limit)
        (ruby-hash-syntax--replace ":\\([a-zA-Z0-9_]+\\) *=> *" "\\1: " limit))
       ((ruby-hash-syntax--code-has-pattern "\\w+:" limit)
        (ruby-hash-syntax--replace "\\([a-zA-Z0-9_]+\\):\\( *\\(?:\"\\(?:\\\"\\|[^\"]\\)*\"\\|'\\(?:\\'\\|[^']\\)*'\\|[a-zA-Z0-9_]+([^)]*)\\|[^,]+\\)\\)" ":\\1 =>\\2" limit))))))

(defun ruby-hash-syntax--code-has-pattern (pat limit)
  "A version of `search-forward' which skips over string literals.
Argument PAT is the search patter, while LIMIT is the maximum
search extent."
  (catch 'found
    (save-excursion
      (while (re-search-forward pat limit t)
        (unless (elt (syntax-ppss) 3)
          ;; If this isn't inside a string...
          (throw 'found t))))))

(defun ruby-hash-syntax--replace (from to end)
  "Replace FROM with TO up to END."
  (while (re-search-forward from end t)
    (replace-match to nil nil)))


(provide 'ruby-hash-syntax)
;;; ruby-hash-syntax.el ends here
