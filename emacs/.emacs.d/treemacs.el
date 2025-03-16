;;Treemacs config
(unless (package-installed-p 'treemacs) (package-install 'treemacs))
(require 'treemacs)
(add-hook 'emacs-startup-hook 'treemacs)

(add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode 0))) ;;keine line numbers für treemacs

;; Workspaces
(treemacs-do-create-workspace "dotfiles")
(treemacs-do-add-project-to-workspace "~/dotfiles" "dotfiles")

(treemacs-do-create-workspace "notes")
(treemacs-do-add-project-to-workspace "~/Documents/study" "study")
