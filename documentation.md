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
> muss jedes mal das initskript mit --stow neugestartet werden,
> weil das die systemd jobs einrichtet und aktualisiert.

## Binarys
Manchmal braucht man statische binarys, die in debian testing sind oder in unstable.
ich will mir nicht das system zerschießen also zieh ich mir die einfach aus github
und binde die über stow hinterher ein

## Hinweis zur Portabilität
Wenn die dotfiles auf einer VM getestet werden muss ein passthru für bluetooth 
eventuell eingerichtet werden. Das rice wird auf mehreren virtuellen Maschinen auf 
portabilität getestet

## Installation
-> dotfiles ziehen
-> .gitconfig.template in . gitconfig ändern
-> in der .gitconfig Emailadresse eintragen
-> und init.sh starten (vorher noch ausführbar machen?)
-> nach dem Installieren der Dotfiles init einmal neustarten wegen pipewire
-> Danach die Init_after_Reboot starten. Die enthält die ganzen inti deamons und so

## Debug Info für Sound
mit diesem wunderschönen Befehl aus dem Debian Handbuch einmal prüfen, ob der ganze bums installiert ist
> LANG=C pactl info | grep '^Server Name'
und einmal checken ob der wireplumber läuft
> systemctl status wireplumber
> Wenn er NICHT läuft einmal enablen.
> systemctl --user --now enable wireplumber.service

## Debug Info für Bluetooth
Wenn Bluetooth nicht läuft 
1) ist der usbstick drin und ist der passthru (wenn es einen gibt) eingerichtet?
2) läuft der deamonjob über systemd? 
3) Was sagt die `sudo dmesg | grep blue` ausgabe?
4) Erkennt Bluetoothctl den controller?

## Debug Info für Emacsclient
Geb dir einmal das journalctl aus und schau, was er sagt.
Der Dienst muss bei systemd verlinkt werden, dann muss da n reload erfolgen
und dann sollte es eigentlich gehen. sonst nochmal durchdebuggen.
> Ich hab als temporären fix erstmal einen restart befehl in die xinit gelegt. 
> Damit is der daemon wenigsten an, wenn ich den ganzen haufen hier starte.

## TODO's
Die Todos sind nach wichtigkeit sortiert.
Ich fange oben an und erledige die stück für stück.
Sobald ich bei den KANN sachen bin, mach ich ne Picking liste draus und nehme mir dann einfach
die Ideen, die sich mir als "Wichtig" erscheinen in dem Moment oder was mir am meisten Schnelligkeit gibt,
beim arbeiten

### MUSS
- mounting skript für usbstick verwenden (ja dann auch microsoft shit einbinden) - will die backup daten haben
  -> mach ne tar.gz dann aus allen daten.
  
### SOLLTE:

#### Rice auf ner 2ten VM testen
- Portabilität

### KANN:
- Generelle gestaltung (Monokai 4 everyone?)
- gtk theme für pavucontrol und für blueman
- i3 statusbar gegen was gescheites austauschen
- Schriftarten anpassen überall 
  -> (eine font für alles -> einmal in mono für terminal und einmal normal für alles andere
- conky im Hintergrund des workspaces rechts
- Tägliche  todos im Hintergrund des workspaces links
- die schrift von rofi könnte kleiner 

#### Confortfeatures für Emacs:
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
-> fuzzyfind für files im aktuellen projekt 

#### Alle Tasten müssen funktionalität haben
  - Play (wie auch immer ich das belegen will)youtube oder spotify in der regel
  - Was auch immer ich auf den smiley button legen will
  - Was auch immer ich auf den Comm button legen will
  - und die F4 ist noch frei (Hilfe Keybind für alle Tastaturbelegungen????)

### Würde
> Wenn ich von Obsidian auf Emacs Org Mode umsteigen will, sollte ich 
> Org mode installieren und das dann auch lernen

Wenn ich demnächst Rust lernen will:
> Emacs einrichten, sodass ich damit ohne Probleme Rust programmieren kann

 Rice auf Hardware Testen (ganz zum schluss)
- Funktioniert das mit Xrandr so oder muss ich das nochmal anpassen?
- werden alle treiber erkannt?
- amdgpu stuff runterladen und einbinden

