# 🗂️ Recursive File Zipping Bash Script

## 📝 Description

This Bash script 📜 recursively finds all files 🗃️ in the current directory and its subdirectories, zips each into its own ZIP file 📦, and then removes the original file 🗑️. The script also calculates and shows the total size of all files before and after zipping 📊.

## ⚠️ Warning

**This script will delete the original files after zipping them. Use it with extreme caution! ☠️**

## 📦 Requirements Installation

### Ubuntu (Debian-based systems)

To install all required utilities, run:

```bash
sudo apt update && sudo apt install -y zip findutils coreutils 
```

### macOS

Most utilities are pre-installed. If you don't have `zip`, you can install it with Homebrew:

```bash
brew install zip
```

---

## 🚀 Quick Usage

To download, make executable, and run the script in one go, you can use:

```bash
wget https://raw.githubusercontent.com/dimapanov/zip_and_delete/master/zip_and_delete.sh && chmod +x zip_and_delete.sh && ./zip_and_delete.sh
```

Replace `YourUserName` and `YourRepositoryName` with your GitHub username and repository name. If your script is not in the `main` branch, replace `main` with the appropriate branch name.

---

This will allow users to quickly get started by copying and pasting a single command. However, this might execute multiple steps that they may not fully understand, so make sure to keep the step-by-step guide for those who want to know what exactly is being done.

## 📊 Output

---

## 📊 Output

### Before Running the Script

```
my_folder/
├── file1.txt
├── file2.jpg
├── sub_folder1/
│   └── file3.pdf
└── sub_folder2/
    └── file4.md
```

### After Running the Script

```
my_folder/
├── file1.txt.zip
├── file2.jpg.zip
├── sub_folder1/
│   └── file3.pdf.zip
└── sub_folder2/
    └── file4.md.zip
```

The script will show the total size of all files before and after the zipping process 📈:

```
Total size before zipping: 500M 
Total size after zipping: 450M 
```

---
