(defun my-qt-assistant ()
  "Assess documentation in an instance of Assistant."
  (interactive)
  (let* ((procname "qt-assistant")
         (search (symbol-at-point)))
    (if (not (process-status procname))
        (start-process
         procname procname
         "assistant"
         "-stylesheet=/home/gclement/assistant.css"
         "-enableremotecontrol"))
    (process-send-string procname
                         (format "activatekeyword %s;\n" search))

    ))

(global-set-key (kbd "<f9>") 'my-qt-assistant)
