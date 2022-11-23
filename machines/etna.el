(load "desktop")

(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "<f18>") 'compile)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f9>") 'recompile)
(global-set-key (kbd "<f19>") 'compile)
(setq auto-mode-alist
      (append
       '(
         ("\\.wiki\\'" . textile-mode)) auto-mode-alist))
