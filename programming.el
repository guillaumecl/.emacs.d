(require 'cmake-mode)

; Show whitespaces at the end of lines.
; (setq-default show-trailing-whitespace t)
; Remove trailing whitespaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default display-buffer-reuse-frames t)

; Scroll buffer as output appears.
(setq compilation-scroll-output t)


; http://www.gnu.org/software/emacs/manual/html_node/elisp/Auto-Major-Mode.html
; http://stackoverflow.com/questions/3494402/setting-auto-mode-alist-in-emacs

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

(defun c++-specific-hooks ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)
  (setq show-trailing-whitespace t)
  (hide-ifdef-mode)
)


(add-hook 'c++-mode-hook 'c++-specific-hooks)

(setq stack-trace-on-error t)

(global-set-key (kbd "C-c h") 'ff-find-other-file)

(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "S-<f4>") 'previous-error)


;(setq c-hungry-delete-key t);; will delete "hungrily" in C mode! Use it to see what it does -- very useful.

;(setq c-auto-newline 1);; will let emacs put in a "carriage-return" for you automatically after left curly braces, right curly braces, and semi-colons in "C mode" -- very useful.
