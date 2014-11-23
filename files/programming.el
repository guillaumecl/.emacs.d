(require 'cmake-mode)


; Remove trailing whitespaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f18>") 'compile)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "S-<f4>") 'previous-error)

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

  (local-set-key (kbd "<f8>") 'recompile)
  (local-set-key (kbd "S-<f8>") 'compile)

  (ggtags-mode t)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (eldoc-mode t)
)

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))


(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/linux")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))


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


(load "qt")

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
	    (match-string 1 (buffer-file-name))))))

(defun find-project-src-dir (project)
  (expand-file-name project "~/projets"))

(defun find-project-build-dir (project)
  (when project
    (let ((build-dir (expand-file-name project "~/projets/build"))
	  (src-dir (find-project-src-dir project)))
      (if (file-exists-p build-dir)
	  build-dir
	src-dir))))

(defun compile-current-project ()
  "Finds the current project source and build directories.
Calls recompile with directories set appropriately."
  (interactive)
  (let ((project (find-project-name)))
    (when project
      (let ((project-dir (find-project-build-dir project))
	    (project-src (find-project-src-dir project)))
	(message project-src)
	(message project-dir)
	(if project-dir
	    (progn
	      (setq compilation-read-command nil)
	      (setq compilation-directory project-src)
	      (setq compile-command
		    (concat "make -k -j2 -C " project-dir))
	      (recompile)
	      (setq compilation-read-command t))
	  (progn
	    (setq compilation-read-command t)
	    (call-interactively 'compile)))))))




(defun css-hooks ()
  (setq css-indent-offset 8)
)

(add-hook 'css-mode-hook 'css-hooks)

(defun html-hooks ()
  (setq sgml-basic-offset 8)
)

(add-hook 'html-mode-hook 'html-hooks)
