# Собираем образ
docker build -t qwen-cli-ssh .

# Запускаем контейнер (с монтированием папки для проектов)
docker run -d \
  --name qwen-cli \
  -p 2222:22 \
  -v $(pwd)/projects:/home/qwenuser/projects \
  -v qwen-data:/home/qwenuser/.qwen \
  --restart unless-stopped \
  qwen-cli-ssh:latest


# docker exec -it -u root qwen-cli bash
# Все команды ниже выполняются в контейнере qwen-cli
# sudo chown -R qwenuser:qwenuser /home/qwenuser/.qwen
# sudo chmod -R 755 /home/qwenuser/.qwen
# qwen
# выбрать подключение Qwen Auth (далее по инструкции)