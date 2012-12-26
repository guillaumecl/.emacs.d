
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require (quote uniquify))
(setq uniquify-buffer-name-style (quote post-forward))

(global-set-key (kbd "C-<tab>") 'other-frame)
(global-set-key (kbd "<backtab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>") 'other-window)


(global-set-key (kbd "<f12>") 'quit-window)

(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)


(global-set-key (kbd "M-S-<up>") 'scroll-down-line)
(global-set-key (kbd "M-S-<down>") 'scroll-up-line)


(global-set-key (kbd "C-<left>") 'subword-backward)
(global-set-key (kbd "C-<right>") 'subword-forward)

(global-set-key (kbd "<f6>") 'mingus)

(fset 'yes-or-no-p 'y-or-n-p)


(global-set-key "\C-xab" '(lambda ()(interactive)(ansi-term "/bin/bash")))
(global-set-key "\C-xap" 'python-shell)
(global-set-key "\C-xar" 'rename-buffer)

(global-subword-mode)

(setq kill-whole-line t);; will make "Ctrl-k" kills an entire line if the cursor is at the beginning of line -- very useful.
