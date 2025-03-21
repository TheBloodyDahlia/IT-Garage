#!/bin/bash

# Controleer of Linux ingeschakeld is
if [ ! -d "$HOME/.linuxbrew" ] && [ ! -d "$HOME/.penguin" ]; then
    echo "Linux (Crostini) is niet ingeschakeld op deze Chromebook. Schakel het in via de instellingen."
    exit 1
fi

# Controleer de versie van Debian
DEBIAN_VERSION=$(grep -oE '^[0-9]+' /etc/debian_version)

if [ "$DEBIAN_VERSION" -ge 12 ]; then
    PRUSA_FILE_PATTERN="PrusaSlicer-*-linux-x64-newer-distros-GTK3-*.AppImage"
    PRUSA_URL="https://github.com/PrusaSlicer/PrusaSlicer/releases/latest/download/PrusaSlicer-latest-x64-newer-distros-GTK3.AppImage"
else
    PRUSA_FILE_PATTERN="PrusaSlicer-*-linux-x64-older-distros-GTK3-*.AppImage"
    PRUSA_URL="https://github.com/PrusaSlicer/PrusaSlicer/releases/latest/download/PrusaSlicer-latest-x64-older-distros-GTK3.AppImage"
fi

# Download het PrusaSlicer bestand van GitHub
echo "Het PrusaSlicer bestand wordt gedownload van GitHub..."

wget -O PrusaSlicer.AppImage "$PRUSA_URL"

if [ ! -f "PrusaSlicer.AppImage" ]; then
    echo "Het downloaden is mislukt. Controleer de internetverbinding en probeer het opnieuw."
    exit 1
fi

# Systeem bijwerken
echo "Pakketten worden bijgewerkt..."
sudo apt update && sudo apt upgrade -y

# Maak het bestand uitvoerbaar
chmod +x PrusaSlicer.AppImage

# Verplaats het bestand naar /usr/local/bin
sudo mv PrusaSlicer.AppImage /usr/local/bin/prusaslicer

# Installatie voltooid
echo "Installatie voltooid! Je kunt PrusaSlicer starten vanaf de terminal door 'prusaslicer' in te voeren."
