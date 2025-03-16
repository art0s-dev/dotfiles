;;Pakete
;;Einmal den ganzen laden initialisieren einmal
(require 'package)
  ;;melpa hinzufügen undzwar die stable packages - weil da immer dran rumgewerkelt wird...
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(unless (fboundp 'package-activate-all) 
  (package-refresh-contents) ;;Einmal alle refreshen
  (package-initialize)) ;;geht erst ab emacs 27!!

;;xclip damit ich sachen copy pasten kann
(unless (package-installed-p 'xclip) (package-install 'xclip))
(require 'xclip) (xclip-mode 1)

;;Markdown
(unless (package-installed-p 'markwdown-mode) (package-install 'markdown-mode))
