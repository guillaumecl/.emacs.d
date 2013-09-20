(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/machines/")
(add-to-list 'load-path "~/.emacs.d/libs/")

(if (>= emacs-major-version 24)
	(progn
	  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

      (if (not (string-equal system-name "odin.baobob.org"))
	  (load-theme 'zenburn t)

        )
      (require 'package)
      (add-to-list 'package-archives
                   '("melpa" . "http://melpa.milkbox.net/packages/") t)
	  (package-initialize)
	  )
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((awk-mode . "awk") (other . "linux"))))
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
 '(menu-bar-mode nil)
 '(python-guess-indent nil)
 '(scroll-bar-mode nil)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(standard-indent 8)
 '(tab-width 4)
 '(tool-bar-mode nil))

(if (>= emacs-major-version 24)
    (progn

      (require 'server)
      (if (not (server-running-p))
          (server-start)
        )

      (load "backups")
      (load "general")
      (load "programming")
      (load "reload")
      (load "ansi")
      (load "orgmode")
      (load "git")
      (load "mail")

      (require 'auto-recomp)
      (require 'tramp)

      (autoload 'color-theme-approximate-on "color-theme-approximate")
      (color-theme-approximate-on)
      )

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 122 :width normal)))))
  )

(load (system-name))
(put 'erase-buffer 'disabled nil)
