;;; -*- lexical-binding: t; -*-
;;lexical binding wird gebraucht für den hack da unten DO NOT REMOVE

;;Treemacs config
(unless (package-installed-p 'treemacs) (package-install 'treemacs))
(require 'treemacs)

;(add-hook 'emacs-startup-hook 'treemacs)
(add-hook 'server-after-make-frame-hook #'treemacs)


;;Ist n Hack, den ich von github kopiert hab DO NOT REMOVE
;(add-hook 'after-make-frame-functions
;          (lambda (frame)
;            (run-with-timer
;             0 nil
;             (lambda ()
;               (with-selected-frame frame
;                 (save-selected-window
;                   (treemacs-select-window)))))))

(add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode 0))) ;;keine line numbers für treemacs

;; Workspaces
(treemacs-do-create-workspace "dotfiles")
(treemacs-do-add-project-to-workspace "~/dotfiles" "dotfiles")
(treemacs-do-add-project-to-workspace "~/Documents/study" "study")

(treemacs-do-create-workspace "projects")
(treemacs-do-add-project-to-workspace "~/projects/tryout" "tryout")
(treemacs-do-add-project-to-workspace "~/projects/rustlings" "rustlings")
