;;; lua-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads (lua-mode) "lua-mode" "lua-mode.el" (21052 13945
;;;;;;  978067 527000))
;;; Generated autoloads from lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;;***

;;;### (autoloads nil nil ("lua-mode-pkg.el") (21052 13945 983188
;;;;;;  290000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; lua-mode-autoloads.el ends here
