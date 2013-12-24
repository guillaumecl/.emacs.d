;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'"  "My C / C++ header")
  '(nil
	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
		   (nopath (file-name-nondirectory noext))
		   (ident (concat (upcase nopath) "_H")))
	  (concat "#ifndef TETRANE_REVEN_" ident "\n"
			  "#define TETRANE_REVEN_" ident  "\n\n\n"
			  "namespace tetrane {\n"
			  "namespace module {\n"
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
			  "}} // namespace tetrane::module\n"
			  "\n\n#endif // TETRANE_REVEN_" ident "\n"))
  ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "My C++ implementation")
  '(nil
	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
		   (nopath (file-name-nondirectory noext))
		   (ident (concat nopath ".h")))
	  (concat "#include \"" ident "\"\n"
			  "\n\n\n"
			  "namespace tetrane {\n"
			  "namespace module {\n"
			  "\n\n\n"
			  nopath "::" nopath "()\n"
			  "{\n"
			  "}\n"
			  "\n\n\n"
			  "}} // namespace tetrane::module\n"
			  ))
	))


(auto-insert-mode)
