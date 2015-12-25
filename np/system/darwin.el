;; Fix S-<up> in xterm.  Why:
;; http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))

(setq mac-command-key-is-meta t
      mac-command-modifier 'control
      mac-control-modifier 'meta
      mac-option-modifier 'hyper
      mac-function-modifier 'super)

(setq mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-control-modifier 'control
      mac-option-modifier 'hyper
      mac-function-modifier 'super)





(setq exec-path (list
                 "/Users/shannah3/.rbenv/shims/"
                 "/Users/shannah3/.rbenv/bin/"
                 "/usr/bin/"
                 "/bin/"
                 "/usr/sbin/"
                 "/sbin/"
                 "/usr/local/bin/"
                 "/usr/local/Cellar/emacs/24.3/libexec/emacs/24.3/x86_64-apple-darwin13.1.0/")
      )


(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))
