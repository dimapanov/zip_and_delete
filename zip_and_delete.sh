#!/bin/bash

# Save the total size of all files in the current directory before zipping into a variable
total_size_before=$(du -sh . --exclude='.*' | cut -f1)

# Find all files (not directories) in the current directory and subdirectories
find . -type f -exec sh -c '
    for file do
        # Zip each file without including directory structure (-j) and
        # remove the original file if zipping was successful
        zip -j "${file}.zip" "${file}" && rm -f "${file}"
    done
' sh {} +

# Calculate and save the total size of all files in the current directory after zipping
total_size_after=$(du -sh . --exclude='.*' | cut -f1)

# Output both values
echo "Total size before zipping: $total_size_before"
echo "Total size after zipping: $total_size_after"
