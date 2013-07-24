(require 'lua-mode)
(require 'cmake-mode)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/doxymacs/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m/")

(add-to-list 'load-path "~/.emacs.d/dpkg-dev-el/")


(setq jabber-alert-info-message-hooks nil)
(setq jabber-alert-message-hooks nil)

(setq-default indent-tabs-mode nil)

(setq org-agenda-files (list "~/src/tetrane/org"))
(setq org-default-notes-file "~/src/tetrane/org")

;; (set-frame-parameter (selected-frame) 'alpha '(80 80))
;; (add-to-list 'default-frame-alist '(alpha 80 80))


;; (setq ecb-compile-window-height 6)
;; (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; (setq ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|pyc\\|pyo\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
;; (setq ecb-source-path (quote ("/home/gclement/src/tetrane")))
;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-tree-buffer-style (quote image))
;; (setq ecb-windows-height 30)
;; (setq ecb-windows-width 30)


(setq compile-command "/home/gclement/src/tetrane/compile.sh")

(setq org-todo-keyword-faces
           '(
             ("INPROGRESS" . (:foreground "gold" :weight bold))
             ("IMPLEMENTED" . (:foreground "forest green" :weight bold))
             ("REJECTED" . (:foreground "royal blue" :weight bold))
            )
)

(progn
  (called-interactively-p noninteractive)
  (cd "/home/gclement/src/tetrane/reven"))

;; (ecb-activate)

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

;(other-frame 1)

(load "mingus")

(setq auto-mode-alist
      (append
       '(
         ("\\.psp\\'" . python-mode)
         ("\\CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)
         ) auto-mode-alist))

;; (require 'fill-column-indicator)

;; (defun fci-hooks ()
;;   (setq fci-rule-column 120)
;;   (fci-mode 1)
;; )

;; (add-hook 'c++-mode-hook 'fci-hooks)


;(load "semantic-config")

;(semantic-add-system-include "/home/gclement/src/tetrane/reven")

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)

(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(setq doxymacs-doxygen-dirs
    '(("^/home/gclement/src/tetrane/reven/"
       "/tmp/builds/reven/release/doc/reven.xml"
       "file:///tmp/builds/reven/release/doc/html/"))
)

(require 'dpkg-dev-el)

(setq auto-mode-alist
      (append
       '(
         ("\\.dsc\\'" . debian-control-mode)
         ) auto-mode-alist))

(require 'w3m)

(setq browse-url-browser-function 'ffap-w3m-other-window)


(defun ffap-w3m-other-window (url &optional new-session)
  "Browse url in w3m.
  If current frame has only one window, create a new window and browse the webpage"
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "Emacs-w3m URL: ")))
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url new-session)))

(setq w3m-use-cookies t)
(setq w3m-pop-up-windows t)

(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)
