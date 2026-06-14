#!/bin/bash

COMMAND=$1

if [ "$COMMAND" == "build_generator" ]; then
    echo "Сборка образа генератора"
    docker build -t generator -f Dockerfile.generator .

elif [ "$COMMAND" == "run_generator" ]; then
    echo "Запуск генератора в контейнере"
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" generator

elif [ "$COMMAND" == "create_local_data" ]; then
    echo "Запуск генератора локально"
    mkdir -p local_data
    python3 generate.py local_data

elif [ "$COMMAND" == "build_reporter" ]; then
    echo "Сборка образа аналитика"
    docker build -t reporter -f Dockerfile.reporter .

elif [ "$COMMAND" == "run_reporter" ]; then
    echo "Запуск аналитика в контейнере"
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter

elif [ "$COMMAND" == "structure" ]; then
    echo "Вывод структуры проекта"
    find . | sort

elif [ "$COMMAND" == "clear_data" ]; then
    echo "Удаление сгенерированных данных из data/"
    rm -rf data/*
    echo "Готово. Папка data пуста."

elif [ "$COMMAND" == "inside_generator" ]; then
    echo "Проверка содержимого /data внутри контейнера generator"
    docker run --rm -v "$(pwd)/data:/data" generator ls -la /data

elif [ "$COMMAND" == "inside_reporter" ]; then
    echo "Проверка содержимого /data внутри контейнера reporter" 
    docker run --rm -v "$(pwd)/data:/data" reporter ls -la /data

elif [ "$COMMAND" == "report_server" ]; then
    echo "Перейдите по адресу для просмотра отчета http://127.0.0.1:8080/report.html"
    echo "Нажмите Ctrl+C для остановки сервера."
    docker run --rm -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html" nginx:alpine

elif [ "$COMMAND" == "help" ]; then
    echo "Поддерживаются команды:"
    echo "  ./run.sh build_generator   — Собрать образ генератора"
    echo "  ./run.sh run_generator     — Запустить генератор (создаст data/data.csv)"
    echo "  ./run.sh create_local_data — Локальный запуск генератора (создаст local_data/data.csv)"
    echo "  ./run.sh build_reporter    — Собрать образ аналитика"
    echo "  ./run.sh run_reporter      — Запустить аналитика (создаст data/report.html)"
    echo "  ./run.sh structure         — Вывести файлы"
    echo "  ./run.sh clear_data        — Очистить папку data/"
    echo "  ./run.sh inside_generator  — Проверить /data в генераторе"
    echo "  ./run.sh inside_reporter   — Проверить /data в аналитике"
    echo "  ./run.sh report_server     — Запустить веб-сервер с отчетом"

else
    echo "Неизвестная команда. Напишите параметр-команду help."
fi