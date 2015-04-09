(defun my-qt-assistant ()
  "Assess documentation in an instance of Assistant."
  (interactive)
  (let* ((procname "qt-assistant")
         (search (symbol-at-point)))
    (if (not (process-status procname))
	(start-process
	 procname procname
	 "/home/tortuxm/projets/qt/bin/assistant"
	 "-stylesheet=/home/gclement/assistant.css"
	 "-stylesheet=/home/tortuxm/assistant.css"
	 "-enableremotecontrol"))
    (process-send-string procname
                         (format "activatekeyword %s;\n" search))))

(global-set-key (kbd "<f1>") 'my-qt-assistant)

(defun qt-c-hooks ()
  (local-set-key (kbd "<f1>") 'my-qt-assistant))

(add-hook 'c-mode-common-hook 'qt-c-hooks)
