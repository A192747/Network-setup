# MCP Gateway with Custom Catalog — Documentation

> 🔀 **Language / Язык:** [🇷🇺 Русский](#русский) | [🇺🇸 English](#english)

---

<a id="english"></a>
## English Version

> ⚠️ **Note:** This `docker-compose.yml` file is specifically designed to run the **Docker MCP Gateway** as a container. This is especially useful on devices where `docker mcp` is not available out-of-the-box (e.g., certain Linux distributions, isolated environments, or devices with limited Docker CLI support).

This example demonstrates how to use a custom catalog with the MCP Gateway:

+ Defines a custom `catalog.yaml` file from which servers can be selected.
+ Selects the `duckduckgo` server from the custom catalog.
+ Uses **SSE** (Server-Sent Events) for transport, accessible at `http://localhost:8811/sse`.

### 🚀 How to Run with Docker Compose

```console
docker-compose up -d
```

After startup, add client services (e.g., Agents) that connect via the `sse` protocol on port `8811`.

---

### 📋 Example File Structure

```
├── docker-compose.yml    # Configuration for running MCP Gateway in a container
├── catalog.yaml          # Custom server catalog
└── ...                   # Additional configuration files
```

### 🔍 Useful References

| Resource | Description |
|----------|-------------|
| `http://localhost:8811/sse` | SSE endpoint for client connections |
| `catalog.yaml` | File defining available servers |

### 💡 Developer Notes

If your device lacks native `docker mcp` support, this `docker-compose.yml` approach allows you to:
- Run MCP Gateway without additional dependencies
- Isolate the runtime environment in a container
- Easily scale and port the configuration across devices

---

<a id="русский"></a>
## Русская версия

> ⚠️ **Важно:** Этот файл `docker-compose.yml` специально создан для запуска **Docker MCP Gateway** в виде контейнера. Это особенно необходимо на устройствах, где `docker mcp` не доступен из коробки (например, на некоторых дистрибутивах Linux, в изолированных средах или на устройствах с ограниченной поддержкой Docker CLI).

В данном примере показано, как использовать собственный каталог в MCP Gateway:

+ Определяется пользовательский каталог `catalog.yaml`, из которого можно выбирать серверы.
+ Из каталога выбирается сервер `duckduckgo`.
+ Для транспорта используется **SSE** (Server-Sent Events), подключение к которому осуществляется по адресу `http://localhost:8811/sse`.

### 🚀 Как запустить через Docker Compose

```console
docker-compose up -d
```

После запуска добавьте клиентские сервисы (например, агенты), которые подключаются по протоколу `sse` на порт `8811`.

---

### 📋 Структура файлов (пример)

```
├── docker-compose.yml    # Конфигурация для запуска MCP Gateway в контейнере
├── catalog.yaml          # Пользовательский каталог серверов
└── ...                   # Дополнительные конфигурационные файлы
```

### 🔍 Полезные ссылки

| Ресурс | Описание |
|--------|----------|
| `http://localhost:8811/sse` | Точка входа для SSE-подключений |
| `catalog.yaml` | Файл с описанием доступных серверов |

### 💡 Примечание для разработчиков

Если на вашем устройстве отсутствует нативная поддержка `docker mcp`, данный подход с `docker-compose.yml` позволяет:
- Запустить MCP Gateway без дополнительных зависимостей
- Изолировать среду выполнения в контейнере
- Легко масштабировать и переносить конфигурацию между устройствами

---

> 🔄 **Switch language / Сменить язык:** [🇷🇺 Русский](#русский) | [🇺🇸 English](#english)