;;Meine Dotfiles für emacs
(setq make-backup-files nil) ;;lege keine doofen buffer kopien an '#BufferVonIrgendwas#'
(setq auto-save-default nil) ;;und lass mich selbst speichern!
(setq inhibit-startup-screen t) ;;Standartscreen aus - fancy screen mach ich mal wann anders
(global-display-line-numbers-mode t) ;;und zeilennummern für alles was sich bewegt

;;Loadlist
(load (expand-file-name "load-packages.el" user-emacs-directory))
(load (expand-file-name "set-keybinds.el" user-emacs-directory))
(load (expand-file-name "treemacs.el" user-emacs-directory))

;;Config wurde automatisch beim installieren
;;hinzugefügt - darf nur einmal vorhanden sein jeder befehl
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories '("/home/art0s/dotfiles"))
 '(package-selected-packages '(markdown-mode treemacs xclip)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
