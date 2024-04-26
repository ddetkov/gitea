# © Dmitry Detkov 2024
# Изделие №4
# File: dockerfile

ARG gitea_tag

# базовый образ
FROM gitea/gitea:${gitea_tag:-latest} as gitea

# подпись
LABEL devops="Dmitry Detkov"
LABEL email="maliciousgenius@gmail.com"
LABEL tel="+79604565686"

# копирование скриптов
RUN mkdir -p /scripts
ADD ./scripts/backup.sh /scripts/backup.sh
ADD ./scripts/restore.sh /scripts/restore.sh

# дать права на выполнение скриптов
RUN chmod +x /scripts/backup.sh /scripts/restore.sh

EXPOSE 22/tcp 3000/tcp
