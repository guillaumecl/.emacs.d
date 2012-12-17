(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/mingus")

(require 'cmake-mode)

(setq stack-trace-on-error t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((awk-mode . "awk") (other . "linux"))) t)
 '(c-objc-method-arg-unfinished-offset 8)
 '(c-objc-method-parameter-offset 8)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(fringe-mode 0 nil (fringe))
 '(hide-ifdef-initially t)
 '(indent-tabs-mode t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(jabber-account-list (quote (("tortuxm@baobob.org"))))
 '(jabber-vcard-avatars-retrieve nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(standard-indent 8)
 '(tab-width 4)
 '(tool-bar-mode nil))

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

; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require (quote uniquify))
(setq uniquify-buffer-name-style (quote post-forward))

(global-set-key (kbd "C-c h") 'ff-find-other-file)
(global-set-key (kbd "C-<tab>") 'other-frame)
(global-set-key (kbd "<backtab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>") 'other-window)


(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "S-<f4>") 'previous-error)

(global-set-key (kbd "<f12>") 'quit-window)

(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)


(global-set-key (kbd "M-S-<up>") 'scroll-down-line)
(global-set-key (kbd "M-S-<down>") 'scroll-up-line)


(global-set-key (kbd "<f6>") 'mingus)


; Show whitespaces at the end of lines.
; (setq-default show-trailing-whitespace t)
; Remove trailing whitespaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default display-buffer-reuse-frames t)

; Scroll buffer as output appears.
(setq compilation-scroll-output t)

;; Check for external modifications
(defun px-check-external-modifications ()
  "Check if a buffer was modified outside emacs."
  (interactive)
  (if (not (verify-visited-file-modtime (current-buffer)))
      (setq header-line-format
            (format "\t%s Press F5 to reload." (propertize "File changed externally."
                                       (quote face) (quote (:foreground "#f00")))))))

(run-with-timer 0 1 (quote px-check-external-modifications))

(defun px-revert-buffer-no-confirm ()
  "Revert a buffer without confirmation."
  (interactive)
  (revert-buffer t t))

; http://emacswiki.org/emacs/RevertBuffer#toc1
(global-set-key (kbd "<f5>") (quote px-revert-buffer-no-confirm))

(if (and (buffer-modified-p) (file-exists-p (buffer-file-name))
         (setq backup-file (car (find-backup-file-name buffer-file-name))))
    (progn
      (setq header-line-format (format "Buffer modified."))
      (set-buffer (get-buffer-create (format "%s|original" (file-name-nondirectory buffer-file-name))))
      (insert-file-contents buffer-file-name)))


(require 'tty-format)
(add-hook (quote find-file-hooks) (quote tty-format-guess))

(define-derived-mode fundamental-ansi-mode fundamental-mode "fundamental ansi"
  "Fundamental mode that understands ANSI colors."
  (require (quote tty-format))
  (format-decode-buffer (quote backspace-overstrike))
  (format-decode-buffer (quote ansi-colors))
  )


(setq org-agenda-files (list "~/org"))
(setq org-default-notes-file "~/org")

(setq org-log-done 'time)
(setq org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mouse)))
(setq org-startup-indented t)

(add-hook 'org-mode-hook
          'visual-line-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-xab" '(lambda ()(interactive)(ansi-term "/bin/bash")))
(global-set-key "\C-xap" 'python-shell)
(global-set-key "\C-xar" 'rename-buffer)

(server-start)

(require 'tramp)

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

(global-subword-mode)



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
(fset 'yes-or-no-p 'y-or-n-p)

(setq kill-whole-line t);; will make "Ctrl-k" kills an entire line if the cursor is at the beginning of line -- very useful.

(setq c-hungry-delete-key t);; will delete "hungrily" in C mode! Use it to see what it does -- very useful.

(setq c-auto-newline 1);; will let emacs put in a "carriage-return" for you automatically after left curly braces, right curly braces, and semi-colons in "C mode" -- very useful.

(setq org-export-html-postamble nil)

(load (system-name))

(require 'auto-recomp)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 122 :width normal)))))
