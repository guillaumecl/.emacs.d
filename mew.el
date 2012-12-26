
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

(setq mew-name "CLÉMENT Guillaume") ;; (user-full-name)
(setq mew-user "gclement") ;; (user-login-name)
(setq mew-mail-domain "baobob.org")

(setq mew-smtp-server "mail.gandi.net")  ;; if not localhost
(setq mew-smtp-user "tortuxm@baobob.org")  ;; if not localhost

(setq mew-proto "%")
(setq mew-imap-user "tortuxm@baobob.org")  ;; (user-login-name)
(setq mew-imap-server "mail.gandi.net")    ;; if not localhost
(setq mew-imap-header-only t)
(setq mew-use-biff t)
(setq mew-use-biff-interval 1)

(setq mew-use-cached-passwd t)
