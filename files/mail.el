

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

(setq gnus-select-method '(nnimap "baobob"
				  (nnimap-address "mail.gandi.net")   ; it could also be imap.googlemail.com if that's your server.
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))
