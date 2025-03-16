# Debian Rice
Das ziel der aktion ist es mit "get shit done" attitüde und mit old tech
eine Stabile Entwicklungsumgebung herzustellen, mit der ich arbeiten kann.
Das rice soll portabel auf allen debian rechnern funktionieren.

## Packages
Bevor ich allerdings anfange wild sachen zu installieren, brauche ich eine Liste mit Programmen.
Diese möchte ich erweitern und bei jeder debian installation mitnehmen und dann mit einem shellskript einspielen.
-> config/packages.txt
Da pack ich jedes Paket rein und einen kommentar mit version oder warum
ich dieses Paket gewählt habe.

## Flatpaks
Das gleiche wie bei den Packages gilt auch für die Flatpaks
Dort werden die Pakete mit vollem Namen von Flathub eingetragen und von init skript dann installiert

## Gnu Stow und Dotfiles
Die Dotfiles befinden sich im jeweiligen ordner nach konvention wie stow hald arbeitet.
So können die configs, die eingebunden werden müssen einfach in der configs.txt erweitert werden
und dann im ordnerverzeichnis eingebunden werden
Das initskript macht dann den rest

> Hinweis: Wenn die Emacs initskripte angepasst werden 
> muss jedes mal das initskript neugestartet werden!

## Binarys
Manchmal braucht man statische binarys, die in debian testing sind oder in unstable.
ich will mir nicht das system zerschießen also zieh ich mir die einfach aus github
und binde die über stow hinterher ein

## Hinweis zur Portabilität
Wenn die dotfiles auf einer VM getestet werden muss ein passthru für bluetooth 
eventuell eingerichtet werden. Das rice wird auf mehreren virtuellen Maschinen auf 
portabilität getestet

## Installation
-> ssh-keygen durchlaufen lassen
-> bei github den public key hinzufügen
-> dotfiles ziehen 
-> in der .gitconfig Emailadresse eintragen
-> und init.sh starten (vorher noch ausführbar machen?)
-> nach dem Installieren der Dotfiles init einmal neustarten wegen pipewire
-> Danach die Init_after_Reboot starten. Die enthält die ganzen inti deamons und so
-> mit diesem wunderschönen Befehl aus dem Debian Handbuch einmal prüfen, ob der ganze bums installiert ist
> LANG=C pactl info | grep '^Server Name'
-> und einmal checken ob der wireplumber läuft
> systemctl --user --now enable wireplumber.service

## TODO's
- bluetooth muss noch laufen
- screenshot tool muss ballern

- Alle Tasten müssen funktionalität haben
  - Lauter
  - Leister
  - Ton aus
  - Play (wie auch immer ich das belegen will)
  - Mikrofon cutton
  - Screenshot
  - Was auch immer ich auf den smiley button legen will
  - Was auch immer ich auf den Comm button legen will
  - und die F4 ist noch frei (Hilfe Keybind für alle Tastaturbelegungen????)

Wünsche für die Zukunft
In da Future:
- Auflösung deklarativ klären können
- einfaches tool für bluetooth geräte (tui?)
- skript für usbstick verwenden (ja dann auch microsoft shit einbinden)
- backports für debian stable nutzen können. -> amdgpu
(ich will nicht lange rumfummeln, weil ich will dass die graka sofort läuft...) alternativ kann ich ja auch n skript schreiben, was mit die amdgpu einfach ausm aktuellen kernel zieht und dann da reinpackt.

Kommt dann gaaaanz am Ende (Wenn überhaupt):
- Generelle gestaltung (Monokai 4 everyone?)
- gtk theme für pavucontrol und für blueman
- i3 statusbar gegen was gescheites austauschen
- Schriftarten anpassen überall 
  -> (eine font für alles -> einmal in mono für terminal und einmal normal für alles andere
- conky im Hintergrund des workspaces rechts
- Tägliche  todos im Hintergrund des workspaces links
- emacs einträge außer terminal für rofi filtern + uxterm und xterm
- emacs terminal immer mit alacritty starten, wenn über rofi
- die schrift von rofi könnte kleiner 

Comfortfeatures für emacs:
- search and replace (all)
- Treemacs Keybinds (wenn in Treemacs)
   - treemacs neuer ordner
   - treemacs neue datei
   - treemacs datei/ordner löschen
- nächster paragraph
- tabs nutzen
  - treemacs -> öffne in tab, wenn nicht schon vorhanden
  - nächster tab
  - vorheriger tab
- springe zu paketliste
- springe beim öffnen von dateien (wenn ich emacs x.sh) aufgemacht habe direkt in den buffer rein
- emacs daemon irgendwie einrichten (deamonjob bei systemstart? und bash emacs gg emacsclient austauschen)
  -> vllt nen kürzel oder so eintragen???
-> fuzzyfind für files im aktuellen projekt 
