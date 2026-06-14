# HW3_TP
## Прохоров Михаил Михайлович

### Генерация данных:
```bash
/run.sh build_generator
/run.sh run_generator
```

### Создание отчета:
```bash
/run.sh build_reporter
/run.sh run_reporter
```

#### Рекомендуется использовать команды генерации и аналитика в таком порядке во избежании docker ошибок.

### Для дополнительной инфоромации по имеющимся командам:
```bash
/run.sh help
```

### Запуск веб-сервера:
```bash
/run.sh report_server
```

### Быстрый запуск веб-сервера:
```bash
/run.sh report_server
```

#### Сразу генерирует данные, создает отчет и открывает порты.

### Открытие веб-сервера:
#### Через Github Codespaces в VS Code
Используется встроенный в Codespaces механизм туннелирования (Port Forwarding):
"Когда приложение, запущенное в codespace, выводит на терминал данные, содержащие URL-адрес localhost, например http://localhost:PORT или http://127.0.0.1:PORT, порт автоматически перенаправляется."
(см. подробнее https://docs.github.com/en/codespaces/developing-in-a-codespace/forwarding-ports-in-your-codespace)

Сразу же после /run.sh report_server
Можно переходить http://127.0.0.1:8080

#### При возникновении ошибки прав доступа:
```bash
chmod +x run.sh
```

В вкладке "Ports" в нижней панели VS Code так же будет отображаться этот порт 8080 (на него проброшен 80-й порт из Docker контейнера).

#### Через localhost на