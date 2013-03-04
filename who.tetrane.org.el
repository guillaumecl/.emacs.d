(setq jabber-alert-info-message-hooks nil)
(setq jabber-alert-message-hooks nil)

(setq-default indent-tabs-mode nil)

(setq org-agenda-files (list "~/src/tetrane/org"))
(setq org-default-notes-file "~/src/tetrane/org")


(setq ecb-compile-window-height 6)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|pyc\\|pyo\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
(setq ecb-source-path (quote ("/home/gclement/src/tetrane")))
(setq ecb-tip-of-the-day nil)
(setq ecb-tree-buffer-style (quote image))
(setq ecb-windows-height 30)
(setq ecb-windows-width 30)


(setq compile-command "/home/gclement/src/tetrane/compile.sh")

(setq org-todo-keyword-faces
           '(
             ("INPROGRESS" . (:foreground "gold" :weight bold))
             ("IMPLEMENTED" . (:foreground "forest green" :weight bold))
             ("REJECTED" . (:foreground "royal blue" :weight bold))
            )
)

(progn
  (called-interactively-p)
  (cd "/home/gclement/src/tetrane/reven"))

(ecb-activate)

(select-frame (make-frame '((name . "emacs_right"))))

;(select-window (split-window-right -15))
;(progn
;  (called-interactively-p)
;  (find-file "/home/gclement/src/tetrane/org/tetrane.org")
;)

;(select-window (split-window-below -15))
;(progn
;  (called-interactively-p)
;  (find-file "/home/gclement/org/todo.org")
;)

;(other-window 1)

(other-frame 1)

(load "mingus")

(setq auto-mode-alist
      (append
       '(
         ("\\.psp\\'" . python-mode)
         ) auto-mode-alist))

(require 'fill-column-indicator)

(defun fci-hooks ()
  (setq fci-rule-column 120)
  (fci-mode 1)
)

(add-hook 'c++-mode-hook 'fci-hooks)


(load "semantic-config")

(desktop-save-mode 1)
