#!/bin/bash

# Сохраняем общий вес всех файлов до архивации в переменную
total_size_before=$(du -sh . --exclude='.*' | cut -f1)

# Найти все файлы (не директории) в текущей директории и поддиректориях
find . -type f -exec sh -c '
    for file do
        # Архивировать каждый файл в ZIP без добавления директорий (-j)
        zip -j "${file}.zip" "${file}" &&
        
        # Удалить оригинальный файл, если архивация прошла успешно
        rm -f "${file}"
    done
' sh {} +

# Вычисляем и сохраняем общий вес всех файлов после архивации
total_size_after=$(du -sh . --exclude='.*' | cut -f1)

# Выводим оба значения
echo "Total size before zipping: $total_size_before"
echo "Total size after zipping: $total_size_after"
