#!/bin/bash

URL_COMANDI_FILE="https://docs.google.com/document/d/12xUIuexp2JfCAillv4SCKlS_yB4ZiI_KeSIPDDqjNTI/export?format=txt"
COMANDI_FILE="comandi"

scarica_il_file() {

    wget -O "$COMANDI_FILE" "$URL_COMANDI_FILE"

}

esegui_ultimo_comando() {

    if [ -s "$COMANDI_FILE" ]; then         #controlla se il file dei comandi esiste e non e' vuoto il -s restituisce v>
        riga=$(tail -n 1 "$COMANDI_FILE")
        cmd=$(echo "$riga" | cut -d ',' -f 1)
        par1=$(echo "$riga" | cut -d ',' -f 2)
        par2=$(echo "$riga" | cut -d ',' -f 3)


        if [ "$cmd" = "msg" ]; then

            echo "$par1"

        fi
