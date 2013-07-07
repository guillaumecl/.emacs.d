
(require 'doxymacs)


(add-hook 'c-mode-common-hook'doxymacs-mode)

(setq doxymacs-doxygen-dirs '(("^/home/tortuxm/projets/tmpc/" "/home/tortuxm/projets/tmpc/doc/tmpc.xml" "file:///home/tortuxm/projets/tmpc/doc/html/")))
