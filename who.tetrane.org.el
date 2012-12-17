(load-theme 'deeper-blue)

(setq-default indent-tabs-mode nil)
 '(org-agenda-files (quote ("/home/gclement/src/tetrane/org/todo.org")))

(setq ecb-compile-window-height 6)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|pyc\\|pyo\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
(setq ecb-source-path (quote ("/home/gclement/src/tetrane")))
(setq ecb-tip-of-the-day nil)
(setq ecb-tree-buffer-style (quote image))
(setq ecb-windows-height 30)
(setq ecb-windows-width 30)


(setq compile-command "make -k -j20 -C /tmp/builds/reven/debug")

(semantic-mode)

(setq org-todo-keyword-faces
           '(
             ("INPROGRESS" . (:foreground "gold" :weight bold))
             ("IMPLEMENTED" . (:foreground "forest green" :weight bold))
             ("REJECTED" . (:foreground "royal blue" :weight bold))
            )
)

(progn
  (interactive)
  (cd "/home/gclement/src/tetrane/reven"))

(ecb-activate)

(select-frame (make-frame '((name . "emacs_right"))))

(select-window (split-window-right -15))
(progn
  (interactive)
  (find-file "/home/gclement/src/tetrane/org/todo.org")
)

(select-window (split-window-below -15))
(progn
  (interactive)
  (find-file "/home/gclement/org/todo.org")
)

(other-frame 1)

(load "mingus")

(desktop-save-mode 1)
