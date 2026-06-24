#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p assets/images assets/icons assets/translations

if [ ! -d android ]; then
  flutter create gato --platforms android,ios,linux --org com.gatokaraku >/dev/null
  rm -rf gato/test
  rsync -a --delete ./gato/ ./
  rm -rf ./gato
fi

cp -f .env.example .env || true
flutter pub get
dart run build_runner build --delete-conflicting-outputs

flutter run
