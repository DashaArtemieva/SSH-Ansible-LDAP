#!/bin/bash

# Установка Ansible Core
sudo apt install ansible-core

# Генерация RSAKey
ssh-keygen

# Отправка ключа на удаленный хост
sh ssh-copy-id admin1@192.168.225.134 # User@remote_host

echo "Открытый ключ отправлен на удаленный хост"
