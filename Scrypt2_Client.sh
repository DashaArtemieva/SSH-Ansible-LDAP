#!/bin/bash

# Поиск и изменение строки в файле sshd_config
if grep -q "PasswordAuthentication yes" /etc/ssh/sshd_config; then
    sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi

# Установка прав
sudo chmod -R -w /etc/ssh
sudo chmod 600 ~/.ssh/authorized_keys

# Перезапуск SSH сервера для применения изменений
sudo systemctl restart sshd.service

echo "OpenSSH сервер установлен и настроен."
sudo systemctl status ssh
