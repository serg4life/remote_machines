#!/bin/bash

source params.conf

confirm_uninstall() {
    read -p "¿Estás seguro de desinstalar $SOFTWARE_NAME? [Y/N] " resp
    [[ "$resp" =~ [yY] ]] || exit 0
}

INSTALL_PATHS=(
    "$USER_CONF_PATH"
    "$MACHINES_CONF_PATH"
    "$SCRIPTS_INSTALLATION_PATH"
)

# Verificar root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

confirm_uninstall

echo ""
echo "=== Desinstalando $SOFTWARE_NAME ==="

# Eliminar archivos del sistema
for path in "${INSTALL_PATHS[@]}"; do
    if [ -e "$path" ]; then
        echo "Eliminando: $path"
        rm -rf "$path"
    fi
done

echo "=== Desinstalación completada ==="