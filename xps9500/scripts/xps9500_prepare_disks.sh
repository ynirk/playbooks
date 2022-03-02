#!/bin/bash

sudo sfdisk --delete /dev/nvme0n1

echo -e "n\n\n\n+500M\nn\n\n\n\nt\n1\n1\nw\n" | fdisk /dev/nvme0n1

mkfs.vfat -F32 -n BOOT /dev/nvme0n1p1
cryptsetup luksFormat --align-payload 8192 --type luks2 --pbkdf argon2id --iter-time 5000 --verify-passphrase /dev/nvme0n1p2
cryptsetup luksOpen --allow-discards /dev/nvme0n1p2 luks

pvcreate --dataalignment 4M /dev/mapper/luks
vgcreate vg /dev/mapper/luks
lvcreate -L 64G vg -n swap
lvcreate -l +100%FREE vg -n root
