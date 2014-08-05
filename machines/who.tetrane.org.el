(load "desktop")

;(load-theme 'alect-dark t)

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


(defun compile-vbox ()
  (interactive)
  (let ((old-compilation-string compile-command))
    (setq compile-command "~/src/tetrane/compile_vbox.sh")

    (setq compilation-buffer-name-function
          (lambda (major)
            "Undocumented"
            "*compilation* - VirtualBox"))

    (recompile)
    (setq compile-command old-compilation-string)
    (setq compilation-buffer-name-function nil)))

(defun reven-hooks ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (local-set-key (kbd "<f6>") 'compile-vbox)
  (local-set-key (kbd "<f8>") 'recompile)
  (local-set-key (kbd "S-<f8>") 'compile)
  (local-set-key (kbd "<f18>") 'compile)
)

(global-set-key (kbd "<f6>") 'compile-vbox)
(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f18>") 'compile)


(add-hook 'c-mode-common-hook 'reven-hooks)

(add-hook 'python-mode-hook 'reven-hooks)

(load "templates_who")

(require 'yasnippet)
(yas-global-mode 1)

(global-unset-key (kbd "C-z"))

(add-to-list 'auto-mode-alist '("hg-editor-*" . diff-mode))


(setq standard-indent 4)
(setq tab-width 4)
