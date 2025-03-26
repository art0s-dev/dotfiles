#!/usr/bin/bash

#wir brauchen hier eigentlich nur die pakete stow und emacs
sudo dnf install stow emacs git-delta
stow emacs git

systemctl --user start emacs.service   # Start emacs for the current session
systemctl --user enable emacs.service  # Enable emacs to be started at login
