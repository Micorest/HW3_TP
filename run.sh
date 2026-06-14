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
    echo "Сборка образа аналитика (reporter)"
    docker build -t reporter -f Dockerfile.reporter .

elif [ "$COMMAND" == "run_reporter" ]; then
    echo "Запуск аналитика в контейнере"
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter

elif [ "$COMMAND" == "help" ]; then
    echo "Поддерживаются команды:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"
    echo "./run.sh build_reporter"
    echo "./run.sh run_reporter"
else
    echo "Неизвестная команда. Напишите параметр-команду help."
fi