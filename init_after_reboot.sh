source ./log.sh

#Dieses Skript muss laufen nachdem das init skript durchgelaufen ist und nach dem ersten reboot
function init_deamonjobs(){
    info "Füge Daemonjons hinzu"
    systemctl --user --now enable wireplumber.service #from the debianwiki to enable wireplumber

    sudo systemctl enable bluetooth
    sudo systemctl start bluetooth

    #Usb anschalten
    sudo modprobe btusb
    
    success "Daemonjobs fertig"
}

info "Starte Init after Reboot"
init_deamonjobs
success "Zusätzliche init fertig"
