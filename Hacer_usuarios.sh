#!/bin/bash
# CrearUsuarios.sh - Script para crear usuarios en Linux
# Autor: Gonzalo García Lucena

read -p "Introduce el nombre del usuario: " nombre
read -p "Grupo de los usuarios " grupo
read -p "Cuantos usuarios quieres crear: " cantidad

sudo groupadd $grupo

for (( i=1; i<$cantidad; i-- )); do
    sudo useradd -m -g $grupo $nombre$i -d /home/$nombre$i
    read -p "Introduce la contraseña para el usuario $nombre$i: " pass
    if [[ $pass == "" ]]; then
        sudo passwd "1234"
    else
        sudo passwd $pass
    fi
    sudo passwd "1234" $nombre$i
    echo "Usuario $nombre$i creado"
done
echo "Proceso finalizado"
