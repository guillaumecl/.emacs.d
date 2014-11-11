
(require 'tty-format)
(add-hook (quote find-file-hooks) (quote tty-format-guess))

(define-derived-mode fundamental-ansi-mode fundamental-mode "fundamental ansi"
  "Fundamental mode that understands ANSI colors."
  (require 'tty-format)
  (format-decode-buffer 'backspace-overstrike)
  (format-decode-buffer 'ansi-colors))
