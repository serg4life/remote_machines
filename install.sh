#!/bin/bash

source params.conf

# Verificar root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Instalar archivos de configuracion
install -Dm644 -o root -g root configs/user-config.conf $USER_CONF_FILE
install -Dm644 -o root -g root configs/virtual-machines.conf $MACHINES_CONF_FILE

# Carpeta de las sesiones
mkdir -p "$SESSIONS_PATH"

# Copiar carpeta de scripts
mkdir -p "$SCRIPTS_INSTALLATION_PATH"
cp -R scripts/* $SCRIPTS_INSTALLATION_PATH/

# Aplicar permisos (644 para archivos, 755 para directorios)
find $SCRIPTS_INSTALLATION_PATH/ -type f -exec chown root:root {} \;
find $SCRIPTS_INSTALLATION_PATH/ -type f -exec chmod 755 {} \;

find $SCRIPTS_INSTALLATION_PATH/ -type d -exec chown root:root {} \;
find $SCRIPTS_INSTALLATION_PATH/ -type d -exec chmod 755 {} \;

install -Dm644 -o root -g root params.conf $SCRIPTS_INSTALLATION_PATH/params.conf    

# Crear enlace simbólico para el ejecutable
ln -sf $SCRIPTS_INSTALLATION_PATH/develop_machines_main /usr/bin/$SOFTWARE_NAME


echo "=== Instalación completada ==="