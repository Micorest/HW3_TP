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
    echo "Запускаем генератор локально..."
    mkdir -p local_data
    python3 generate.py local_data

elif [ "$COMMAND" == "help" ]; then
    echo "Поддерживаются команды:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"

else
    echo "Неизвестная команда. Напишите параметр-команду help."
fi