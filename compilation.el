
(defun compilation-buffer()
  "The compilation buffer. Create one if necessary."
  (get-buffer-create "*compilation*"))

(defun compilation-window ()
  "If some compilation buffer is inside a window, return it, otherwise nil."
  (get-buffer-window (compilation-buffer)))

(defun open-compilation ()
  "Open the compilation buffer.
If there is no compilation buffer available, create one.
If there is already a window showing the compilation buffer, don't do anything.
If there is no window showing the compilation buffer, show one by splitting the current frame root window vertically."
  (interactive)
  (when (not (compilation-window))
    (let ((compile-buffer (compilation-buffer))
          (compile-win  (split-window (frame-root-window) -10)))
      (setq compilation-window-height 10)
      (set-window-buffer
       compile-win
       compile-buffer)
      (set-window-dedicated-p compile-win t))))

(defun close-compilation ()
  "Delete all windows that shows the compilation buffer in the current frame."
  (interactive)
  (let ((compile-window nil))
    (while (setq compile-window (compilation-window))
      (delete-window compile-window))))

(defun toggle-compilation ()
  "Shows the compilation window if no window is displaying the compilation buffer, otherwise close them."
  (interactive)
  (if (compilation-window)
      (close-compilation)
      (open-compilation)))

(defadvice recompile (before setup-recompilation-buffer (&optional edit-command))
  (when (not (compilation-window))
    (open-compilation)))

(ad-activate 'recompile)

(defadvice compile (before setup-recompilation-buffer (command &optional comint))
  (when (not (compilation-window))
    (open-compilation)))

(ad-activate 'compile)

(global-set-key (kbd "<f7>") 'toggle-compilation)
