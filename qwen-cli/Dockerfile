FROM ubuntu:24.04

# Установка необходимого
RUN apt-get update && apt-get install -y \
    curl \
    git \
    openssh-server \
    sudo \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Настройка SSH
RUN mkdir /var/run/sshd \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \
    && echo 'PermitEmptyPasswords no' >> /etc/ssh/sshd_config

# Создаём пользователя (рекомендую не root для безопасности)
RUN useradd -m -s /bin/bash qwenuser \
    && echo 'qwenuser:rootpasswd' | chpasswd \
    && adduser qwenuser sudo

# Установка Node.js 20+ (официальный способ)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Установка Qwen Code CLI глобально
RUN npm install -g @qwen-code/qwen-code@latest

# Открываем порт SSH
EXPOSE 22

# Запуск SSH при старте контейнера
CMD ["/usr/sbin/sshd", "-D"]
