source ./log.sh

#Setupscript für alles
configdir="./config"

function install_static_binarys(){
    info "Installiere bins"
    mkdir temp #wird später aufgeräumt
    info "Lade jetzt Pakete herunter"
    wget --directory-prefix temp  --input-file $configdir/binarys.txt

    #extrahiere alle tars
    for file in temp/*.{tar.gz,tgz}; do
	log "Datei gefunden: $file"
	tar -xzf "$file" -C temp
    done

    #ziehe alle binarys aus den entpackten tars und ab in stow folder
    bins=$(find ./temp -type f -executable)
    for bin in $bins; do
	log "Binary gefunden: $bin"
	name=$(basename $bin)
	mv $bin ./bin/usr/bin/$name
    done

    info "Räume temp auf"
    rm -fr ./temp #einmal müll einsammeln
    success "Fertig mit den Binarys"
}

function install_deb_packages(){
    info "Installiere Debian Pakete"
    packages=$(sed 's/#.*//g' $configdir/packages.txt \
		   | awk '{if($1!="") print $1}')

    log "Folgende Pakete gefunden: $packages"
    sudo apt update #Immer zuerst nach frischen paketen gucken
    sudo apt install $packages

    info "Entferne unnötige Pakete"
    sudo apt remove firefox-esr #librewolf flatpak als ersatz 
    sudo apt remove suckless-tools #zusätzliche deps von i3-wird nicht genutzt

    mkdir -p ~/Pictures/Screenshots #maim nutzt diesen Pfad
    
    sudo apt autoremove #Zum Schluss räumen wir nochmal auf
    success "Fertig mit Debian Paketen"
}

function install_flatpaks(){
    log "Installiere Flatpaks"
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpaks=$(sed 's/#.*//g' $configdir/flatpaks.txt \
		   | awk '{if($1!="") print $1}')

    log "Folgende Flatpaks gefunden: $flatpaks"
    flatpak install flathub $flatpaks

    log "Fertig mit Flatpaks"
}

function init_stow(){
    info "Initialisiere Stow Files"

    rm ~/.bashrc # wir ersetzen die durch unsere

    confs=$(cat $configdir/stowfolders.txt)
    log "Folgende stow Configs gefunden: $confs"
    stow $confs

    #die hier fügen die symlinks am rootsys hinzu
    sudo stow -v -t / xorg 
    sudo stow -v -t / bin

    #Die eingebundenen Systemd services müssen auch geladen werden
    #Systemd liest userprozesse sowieso über die .config...
    systemctl --user daemon-reexec #neu laden
    systemctl --user daemon-reload

    #TODO mach ma ne schleife draus und lies das alles dynamisch aus...
    systemctl --user enable emacsd.service
    systemctl --user start emacsd.service
    
    success "Fertig mit Stow"
}

#callflow
info "Starte Initskript"

if [ "$1" = "--stow" ]; then
    init_stow
else  
    install_static_binarys
    install_deb_packages
    install_flatpaks
    init_stow
fi

success "Init abgeschlossen - Bitte Reboot"

