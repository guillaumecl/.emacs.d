(global-ede-mode 'nil)                  ; do NOT use project manager

(require 'semantic)

;(semantic-add-system-include "~/3rd-party/boost-1.43.0/include/" 'c++-mode)
;(semantic-add-system-include "~/3rd-party/protobuf-2.3.0/include" 'c++-mode)

;(require 'semanticdb)
(global-semanticdb-minor-mode 1)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; gnu global support
;(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(global-semantic-idle-summary-mode 1)



; use semantic for auto-complete

(setq qt4-base-dir "/usr/include/qt4")
(semantic-add-system-include qt4-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))

(semantic-add-system-include "~/src/tetrane/reven/" 'c++-mode)

(defun ac-semantic-construct-candidates (tags)
  "Construct candidates from the list inside of tags."
  (apply 'append
		 (mapcar (lambda (tag)
				   (if (listp tag)
					   (let ((type (semantic-tag-type tag))
							 (class (semantic-tag-class tag))
							 (name (semantic-tag-name tag)))
						 (if (or (and (stringp type)
									  (string= type "class"))
								 (eq class 'function)
								 (eq class 'variable))
							 (list (list name type class))))))
				 tags)))


(defvar ac-source-semantic-analysis nil)
(setq ac-source-semantic
	  `((sigil . "b")
		(init . (lambda () (setq ac-source-semantic-analysis
								 (condition-case nil
									 (ac-semantic-construct-candidates (semantic-fetch-tags))))))
		(candidates . (lambda ()
						(if ac-source-semantic-analysis
							(all-completions ac-target (mapcar 'car ac-source-semantic-analysis)))))))


(defun c++-semantic-hooks ()
; (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (auto-complete-mode)
)

(defun python-semantic-hooks ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  (auto-complete-mode)
)


(add-hook 'c++-mode-hook 'c++-semantic-hooks)
(add-hook 'python-mode-hook 'python-semantic-hooks)

(semantic-mode 1)
