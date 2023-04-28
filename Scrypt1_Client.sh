#!/bin/bash

# Установка OpenSSH сервера
sudo apt-get update
sudo apt-get install openssh-server

# Установка прав
sudo chmod +w /etc/ssh

# Поиск и изменение строки в файле sshd_config
if grep -q "#PasswordAuthentication yes" /etc/ssh/sshd_config; then
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
fi

if grep -q "#PermitRootLogin prohibit-password" /etc/ssh/sshd_config; then
    sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
fi

if grep -q "#PubkeyAuthentication yes" /etc/ssh/sshd_config; then
    sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
fi

# Перезапуск SSH сервера для применения изменений
sudo systemctl restart sshd.service

echo "OpenSSH сервер установлен и настроен."
sudo systemctl status ssh
