## 🐳 Роль `docker`: Установка Docker и Docker Compose

Эта роль автоматизирует установку Docker Engine и Docker Compose с официальных репозиториев, включая настройку окружения для работы без sudo.

### 🌟 Ключевые возможности:

- Установка Docker CE (Community Edition)
- Установка Docker Compose
- Добавление пользователя в группу `docker`
- Проверка работоспособности
- Поддержка автоматического обновления

### ⚙️ Переменные конфигурации:

```yaml
# В group_vars/all.yml или в vars/main.yml
docker_compose_version: "2.23.0"  # Версия Docker Compose
docker_compose_dest: "/usr/local/bin/docker-compose"  # Путь установки
