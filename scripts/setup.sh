#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo '1) Creating local project scaffold...'
flutter create gato --platforms android,ios,linux --org com.gatokaraku
rm -rf gato/test

echo '2) Copy architecture files...'
cp -f pubspec.yaml gato/pubspec.yaml
cp -f .env.example gato/.env.example
cp -f analysis_options.yaml gato/analysis_options.yaml
cp -rf lib gato/lib
cp -rf .github gato/.github || true
cp -f README.md gato/README.md
cp -f ARCHITECTURE.md gato/ARCHITECTURE.md
cp -rf assets gato/assets || true

echo '3) Enter project folder'
cd gato

echo '4) Make local changes permanent in .gitignore'
cat >> .gitignore <<'EOF'
assets/images/dummy.png
assets/icons/dummy.png
.env
EOF

echo '5) Initialize git and push'
git init
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/<USER_OR_ORG>/gato.git

git add .
git commit -m "chore: bootstrap GATO MVP repository"
git branch -M main
git push -u origin main
echo "gato initialized"
