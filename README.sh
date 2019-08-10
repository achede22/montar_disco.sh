# montar_disco.sh
script ejemplo para particionar. formatear, montar un disco con gdisk


Tabla de Particiòn
	BIOS --> MBR = Master Boot Record     # fdisk
	UEFI --> GPT = GUID Partition Table   # gdisk
			" Secure Boot" 
		
LVM = Logical Volume Management

lsblk
df -h

PARTICIONAR # gdisk
FORMATEAR   # mkfs.xfs \\#EXT4, NTFS, XFS, BTRFS , FAT32 
MONTAR      # mount
Arranque Montado # /etc/fstab

vim /etc/fstab

# probar /etc/fstab
umount -a 
	lsblk ; df -h
mount -a
	lsblk ; df -h

NFS = Network File System
SAMBA = comparte directorios Win/Linux 



############### LVM 

pvcreate /dev/sdc  # FORMATEA TIPO LVM 
vgcreate datavg /dev/sdc # vgcreate GRUPO PV
lvcreate -l +100%FREE datavg -n backup
mkfs.xfs /dev/datavg/backup
mkdir /mnt/LVM
mount /dev/datavg/backup /mnt/LVM 
yes > /mnt/LVM/yes

pvcreate /dev/sde # opcional 
vgextend datavg /dev/sde
lvextend -l +100%FREE /dev/datavg/backup

