
;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?│))

(global-set-key (kbd "<clearline>") 'end-of-buffer)


(defun my-terminal-config (&optional frame)
  "Establish settings for the current terminal."
  (unless (display-graphic-p frame)
    ;; enable mouse reporting for terminal emulators
    (xterm-mouse-mode 1)
    (set-variable 'frame-background-mode 'dark)
    (frame-set-background-mode frame)
    (set-variable 'frame-background-mode nil)))

(add-hook 'after-make-frame-functions 'my-terminal-config)
