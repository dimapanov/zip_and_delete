#!/bin/bash

# Получаем список всех файлов в текущей директории и поддиректориях
all_files=$(find . -type f)

# Считаем общий размер всех файлов до архивации
total_size_before=0
for file in $all_files; do
    size=$(stat -c %s "$file")
    total_size_before=$((total_size_before + size))
done
total_size_before=$(numfmt --to=iec $total_size_before)

# Архивация всех файлов
find . -type f -exec sh -c '
    for file do
        zip -j "${file}.zip" "${file}" && rm -f "${file}"
    done
' sh {} +

# Получаем список всех файлов в текущей директории и поддиректориях после архивации
all_files=$(find . -type f)

# Считаем общий размер всех файлов после архивации
total_size_after=0
for file in $all_files; do
    size=$(stat -c %s "$file")
    total_size_after=$((total_size_after + size))
done
total_size_after=$(numfmt --to=iec $total_size_after)

# Выводим результаты
echo "Total size before zipping: $total_size_before"
echo "Total size after zipping: $total_size_after"
