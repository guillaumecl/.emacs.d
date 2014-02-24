

(add-to-list 'auto-mode-alist '(".*mutt.*" . message-mode))
(setq mail-header-separator "")
(add-hook 'message-mode-hook
          'turn-on-auto-fill
          (function
           (lambda ()
             (progn
               (local-unset-key "\C-c\C-c")
               (define-key message-mode-map "\C-c\C-c" '(lambda ()
                                                          "save and exit quickly"
                                                          (interactive)
                                                          (save-buffer)
                                                          (server-edit)))))))
(defvar mail-mode-string
  ""
  "Current value of the mail mode string in the modeline.")

(define-minor-mode display-mail-mode
  "Shows the number of unread messages."
  :global t

  (setq mail-mode-string "")
  (or global-mode-string (setq global-mode-string '("")))
  (add-to-list 'global-mode-string 'mail-mode-string t)
)

(defun show_mail_count(count)
  (if (= count 0)
	  (setq mail-mode-string "")
	(progn
	  (setq mail-mode-string (format " %d✉" count))
	  (message (format "Incoming mails. Currently %d are unread." count))
	  )
	)
)

(display-mail-mode 1)
