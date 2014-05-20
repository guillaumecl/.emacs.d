(load "programming")
(load "compilation")
(load "ansi")
(load "git")
(load "mail")
(load "console")



(setq-default mode-line-format
      (list
       ""
       'mode-line-buffer-identification
       "   "
       'mode-line-position
       '(vc-mode vc-mode)
       "  "
       'mode-line-modes
       'mode-line-misc-info
       'mode-line-end-spaces))
