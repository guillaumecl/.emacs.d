(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

(add-hook 'diff-mode-hook
          (function
           (lambda ()
             (progn
               (local-set-key (kbd "M-DEL") 'backward-kill-word)
))))
