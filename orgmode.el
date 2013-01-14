

(setq org-agenda-files (list "~/org"))
(setq org-default-notes-file "~/org")

(setq org-log-done 'time)
(setq org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mouse)))
(setq org-startup-indented t)

(add-hook 'org-mode-hook
          'visual-line-mode)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-export-html-postamble nil)



(defun org-save-hook()
  "Org mode save hook"
  (let ((script-dir (concat
                    (file-name-directory (buffer-file-name))
                    "commit.sh"
                    )
                   ))
    (if (file-executable-p script-dir)
        (shell-command script-dir)
	    (px-revert-buffer-no-confirm)
      )
    )
  )


(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'after-save-hook 'org-save-hook nil t)))
(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'find-file-hook 'org-save-hook nil t)))
