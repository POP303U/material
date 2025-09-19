#!/bin/sh

# Remove desktop entry if you want
echo -e "[${PURPLE}info${RESET}] Debloating desktop entries..."
./install_de_debloat $FLAG_REMOVE_GENERIC $FLAG_REMOVE_QT $FLAG_REMOVE_ROFI # Removes chosen desktop entries
