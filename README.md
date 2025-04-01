# Ansible Project

![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![GitHub last commit](https://img.shields.io/github/last-commit/kagacuki/ansible_project)

Этот репозиторий содержит Ansible-плейбуки и роли для автоматизации настройки инфраструктуры.

## 📦 Предварительные требования

- Ansible ≥ 2.9
- Python ≥ 3.8
- Доступ к управляемым узлам через SSH
- Файлы установки
## 🛠 Установка
1. Клонируйте репозиторий:
```bash
   git clone https://github.com/kagacuki/ansible_project.git

   cd ansible_project
```
## 📋 Инвентарный файл (hosts.txt)

Файл содержит список хостов и параметры подключения для Ansible. Пример структуры:
```ini
[template]
# Формат:
# 1. Алиас хоста | 2. IP-адрес | 3. Пользователь | 4. Путь к SSH-ключу
test ansible_host=192.168.0.1 ansible_user=root ansible_ssh_private_key_file=/root/.ssh/test
```

## 🎓 Плейбук deploy_software.yml

Этот плейбук автоматизирует развертывание полной учебной среды для студентов, включая базовое ПО, инструменты разработки и специализированные пакеты.

### Основные функции:
```yaml
- name: Set up development environment for students
  hosts: all               # Применяется на всех указанных хостах
  become: yes              # Выполнение с правами sudo
  roles:
    - role: student        # Базовые настройки учетных записей студентов
    - role: base_soft      # Установка базового ПО (редакторы, утилиты)
    - role: database       # Настройка СУБД (MySQL/PostgreSQL и т.д.)
    - role: virt           # Инструменты виртуализации (VirtualBox/KVM)
    - role: docker         # Установка Docker и Docker Compose
    - role: matlab         # Настройка MATLAB (лицензия, тулбоксы)
    - role: pct            # Установка Packet Tracer
    - role: time           # Настройка Режима сна
```
Для запуска используется
```bash
ansible-playbook -l <Alias хоста/группы> -i hosts.txt <playbook>.yml
```
При повторном запуске, для экономии времени, можно закоментировать роли, которые уже были завершены.
