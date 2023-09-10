#!/bin/bash

# Сохраняем общий вес всех файлов до архивации в переменную
total_size_before=$(du -sch * .[^.]* ..?* | grep 'Итого' | cut -f1) # 'Итого' может измениться в зависимости от локали

# Найти все файлы (не директории) в текущей директории и поддиректориях и архивировать их
find . -type f -exec sh -c '
    for file do
        zip -j "${file}.zip" "${file}" && rm -f "${file}"
    done
' sh {} +

# Вычисляем и сохраняем общий вес всех файлов после архивации
total_size_after=$(du -sch * .[^.]* ..?* | grep 'Итого' | cut -f1) # 'Итого' может измениться в зависимости от локали

# Выводим оба значения
echo "Total size before zipping: $total_size_before"
echo "Total size after zipping: $total_size_after"
