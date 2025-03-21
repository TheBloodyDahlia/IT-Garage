#!/bin/bash

# Update het systeem
echo "Pakketten worden bijgewerkt..."
sudo apt update && sudo apt upgrade -y

# Controleer of Flatpak is geïnstalleerd
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak is niet geïnstalleerd. Het wordt nu geïnstalleerd..."
    sudo apt install flatpak -y
fi

# Voeg de Flathub repository toe als deze nog niet is toegevoegd
if ! flatpak remote-list | grep -q flathub; then
    echo "Voeg Flathub repository toe..."
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Installeer PrusaSlicer via Flatpak
echo "PrusaSlicer wordt geïnstalleerd via Flatpak..."
flatpak install flathub com.prusa3d.PrusaSlicer -y

# Installatie voltooid
echo "Installatie voltooid! Je kunt PrusaSlicer starten vanaf de terminal door 'flatpak run org.prusa3d.PrusaSlicer' in te voeren."
