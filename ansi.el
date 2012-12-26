
(require 'tty-format)
(add-hook (quote find-file-hooks) (quote tty-format-guess))

(define-derived-mode fundamental-ansi-mode fundamental-mode "fundamental ansi"
  "Fundamental mode that understands ANSI colors."
  (require (quote tty-format))
  (format-decode-buffer (quote backspace-overstrike))
  (format-decode-buffer (quote ansi-colors))
  )
