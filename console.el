
(xterm-mouse-mode)

;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?┃))

(global-set-key (kbd "<clearline>") 'end-of-buffer)
