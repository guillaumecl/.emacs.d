
;; This could be made portable but I'm not interested in that at the
;; moment so it's git-only.

(defun vc-push-or-pull ()
  "`vc-push' if given an argument, otherwise `vc-pull'"
  (interactive)
  (if current-prefix-arg
      (vc-push)
    (vc-pull)))

(defun vc-push ()
  "Run git-push on the current repository, does a dry-run unless
    given a prefix arg."
  (interactive)
  (shell-command "git push"))

(defun vc-pull ()
  "Run git-pull on the current repository."
  (interactive)
  (shell-command "git pull"))

;; vc.el - add commands to push and pull with git
(progn
  (define-key vc-prefix-map "p" 'vc-push-or-pull))


(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

(add-hook 'diff-mode-hook
          (function
           (lambda ()
             (progn
               (local-set-key (kbd "M-DEL") 'backward-kill-word)
))))
