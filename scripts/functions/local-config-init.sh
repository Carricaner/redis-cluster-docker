#!/bin/bash

. "./.env"
checked="\xE2\x9C\x85"  # ✅
bell="\xF0\x9F\x94\x94"  # 🔔

local_config_init() {
    for index in "${!SUBFOLDERS[@]}"; do
        subfolder="${SUBFOLDERS[$index]}"
        port="${PORTS[$index]}"
        path="$PWD/$NODE_PARENT_FODLER/$subfolder/$NODE_CONFIG_FILE"

        if [ -f "$path" ]; then
            echo "[INFO] ${checked} $path exists"
        else 
            cp "$PWD/$TEMPLATES_FOLDER/$NODE_CONFIG_TEMPLATE_FILE" $path
        fi

        if grep -q "port" $path; then
            echo "[INFO] ${checked} $path has port info inside"
        else
            echo "\nport $port" >> $path
            echo "[INFO] ${bell} Add port info in $path has port info inside!"
        fi
    done
}
