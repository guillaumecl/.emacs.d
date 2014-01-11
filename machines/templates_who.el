(defun find-module(path)
  (if
      (string-match "reven/\\([a-z]*\\)/" path)
      (match-string 1 path)
    "module")
  )

;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'"  "Reven C++ header")
  '(nil
	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
		   (nopath (file-name-nondirectory noext))
		   (ident (concat (upcase nopath) "_H"))
           (module (find-module buffer-file-name))
           (id_module (upcase module))
           )
	  (concat "#ifndef TETRANE_REVEN_" id_module "_" ident "\n"
			  "#define TETRANE_REVEN_" id_module "_" ident  "\n\n\n"
			  "namespace reven {\n"
			  "namespace " module " {\n"
			  "\n\n"
			  "//! Documentation for the new class.\n"
			  "class " nopath "\n"
			  "{\n"
			  "public:\n"
			  "    " nopath "();\n"
			  "\n"
			  "private:\n"
			  "}; // class " nopath
			  "\n\n"
			  "}} // namespace reven::" module "\n"
			  "\n\n#endif // TETRANE_REVEN_" id_module "_" ident "\n"))
  ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "Reven C++ class")
  '(nil
	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
		   (nopath (file-name-nondirectory noext))
		   (ident (concat nopath ".h"))
           (module (find-module buffer-file-name))
           (id_module (upcase module)))
    (concat "#include \"" ident "\"\n"
            "\n\n\n"
            "namespace reven {\n"
            "namespace " module " {\n"
            "\n\n\n"
            nopath "::" nopath "()\n"
            "{\n"
            "}\n"
            "\n\n\n"
            "}} // namespace reven::" module "\n"
            ))
  ))


(auto-insert-mode)
