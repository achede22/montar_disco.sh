#!/bin/bash

# VARIABLES
export MI_DISCO="/dev/sdb: "
export MI_PARTICION="dev/sdb1: "
export CARPETA="/mnt/DISCO2"

# interactivo
echo -n "DISCO: ej: /dev/sdb: " ; read MI_DISCO
echo -n "NUMERO DE PARTICION: ej : 1 : "; read MI_PARTICION
echo -n "MONTAR EN: ej: /mnt/DISCO1: "; read CARPETA

# printf 

# CREAR PARTICION
sgdisk -n 1:0:200M $MI_DISCO

      # PART : START : END 
sgdisk -n 2:0:0 $MI_DISCO

lsblk

# FORMATEAR PARTICION
mkfs.xfs $MI_DISCO$MI_PARTICION

# CREAR CARPETA
mkdir -p $CARPETA 

# MONTAR
mount $MI_DISCO$MI_PARTICION $CARPETA

lsblk 

