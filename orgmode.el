

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
