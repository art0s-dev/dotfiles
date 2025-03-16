;;Keybindings
;;Ziel ist es hier ein Notepad ähnliches verhalten hinzubekommen
(cua-mode t) ;;(strg c + v undso) keine Schizophrenie mehr....
(global-set-key (kbd "C-s") 'save-buffer);; Bittebitte lass mit mit strg s speichern
(global-set-key (kbd "C-f") 'isearch-forward) ;;Suche muss auch laufen
(define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward);;Suchbestätigung
(global-set-key (kbd "C-a") 'mark-page) ;;Suche muss auch laufen
