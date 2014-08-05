(load "desktop")

(global-set-key (kbd "<f8>") 'compile-current-project)
(global-set-key (kbd "S-<f8>")
		(lambda ()
		  (interactive)
		  (let ((temp compilation-read-command))
		    (setq compilation-read-command t)
		    (call-interactively 'compile)
		    (setq compilation-read-command temp))))
(setq auto-mode-alist
      (append
       '(
         ("\\.wiki\\'" . textile-mode)) auto-mode-alist))
