(require 'lua-mode)
(require 'cmake-mode)

(add-to-list 'load-path "~/.emacs.d/dpkg-dev-el/")

(setq-default indent-tabs-mode nil)

(setq org-agenda-files (list "~/src/tetrane/org"))
(setq org-default-notes-file "~/src/tetrane/org")

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

(setq auto-mode-alist
      (append
       '(
         ("\\.psp\\'" . python-mode)
         ("\\CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)
         ) auto-mode-alist))

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)


(defun reven-hooks ()
  (setq indent-tabs-mode nil)
)


(add-hook 'c++-mode-hook 'reven-hooks)

(add-hook 'python-mode-hook 'reven-hooks)
