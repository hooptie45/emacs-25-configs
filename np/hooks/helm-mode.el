
(require 'helm-config)
(require 'helm-aliases)
(require 'helm-swoop)
(require 'helm-adaptive)
(global-set-key (kbd "C-l") 'helm-swoop)
(helm-adaptive-mode +1)
