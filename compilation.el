
(defun compilation-visible ()
  "Return t if some compilation buffer is inside a window"
  (let ((compilation-buffer (get-buffer-create "*compilation*")))
    (get-buffer-window compilation-buffer)))

(defun open-compilation ()
  "Open the compilation buffer.
If there is no compilation buffer available, create one.
If there is already a window showing the compilation buffer, don't do anything.
If there is no window showing the compilation buffer, show one by splitting the current frame root window vertically."
  (interactive)
  (when (not (compilation-visible))
    (let ((compilation-buffer (get-buffer-create "*compilation*"))
          (compile-win  (split-window (frame-root-window) -10)))
      (setq compilation-window-height 10)
      (set-window-buffer
       compile-win
       compilation-buffer)
      (set-window-dedicated-p compile-win t))))

(defun close-compilation ()
  "Delete all windows that shows the compilation buffer in the current frame."
  (interactive)
  (while (compilation-visible)
    (let ((compilation-buffer (get-buffer-create "*compilation*")))
      (delete-window (get-buffer-window compilation-buffer)))))

(defun toggle-compilation ()
  "Shows the compilation window if no window is displaying the compilation buffer, otherwise close them."
  (interactive)
  (if (compilation-visible)
      (close-compilation)
      (open-compilation)))

(defadvice recompile (before setup-recompilation-buffer (&optional edit-command))
  (when (not (compilation-visible))
    (open-compilation)))

(ad-activate 'recompile)

(defadvice compile (before setup-recompilation-buffer (command &optional comint))
  (when (not (compilation-visible))
    (open-compilation)))

(ad-activate 'compile)

(global-set-key (kbd "<f7>") 'toggle-compilation)
