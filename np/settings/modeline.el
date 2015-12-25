(column-number-mode 1)

(setq display-time-day-and-date nil

      display-time-24hr-format  nil)

(eval-after-load 'diminish
  '(lambda ()
     (diminish 'paredit-mode "")
     (diminish 'undo-tree-mode "")
     (diminish 'git-gutter-mode "")

     ))





