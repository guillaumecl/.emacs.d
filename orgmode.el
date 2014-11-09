

(setq org-agenda-files (list "~/org"))
(setq org-default-notes-file "~/org")

(setq org-log-done 'time)
(setq org-modules (quote (org-docview org-info org-mhe org-rmail org-vm org-wl org-mouse)))
(setq org-startup-indented t)

(add-hook 'org-mode-hook
          'visual-line-mode)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-export-html-postamble nil)

(setq org-todo-keyword-faces
           '(
             ("PLANNED" . (:foreground "forest green" :weight bold))
             ("STARTED" . (:foreground "gold" :weight bold))
             ("CANCELLED" . (:foreground "royal blue" :weight bold))
            )
)


(defun org-save-hook()
  "Org mode save hook"
  (let ((script-dir (concat
                    (file-name-directory (buffer-file-name))
                    "commit.sh"
                    )
                   ))
    (if (file-executable-p script-dir)
        (start-process "commit" nil script-dir)
      )
    )
  )


(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'after-save-hook 'org-save-hook nil t)))
(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'find-file-hook 'org-save-hook nil t)))


(setq org-publish-project-alist
      '(
	("baobob.org-posts"
	 :base-directory "~/blog"
	 :base-extension "org"
	 :exclude "menu.org"
	 :publishing-directory "~/public_html"
	 :publishing-function org-publish-org-to-html
	 :html-preamble "<div id='menu'>
		<ul>
			<li><a href='index.html'>Home</a>
		</ul>
		</div>"
	 :html-postamble ""
	 :recursive t
	 :author nil
	 :section-numbers nil
	 :table-of-contents t
	 :language "fr"
	 :style "<link rel=\"stylesheet\"
                     href=\"resources/baobob.css\"
                     type=\"text/css\"/>")
	("baobob.org-static"
	 :base-directory "~/blog/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("baobob.org"
	 :components ("baobob.org-posts" "baobob.org-static"))))
