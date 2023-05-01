#!/bin/bash

# Crea los archivos /dev/loop0 y /dev/loop1
mknod /dev/loop0 b 7 0
mknod /dev/loop1 b 7 1

# Crea un archivo de 20 MB y otro de 30 MB en tu sistema de archivos con las siguientes órdenes:
dd if=/dev/zero of=/root/archiso_SA20 bs=2k count=10000
dd if=/dev/zero of=/root/archivo_SA30 bs=3k count=10000

# Asociamos los archivos con el dispositivo loop correspondiente
losetup /dev/loop0 /root/archiso_SA20
losetup /dev/loop1 /root/archiso_SA30

# Comprobar
fdisk -l /dev/loop0 /dev/loop1

mkfs.ext3 -L LABEL_ext3 /dev/loop0
mkfs.ext4 -L LABEL_ext4 /dev/loop1

# Montamos
mkdir /mnt/SA_ext3 /mnt/SA_ext4
mount /dev/loop0 -r /mnt/SA_ext3
mount /dev/loop1 -o dirsync /mnt/SA_ext4

#Automontaje

echo "/dev/loop0	/mnt/SA_ext3	ext3	auto,ro		0 0" >> /etc/fstab
echo "/dev/loop1	/mnt/SA_exr4	ext4	auto,dirsync	0 0" >> /etc/fstab

