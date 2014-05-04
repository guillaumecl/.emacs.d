(require 'cmake-mode)
(require 'project-explorer)


; Remove trailing whitespaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default display-buffer-reuse-frames t)

; Scroll buffer as output appears.
(setq compilation-scroll-output t)

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

(setq stack-trace-on-error t)

(global-set-key (kbd "C-c h") 'ff-find-other-file)

;(global-set-key (kbd "<f8>") 'recompile)
;(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f18>") 'compile)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "S-<f4>") 'previous-error)

(setq qt4-base-dir "/usr/include/qt4")
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))

(defun insert-infinf()
  (interactive)
  (insert "<<")
)

(defun insert-supsup()
  (interactive)
  (insert ">>")
)

(require 'ggtags)

(defun c-specific-hooks ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-cont-nonempty '+)
  (local-set-key (kbd "C-M-i") 'dabbrev-expand)
  (local-set-key (kbd "M-<tab>") 'dabbrev-expand)
  (setq show-trailing-whitespace t)

  (local-set-key (kbd "«") 'insert-infinf)
  (local-set-key (kbd "»") 'insert-supsup)
  (local-set-key (kbd "C-<up>") 'backward-sentence)
  (local-set-key (kbd "C-<down>") 'forward-sentence)
  (local-set-key (kbd "C-M-<up>") 'backward-paragraph)
  (local-set-key (kbd "C-M-<down>") 'forward-paragraph)
  (local-set-key (kbd "ESC C-<up>") 'backward-paragraph)
  (local-set-key (kbd "ESC C-<down>") 'forward-paragraph)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (ggtags-mode t)
)

(defun python-specific-hooks ()
  (setq show-trailing-whitespace t)
)


(add-hook 'c-mode-common-hook 'c-specific-hooks)

(add-hook 'python-mode-hook 'python-specific-hooks)

;; By an unknown contributor

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


(defun toggle-explorer()
  (interactive)
  (let ((b (get-buffer "*project-explorer*")
           ))
    (if b
        (kill-buffer b)
      (project-explorer-open)
      )
    )
  )

(defun un-camelcase-word-at-point ()
  "un-camelcase the word at point, replacing uppercase chars with
the lowercase version preceded by an underscore.

The first char, if capitalized (eg, PascalCase) is just
downcased, no preceding underscore.
"
  (interactive)
  (save-excursion
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (replace-regexp "\\([A-Z]\\)" "_\\1" nil
                      (1+ (car bounds)) (cdr bounds))
      (downcase-region (car bounds) (cdr bounds)))))


(global-set-key (kbd "M-à") 'un-camelcase-word-at-point)
(global-set-key (kbd "<f3>") 'toggle-explorer)


;(global-set-key (kbd "M-.") 'gtags-find-symbol)

(load "qt")

;(project-explorer-open)


(require 'nasm-mode)

(setq auto-mode-alist
      (append
       '(
         ("\\.asm\\'" . nasm-mode)
         ("\\.nasm\\'" . nasm-mode)
         ) auto-mode-alist))

(defun find-project-name ()
  (let ((file (buffer-file-name)))
    (when file
	(when
	    (string-match "projets/\\([a-zA-Z0-9_\\-]*\\)/" (buffer-file-name))
	    (match-string 1 (buffer-file-name)))
      )
    )
  )

(defun find-project-dir (project)
  (when project
    (let ((build-dir (expand-file-name project "~/projets/build"))
	  (src-dir (expand-file-name project "~/projets")))
      (if (file-exists-p build-dir)
	  build-dir
	src-dir))
    )
  )

(defun compile-current-project ()
  (interactive)
  (let ((project-dir (find-project-dir (find-project-name))))
    (message (concat "Project: " project-dir))
    (if project-dir
	(progn
	  (setq compilation-read-command nil)
	  (setq compile-command
		(concat "make -k -j2 -C " project-dir)
		)
	  (recompile)
	  )
      (progn
	(setq compilation-read-command t)
	(call-interactively 'compile)
	)
      )
    )
  )
