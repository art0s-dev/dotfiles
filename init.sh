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
    confs=$(cat $configdir/stowfolders.txt)
    log "Folgende stow Configs gefunden: $confs"
    stow $confs

    #die beiden fügen die symlinks am rootsys hinzu
    sudo stow -v -t / xorg 
    sudo stow -v -t / bin
    success "Fertig mit Stow"
}

#callflow
info "Starte Initskript"
#install_static_binarys -> funktioniert grad wegen netzwerk nicht
install_deb_packages
install_flatpaks
init_stow
success "Init abgeschlossen - Bitte Reboot"

