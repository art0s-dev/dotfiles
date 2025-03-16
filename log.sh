#N paar farbige log ausgaben
log() {
    echo -e "\n\033[1;30;43m $1 \033[0m\n" # Orange Hintergrund, schwarzer Text
}

info() {
    echo -e "\n\033[1;30;44m $1 \033[0m\n" # Blauer Hintergrund, schwarzer Text
}

success() {
    echo -e "\n\033[1;30;42m $1 \033[0m\n" # Grüner Hintergrund, schwarzer Text
}
