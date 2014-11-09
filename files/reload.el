
;; Check for external modifications
(defun px-check-external-modifications ()
  "Check if a buffer was modified outside emacs."
  (interactive)
  (if (and (buffer-modified-p) (not (verify-visited-file-modtime)))
      (setq header-line-format
            (format "\t%s Press F5 to reload." (propertize "File changed externally."
                                                           (quote face) (quote (:foreground "#f00")))))
    )
  )

(run-with-timer 0 1 (quote px-check-external-modifications))

(defun px-revert-buffer-no-confirm ()
  "Revert a buffer without confirmation."
  (interactive)
  (revert-buffer t t))

; http://emacswiki.org/emacs/RevertBuffer#toc1
(global-set-key (kbd "<f5>") (quote px-revert-buffer-no-confirm))

(global-auto-revert-mode)
