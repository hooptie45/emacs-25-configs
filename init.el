(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'hyper)
(setq mac-function-modifier 'super)
(setq ring-bell-function 'ignore)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar np-wrap-limit 80)
(setq exec-path (cons "/opt/local/bin" exec-path))

;; NP's Emacs configuration

(defun np/load-init-file (path &optional noerror)
  "This loads a file from inside the the .emacs.d directory"
  (let ((file (file-name-sans-extension
               (expand-file-name path user-emacs-directory))))
    (progn
      (message "loading %s" file)
      (load file noerror))))

(defvar prelude-dir (expand-file-name "~/.emacs.d"))

(np/load-init-file "core/prelude-packages")
(prelude-require-packages '(dash))
(require 'dash)


(let ((packages '(s dash helm f helm-swoop bind-key company magit)))
  (-each (prelude-require-packages packages)  'require))

(bind-key "M-z" 'dired-jump)

;; load configuration settings by type
(np/load-init-file "core/prelude-core")
(np/load-init-file "core/prelude-mode")
(np/load-init-file "core/prelude-custom")
(np/load-init-file "core/prelude-osx")
(np/load-init-file "core/prelude-packages")

(np/load-init-file "np/init/freshen")
(np/load-init-file "np/init/system")
(np/load-init-file "np/init/autoloads")
(np/load-init-file "np/init/packages")
(np/load-init-file "np/init/compile")
(np/load-init-file "np/init/functions")
(np/load-init-file "np/init/commands")
(np/load-init-file "np/init/autohooks")
(np/load-init-file "np/init/settings")
(np/load-init-file "np/init/modes")

(-each (f-files
        (f-expand "~/.emacs.d/np/settings")
        'identity
         nil) 'np/load-init-file)
(np-work-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(coffee-tab-width 2)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-semantic company-clang company-xcode company-cmake company-capf
                  (company-dabbrev-code company-keywords)
                  company-oddmuse company-files company-dabbrev
                  (company-abbrev))))
 '(company-idle-delay 0.1)
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "c2351f39abfa0908b2b113ae5c94d3a39d307c66130e9073f32ee5696e664e70" "1247ac2a0069c227d15229613133d2adead08719c2a710d4d7242b3c96ca5f33" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "580eea86a6e6a5c867f40b9085c3fdf9c129c6b7f5f0def1987d32c1c2fe85ca" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" default)))
 '(dabbrev-abbrev-skip-leading-regexp ":")
 '(dabbrev-check-all-buffers nil)
 '(dired-omit-files
   "^\\.?#\\|^\\.$\\|^\\.\\.$\\|deleteme\\.txt\\|foo\\.xml\\|\\.DS_Store\\|\\.deployignore\\|\\.dir-locals\\.el\\|\\.git\\|\\.idea\\|\\.bundle\\|\\.prygit")
 '(enh-ruby-deep-indent-paren nil)
 '(evil-emacs-state-modes
   (quote
    (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-commit-mode magit-diff-mode magit-key-mode magit-log-mode magit-mode magit-reflog-mode magit-show-branches-mode magit-branch-manager-mode magit-stash-mode magit-status-mode magit-wazzup-mode magit-process-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode git-rebase-mode xhg-status-extra-mode git-commit-mode)))
 '(evil-shift-width 2)
 '(git-commit-finish-query-functions nil)
 '(git-commit-known-pseudo-headers
   (quote
    ("Signed-off-by" "Acked-by" "Cc" "Suggested-by" "Reported-by" "Tested-by" "Reviewed-by")))
 '(git-commit-mode-hook
   (quote
    (turn-on-auto-fill flyspell-mode git-commit-save-message)) t)
 '(git-commit-setup-hook
   (quote
    (magit-revert-buffers git-commit-save-message git-commit-setup-changelog-support git-commit-turn-on-auto-fill git-commit-turn-on-flyspell git-commit-propertize-diff with-editor-usage-message)))
 '(git-rebase-auto-advance t)
 '(git-rebase-remove-instructions t)
 '(global-company-mode t)
 '(global-git-gutter-mode t)
 '(global-magit-wip-save-mode nil)
 '(helm-M-x-always-save-history t)
 '(helm-M-x-reverse-history nil)
 '(helm-adaptive-history-length 500)
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-always-two-windows t)
 '(helm-apropos-fuzzy-match t)
 '(helm-bookmark-show-location t)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm--completing-read-default)
     (ffap-alternate-file)
     (tmm-menubar))))
 '(helm-ff-auto-update-initial-value t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-skip-boring-files t)
 '(helm-kill-ring-max-lines-number 1)
 '(helm-moccur-always-search-in-current t)
 '(helm-push-mark-mode nil)
 '(helm-quick-update t)
 '(helm-recentf-fuzzy-match t)
 '(helm-split-window-default-side (quote right))
 '(helm-swoop-split-with-multiple-windows t)
 '(helm-truncate-lines t t)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name)))
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(js-indent-level 2)
 '(kept-new-versions 20)
 '(kept-old-versions 20)
 '(magit-auto-revert-mode-lighter "")
 '(magit-completing-read-function (quote magit-ido-completing-read))
 '(magit-diff-arguments
   (quote
    ("--function-context" "--ignore-space-change" "--ignore-all-space")))
 '(magit-diff-highlight-trailing nil)
 '(magit-diff-refine-hunk nil)
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(magit-diff-show-diffstat nil)
 '(magit-log-arguments (quote ("--graph" "--color" "--follow")))
 '(magit-log-section-commit-count 100)
 '(magit-popup-show-common-commands nil)
 '(magit-restore-window-configuration t)
 '(magit-revert-backup nil)
 '(magit-save-repository-buffers (quote dontask))
 '(magit-save-some-buffers (quote dontask))
 '(magit-show-diffstat t)
 '(magit-status-headers-hook
   (quote
    (magit-insert-diff-filter-header magit-insert-repo-header magit-insert-head-header magit-insert-upstream-header magit-insert-tags-header)))
 '(magit-status-mode-hook (quote (delete-other-windows)))
 '(np-work-mode t)
 '(package-selected-packages
   (quote
    (evil dash-functional elisp-slime-nav paredit paradox inf-clojure cider clojure-mode dockerfile-mode slim-mode csv-mode js2-mode json-mode zop-to-char zenburn-theme yasnippet yaml-mode yagist workgroups window-number volatile-highlights vkill smartrep smartparens smart-mode-line scss-mode scratch-palette ruby-refactor ruby-end ruby-compilation projectile ov operate-on-number multiple-cursors move-text markdown-mode ido-completing-read+ helm-swoop helm-git-grep helm-git haml-mode guru-mode god-mode gitignore-mode gitconfig-mode git-timemachine git-gutter gist flymake-coffee flycheck flx-ido fiplr fill-column-indicator f expand-region exec-path-from-shell evil-paredit evil-leader evil-exchange elisp-slime-nav easy-kill discover-my-major dired-single dired-details diminish diff-hl cyberpunk-theme company color-theme-sanityinc-tomorrow coffee-mode browse-kill-ring bind-key auto-complete anzu ag ace-window)))
 '(projectile-create-missing-test-files t)
 '(projectile-enable-caching t)
 '(projectile-enable-idle-timer t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "build" "vendor" "bower_components")))
 '(projectile-idle-timer-hook nil)
 '(projectile-idle-timer-seconds 150)
 '(projectile-indexing-method (quote alien))
 '(projectile-use-git-grep t)
 '(rbenv-show-active-ruby-in-modeline nil)
 '(recentf-arrange-rules (quote (("Coffee" ".\\.coffee") ("Ruby" ".\\.rb\\'"))))
 '(recentf-exclude (quote ("vendor" "bower_components" ".el$" ".git")))
 '(recentf-filename-handlers (quote (abbreviate-file-name file-truename)))
 '(recentf-keep (quote (recentf-keep-default-predicate "coffee$" ".rb$")))
 '(recentf-max-saved-items 20)
 '(recentf-mode t)
 '(ruby-block-highlight-toggle nil)
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(show-paren-mode t)
 '(tags-add-tables t)
 '(tags-case-fold-search t)
 '(tags-revert-without-query t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff9da4")
     (40 . "#ffc58f")
     (60 . "#ffeead")
     (80 . "#d1f1a9")
     (100 . "#99ffff")
     (120 . "#bbdaff")
     (140 . "#ebbbff")
     (160 . "#ff9da4")
     (180 . "#ffc58f")
     (200 . "#ffeead")
     (220 . "#d1f1a9")
     (240 . "#99ffff")
     (260 . "#bbdaff")
     (280 . "#ebbbff")
     (300 . "#ff9da4")
     (320 . "#ffc58f")
     (340 . "#ffeead")
     (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(wg-morph-on nil)
 '(workgroups-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-directory ((t (:foreground "#7DEA2A" :weight normal :height 1.2))))
 '(highlight ((t (:background "DeepPink2" :inverse-video nil))))
 '(magit-diff-added ((t (:inherit diff-added))))
 '(magit-diff-added-highlight ((t (:inherit diff-added))))
 '(magit-diff-context-highlight ((t nil)))
 '(magit-hash ((t (:foreground "#C1F161"))))
 '(magit-section-highlight ((t (:inherit highlight)))))

