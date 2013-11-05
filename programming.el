(require 'cmake-mode)
(require 'auto-complete)
(require 'project-explorer)


; Remove trailing whitespaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default display-buffer-reuse-frames t)

; Scroll buffer as output appears.
(setq compilation-scroll-output t)

; \\' matches the empty string at the end of the string.

(setq auto-mode-alist
      (append
       '(
         ("\\.h\\'" . c++-mode)
         ("\\.hh\\'" . c++-mode)
         ("\\.hh\\'" . c++-mode)
         ("\\.hxx\\'" . c++-mode)
         ("\\.c\\'" . c++-mode)
         ("\\.cc\\'" . c++-mode)
         ("\\.cpp\\'" . c++-mode)
         ("\\.kmk\\'" . makefile-mode)
         ) auto-mode-alist))

(setq c-default-style "linux" c-basic-offset 4)

(setq stack-trace-on-error t)

(global-set-key (kbd "C-c h") 'ff-find-other-file)

(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "S-<f4>") 'previous-error)

(setq qt4-base-dir "/usr/include/qt4")
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))

(defun c++-specific-hooks ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)
  (setq show-trailing-whitespace t)
  (auto-complete-mode)
)

(defun python-specific-hooks ()
  (setq show-trailing-whitespace t)
  (auto-complete-mode)
)


(add-hook 'c++-mode-hook 'c++-specific-hooks)

(add-hook 'python-mode-hook 'python-specific-hooks)

;; By an unknown contributor

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


(add-to-list 'load-path (concat "" "AC"))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat "" "AC/ac-dict"))


(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)


(defun toggle-explorer()
  (interactive)
  (let ((b (get-buffer "*project-explorer*")
           ))
    (if b
        (kill-buffer b)
      (project-explorer-open)
      )
    )
  )

(global-set-key (kbd "<f3>") 'toggle-explorer)


(load "qt")

;(project-explorer-open)
