
; Enable backup files.
(setq make-backup-files t)

; Enable numbered backup files.
(setq version-control t)

; Number of oldest backups to keep.
(setq kept-old-versions 12)

; Number of newest backups to keep.
(setq kept-new-versions 12)

; Delete excess backup files silently.
(setq delete-old-versions t)

; Creates backups in home.
(setq backup-directory-alist (quote (("." . "~/.backup_emacs.d"))))
