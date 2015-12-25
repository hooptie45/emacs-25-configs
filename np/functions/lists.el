;;;###autoload
(defun np/flatten (x)
  "Flatten a list."
  (cond ((null x) nil)
        ((listp x) (append (np/flatten (car x)) (np/flatten (cdr x))))
        (t (list x))))
