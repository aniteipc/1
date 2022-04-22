#!/bin/bash 
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i '501s/.//'  /etc/locale.gen
#ÉèÖÃzh_CH.UTF8
#sed -i '178s/.//'  /etc/locale.gen
#ÉèÖÃen_US.UTF8
locale-gen
echo "LANG=zh_CH.UTF-8" >> /etc/locale.conf
#echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "zk" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 zk.localdomain  arch" >> /etc/hosts
echo "root:123" | chpasswd
useradd zk -g wheel -m
echo "zk:123" | chpasswd


pacman -S --noconfirm  bluez bluez-utils  efibootmgr grub sudo vim wget  zsh iwd networkmanager
#ttf-dejavu  wqy-zenhei wqy-microhei alacritty xorg xorg-xinit i3  pulseaudio


systemctl enable bluetooth.service
systemctl enable NetworkManager.service
#systemctl enable
#systemctl enable
#systemctl enable
#systemctl enable
#systemctl enable

chsh -s /bin/zhs

grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
