(add-to-list 'load-path "~/.emacs.d/files/")
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/machines/")
(add-to-list 'load-path "~/.emacs.d/libs/")

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

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
 '(fringe-mode 0 nil (fringe))
 '(hide-ifdef-initially t)
 '(indent-tabs-mode t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(js-indent-level 8)
 '(menu-bar-mode nil)
 '(python-guess-indent nil)
 '(scroll-bar-mode nil)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(sr-speedbar-right-side nil)
 '(standard-indent 8)
 '(tab-width 8)
 '(tool-bar-mode nil))

(load "backups")
(load "reload")
(load "general")
(load "orgmode")

(require 'auto-recomp)

(require 'server)

(if (not (server-running-p))
    (server-start)
  )


(load (system-name))
