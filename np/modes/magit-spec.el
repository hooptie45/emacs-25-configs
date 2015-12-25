;;; magit-stash.el --- stash support for Magit  -*- lexical-binding: t -*-

;; Copyright (C) 2008-2015  The Magit Project Contributors
;;
;; You should have received a copy of the AUTHORS.md file which
;; lists all contributors.  If not, see http://magit.vc/authors.

;; Author: Jonas Bernoulli <jonas@bernoul.li>
;; Maintainer: Jonas Bernoulli <jonas@bernoul.li>

;; Magit is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; Magit is distributed in the hope that it will be useful, but WITHOUT


;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
;; License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with Magit.  If not, see http://www.gnu.org/licenses.

;;; Commentary:

;; Support for Git stashes.

;;; Code:

(require 'magit)
(require 'json)


(require 'dash-functional)

(alist-get 'n (json-read-from-string "{\"a\":1, \"n\":332}"))
(defun np-relative-gem-file-name (it)
  (save-match-data
    (if (string-match ".*\\/vendor\\/.*\\/gems\\/\\(.*?\\)$" it)
        (match-string-no-properties 1 it)
      it)))

(defun np-clean-gem-file-name (it)
  (save-match-data
    (when (string-match "\\(.*?\\):\\(.*?\\):in `\\(.*?\\)'$" it)
      (let* ((f (match-string-no-properties 1 it))
             (l (match-string-no-properties 2 it))
             (m (match-string-no-properties 3 it)))
        `((file . ,f)
          (relative . ,(np-relative-gem-file-name f))
          (line . ,(- (string-to-int l) 1))
          (method . ,m))))))

(defun np-jump-to-source (file line-num)
  (progn
    (find-file file)
    (forward-line line-num)
    (xref-push-marker-stack)))
(let* ((msg "[0m[34m@@ -1,3 +1,2 @@"))
  (s-replace-all `(( . "")
                  ("0m" . "")
                  ("34m" . "")) msg)
  msg)


(defun np-row (desc error-class msg)
  (s-concat
   "\n"
   (s-concat (s-pad-right 20  " " desc) (s-pad-left 80  " " error-class))
   "\n"
   "\n"
   (s-concat (s-pad-right 62  " " (s-join "\n" (--map (s-prepend "  " it) (s-lines (s-word-wrap 50 msg))))))
   "\n"
   "\n"))


(defvar helm-source-spec-examples
  (helm-build-sync-source "Complex Command History"
    :init (lambda ()
            (xref-push-marker-stack))
    :real-to-display (lambda  (ee)
                       (let ((desc (alist-get 'description ee))
                             (full (alist-get 'full ee))
                             (error-class (alist-get 'error-class ee))
                             (msg (alist-get 'message ee)))
                         (progn
                           (message "%s" msg))
                         (np-row  desc error-class msg)))
    :candidates (lambda ()
                  (np-specs-load))
    :multiline t
    :action-transformer (lambda (actions ee)
                          (-concat actions
                                   (-reject (lambda (it)
                                              (s-match "GEM" (first it)))
                                            (--map
                                             (progn
                                               (let* (
                                                      (loc (np-clean-gem-file-name it))
                                                      (f (alist-get 'file loc))
                                                      (r (alist-get 'relative loc))
                                                      (l (alist-get 'line loc))
                                                      (v (or (and (string-match-p "vendor" f) "GEM")
                                                             "APP"))
                                                      (m (alist-get 'method loc)))
                                                 `(,(format "[%s] %s:%s:in `%s'" v r l m) .
                                                   (lambda (file)
                                                     (np-jump-to-source ,f ,l)))))
                                             (alist-get 'backtrace ee)))))


    :action (helm-make-actions
             "Eval" (lambda (candidate)
                      (message "%s" candidate))
             "Edit and eval" (lambda (candidate)
                               (edit-and-eval-command "Eval: " (read candidate))))
    :persistent-action (lambda (candidate)
                         (message "%s" candidate))))

(defun helm-spec-results ()
  "Preconfigured helm for complex command history."
  (interactive)
  (helm :sources 'helm-source-spec-examples
        :buffer "*helm spec results*"))

(defun np-read-spec-examples (file)
  (--filter
   (not (string= "passed" (alist-get 'status it)))
   (-map 'identity (alist-get 'examples (json-read-file (f-expand file))))))


(defun np-specs-load ()
  (let* ((buf (get-buffer-create "test-magit-rspec-output"))
         (e (np-read-spec-examples "~/Projects/search_query/spec.json")))
    (progn
      (--map
       `(list (path        . ,(alist-get 'file_path it))
              (line        . ,(alist-get 'line_number it))
              (backtrace        . ,(alist-get 'backtrace (alist-get 'exception it)))
              (full . ,(alist-get 'full_description it))
              (exception . ,(alist-get 'exception it))
              (error-class . ,(alist-get 'class (alist-get 'exception it)))
              (message . ,(alist-get 'message (alist-get 'exception it)))
              (description . ,(alist-get 'description it)))
       e))))


(helm :source (helm-source-sync "SSSS"
                                :candidates (lambda ()
                                              (list "a")
                                             ))
      )

(helm-configuration
 )
              (location . (format "%s:%s" ,path ,line))


(progn
  (defun magit-spec-setup ()
    (let* ((buf (get-buffer-create "test-magit-rspec"))
           )
      (progn
        (switch-to-buffer buf)
        (magit-with-toplevel
          (--each '(1 2 3)
            (magit-insert-section section  (spec "RSPEC" nil)
              (magit-insert-heading (format "SPEC-%s\n\n-------------------\n" it))
              (magit-insert-heading)
              (magit-insert-section section  (spec " RSPEC 1" t)
                (magit-insert-heading (format "+ SPEC"))
                (newline)
                (newline)
                (newline)
                (newline)
                (setf (magit-section-end section) (point))
                (magit-insert-section section  (spec " RSPEC 1" t)
                  (magit-insert-heading (format " + SPEC-%s\n\n-----------------\n" it))))))

          ))
      ))

  (defvar magit-spec-mode-map
    (let ((map (make-sparse-keymap)))
      (set-keymap-parent map magit-log-mode-map)
      map)
    "Keymap for `magit-spec-mode'.")

  (define-derived-mode magit-spec-mode magit-log-mode "Magit Spec"
    "Mode for looking at Spec Results."
    :group 'magit-log
    (magit-spec-setup))



;;; magit-stash.el ends soon
  (provide 'magit-spec))
;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; magit-stash.el ends here
