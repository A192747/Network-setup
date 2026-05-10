# MCP Gateway with Custom Catalog — Documentation

> 🔀 **Language / Язык:** [🇷🇺 Русский](#русский) | [🇺🇸 English](#english)

---

<a id="english"></a>
## English Version

> ⚠️ **Note:** This `docker-compose.yml` file is specifically designed to run the **Docker MCP Gateway** as a container. This is especially useful on devices where `docker mcp` is not available out-of-the-box (e.g., certain Linux distributions, isolated environments, or devices with limited Docker CLI support).

This example demonstrates how to use a custom catalog with the MCP Gateway:

+ Defines a custom `catalog.yaml` file from which servers can be selected.
+ Selects the `duckduckgo` server from the custom catalog.
+ Supports multiple transport protocols (see table below).

### 🔌 Transport Protocols & Endpoints

| Transport Flag | Endpoint URL | Description |
|---------------|--------------|-------------|
| `--transport=sse` | `http://localhost:8811/sse` | Server-Sent Events (SSE) — unidirectional server-to-client streaming |
| `--transport=streaming` | `http://localhost:8811/mcp` | HTTP Streaming — bidirectional communication over persistent HTTP connection |

> 💡 Choose the transport mode that best fits your client's capabilities. Both endpoints expose the same MCP server functionality.

### 🚀 How to Run with Docker Compose

```console
docker-compose up -d
```

After startup, add client services (e.g., Agents) that connect via your chosen transport protocol on port `8811`:

- For **SSE**: connect to `http://localhost:8811/sse`
- For **Streaming**: connect to `http://localhost:8811/mcp`

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
| `http://localhost:8811/mcp` | Streaming HTTP endpoint for client connections |
| `catalog.yaml` | File defining available servers |

### 💡 Developer Notes

If your device lacks native `docker mcp` support, this `docker-compose.yml` approach allows you to:
- Run MCP Gateway without additional dependencies
- Isolate the runtime environment in a container
- Easily scale and port the configuration across devices
- Switch between transport protocols without rebuilding the image

---

<a id="русский"></a>
## Русская версия

> ⚠️ **Важно:** Этот файл `docker-compose.yml` специально создан для запуска **Docker MCP Gateway** в виде контейнера. Это особенно необходимо на устройствах, где `docker mcp` не доступен из коробки (например, на некоторых дистрибутивах Linux, в изолированных средах или на устройствах с ограниченной поддержкой Docker CLI).

В данном примере показано, как использовать собственный каталог в MCP Gateway:

+ Определяется пользовательский каталог `catalog.yaml`, из которого можно выбирать серверы.
+ Из каталога выбирается сервер `duckduckgo`.
+ Поддерживается несколько транспортных протоколов (см. таблицу ниже).

### 🔌 Транспортные протоколы и эндпоинты

| Флаг транспорта | URL эндпоинта | Описание |
|----------------|---------------|----------|
| `--transport=sse` | `http://localhost:8811/sse` | Server-Sent Events (SSE) — однонаправленная потоковая передача от сервера к клиенту |
| `--transport=streaming` | `http://localhost:8811/mcp` | HTTP Streaming — двунаправленная связь через постоянное HTTP-соединение |

> 💡 Выберите режим транспорта, который лучше всего подходит возможностям вашего клиента. Оба эндпоинта предоставляют одинаковый функционал MCP-сервера.

### 🚀 Как запустить через Docker Compose

```console
docker-compose up -d
```

После запуска добавьте клиентские сервисы (например, агенты), которые подключаются через выбранный транспортный протокол на порту `8811`:

- Для **SSE**: подключайтесь к `http://localhost:8811/sse`
- Для **Streaming**: подключайтесь к `http://localhost:8811/mcp`

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
| `http://localhost:8811/mcp` | Точка входа для Streaming HTTP-подключений |
| `catalog.yaml` | Файл с описанием доступных серверов |

### 💡 Примечание для разработчиков

Если на вашем устройстве отсутствует нативная поддержка `docker mcp`, данный подход с `docker-compose.yml` позволяет:
- Запустить MCP Gateway без дополнительных зависимостей
- Изолировать среду выполнения в контейнере
- Легко масштабировать и переносить конфигурацию между устройствами
- Переключаться между транспортными протоколами без пересборки образа

---

> 🔄 **Switch language / Сменить язык:** [🇷🇺 Русский](#русский) | [🇺🇸 English](#english)