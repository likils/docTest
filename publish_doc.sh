#!/bin/sh

# Uncomment for debugging
#set -x

# Set bash script to exit immediately if any commands fail
set -e

# Настройки
ARCHIVE_PATH="./ExpoFP.doccarchive"
OUTPUT_DIR="./docs"  # Каталог, который будет использовать GitHub Pages
HOSTING_BASE_PATH="/docTest" # Это должен быть путь репозитория

# 1. Удаляем старую документацию
rm -rf "$OUTPUT_DIR"

# 2. Генерация HTML из .doccarchive
xcrun docc process-archive transform-for-static-hosting \
  "$ARCHIVE_PATH" \
  --output-path "$OUTPUT_DIR" \
  --hosting-base-path "$HOSTING_BASE_PATH"

# 3. (Опционально) создаём файл .nojekyll, чтобы GitHub не обрабатывал его как Jekyll-сайт
touch "$OUTPUT_DIR/.nojekyll"

# 4. Готово
echo "✅ Документация экспортирована в $OUTPUT_DIR"
echo "📄 Готово для загрузки на GitHub Pages. Убедитесь, что Pages настроен на /docs"
