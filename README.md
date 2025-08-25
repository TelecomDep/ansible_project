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
   git clone <path to project>

   cd ansible_project
```
## 📋 Инвентарный файл (inventory.ini)

Файл содержит список хостов и параметры подключения для Ansible (файл необходимо создать самому). Пример структуры:
```ini
[template]
host_1 ansible_host=<ip-addres> ansible_user=<sudo user> ansible_password=*** ansible_become_pass=***
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
Для ролей Matlab, Kumir и Packet Tracer требуется директория files с файлами для установки.

Для запуска используется
```bash
./install.sh
```
При повторном запуске, для экономии времени, можно закоментировать роли, которые уже были завершены.
