
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require (quote uniquify))
(setq uniquify-buffer-name-style (quote post-forward))

(global-set-key (kbd "<down-mouse-20>") 'buffer-menu)

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


(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))


(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(defun move-line-region-up (start end n)
  (interactive "r\np")
  (if (region-active-p) (move-region-up start end n) (move-line-up)))

(defun move-line-region-down (start end n)
  (interactive "r\np")
  (if (region-active-p) (move-region-down start end n) (move-line-down)))

(global-set-key (kbd "M-<up>") 'move-line-region-up)
(global-set-key (kbd "M-<down>") 'move-line-region-down)



(define-minor-mode sticky-buffer-mode
  "Make the current window always display this buffer."
  nil " sticky" nil
  (set-window-dedicated-p (selected-window) sticky-buffer-mode))

(delete-selection-mode)

(defun running-as-server ()
    "Returns true if `server-start' has been called."
  (condition-case nil
      (and (boundp 'server-process)
           (memq (process-status server-process)
                 '(connect listen open run)))
    (error)))

(global-set-key (kbd "C-<prior>") 'shrink-window)
(global-set-key (kbd "C-<next>") 'enlarge-window)

(global-set-key (kbd "ESC C-<prior>") 'shrink-window-horizontally)
(global-set-key (kbd "ESC C-<next>") 'enlarge-window-horizontally)
