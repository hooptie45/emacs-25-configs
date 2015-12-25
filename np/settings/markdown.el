;; restrict spelling
(setq np-spelling-skipped-markdown-faces
      '(markdown-pre-face markdown-reference-face markdown-url-face))

(defun np/markdown-mode-flyspell-verify ()
  "An override used to shut Flyspell of in some parts of Markdown."
  (let ((face (get-text-property (point) 'face)))
    (not (memq face np-spelling-skipped-markdown-faces))))
