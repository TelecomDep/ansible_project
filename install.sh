#!/bin/bash

PLAYBOOK_PATH="deploy_software.yaml"
PLAYBOOK_SSH_PATH="change_ssh.yaml"
INVENTORY_FILE="inventory.ini"
INSTALL_PATH="/home/tsvs/ansible"
INSTALL_USER=tsvs

# Создание директории 
echo "Создание директории ..."
mkdir -p "$INSTALL_PATH"

# Установка Ansible
echo "Установка Ansible..."
if ! command -v ansible &> /dev/null; then
    sudo apt update
    sudo apt install -y ansible
else
    echo "Ansible уже установлен."
fi

# fiansible-playbook -l <Alias хоста/группы> -i hosts.txt <playbook>.yml

# Запуск playbook
process_id=$!
echo "PID: $process_id"
echo "Запуск playbook..."
wait $process_id

# Если захотим моенять порт для SSH, меняем в files/sshd_config и запускаем этот скрипт
# Затем меняем ansible_port в запуске следующего playbook.
# echo "PID: $process_id"
# ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_SSH_PATH" --extra-vars "debug_mode=true"
# wait $process_id

echo "PID: $process_id"
ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_PATH" --extra-vars "debug_mode=true ansible_port=22"
wait $process_id

echo "Install script = Done"
