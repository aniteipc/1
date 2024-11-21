#!/bin/bash 

if [ "$(id -u)" != "0" ]; then
   echo "错误: 这个脚本必须由root用户运行" 
   exit 1
fi

default_software="efibootmgr grub sudo wget zsh iwd networkmanager openssh ttf-dejavu  wqy-zenhei wqy-microhei cronie ranger man-db zip unzip htop usbctl zerotier-one"
client_software="alacritty xorg xorg-xinit i3  pulseaudio bluez bluez-utils google-chrome  polybar picom variety rofi maim  base-devel LightDM mesa lib32-mesa vulkan-intel lib32-vulkan-intel nvidia nvidia-settings lib32-nvidia-utils ntfs-3g ibus ibus-libpinyin vlc"
username="zk"
passwd="123"

sys_init(){
    	echo "修改时区"
        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


    echo "同步时间"
        hwclock --systohc
    echo "ok"


    echo "设置中文"
        sed -i '502s/.//'  /etc/locale.gen
	#zh_CH.UTF8
        sed -i '171s/.//'  /etc/locale.gen
	#en_US.UTF8
        echo "LANG=zh_CH.UTF-8" >> /etc/locale.conf
        echo "LANG=en_US.UTF-8" >> /etc/locale.conf
        #locale-gen
        echo "ok"


    echo "archlinux换源"
        sed -i  '10a Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
        echo "ok"


    echo "设置主机名"
        echo "${username}" >> /etc/hostname
        echo "ok"


    echo "设置host"
        echo "127.0.0.1 localhost" >> /etc/hosts
        echo "::1 localhost" >> /etc/hosts
        echo "127.0.1.1 ${username}.localdomain  arch" >> /etc/hosts
        echo "ok"


    echo "创建用户"
        echo "root:123" | chpasswd
        useradd ${username} -g wheel -m
        echo "${username}:${passwd}" | chpasswd
        echo "ok"


    echo "切换默认shell"
        chsh -s /bin/zsh ${username}
  if [ $? -eq 0 ]; then
        echo "zhs切换成功"
    else
        exit 2
  fi

	return 0
}
sys_init



#判断输入参数是什么，默认是client
ret=${1:-client}
[ $ret = server ] && client_software="";echo "InstallServer"|| echo "InstallClient"
    echo "安装软件"
        pacman -S --noconfirm  ${default_software} ${client_software}

            if [ $? -eq 0 ]; then
                echo "软件安装成功"
                echo "启动服务中"
                systemctl enable NetworkManager.service
                systemctl enable sshd
                #systemctl enable
	echo "启动服务完成"
        else
            echo "命令执行失败，退出状态码为 $?"
            exit 2
        fi



echo "设置grub"
    grub-mkconfig -o /boot/grub/grub.cfg
    if [ $? -eq 0 ]; then
        echo "gurb命令执行成功"
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

    else
        echo "命令执行失败，退出状态码为 $?"
        exit 2
    fi


echo "安装yay"
    git clone https://aur.archlinux.org
    cd yay-bin
    makepkg -si
    cd ..

    installs_client(){
	echo "配置启动i3"
    		cp /etc/X11/xinitrc /home/${username}/.xinitrc
    		echo "exec i3">> /home/${username}/.xinitrc


	echo "配置输入法"
		echo 'export GTK_IM_MODULE=ibus
			export XMODIFIERS=@im=ibus
  			export QT_IM_MODULE=ibus' >> /home/${username}/.xinitrc
		echo 'ibus-daemon -x -d' >> /home/${username}/.xinitrc
       	
	systemctl enable bluetooth.service
        systemctl enable  Lightdm.service
        systemctl enable cronie
}

