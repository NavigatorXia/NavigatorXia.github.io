#!/bin/bash
# 一键发布脚本：生成静态文件并推送到 GitHub Pages
# 用法: ./deploy.sh "提交说明"(可选)
set -e
cd "$(dirname "$0")"

npx hexo generate

cd public
if [ ! -d .git ]; then
  git init -b main
  git remote add origin git@github.com:NavigatorXia/NavigatorXia.github.io.git
fi
git add -A
git commit -m "site deploy: ${1:-$(date '+%Y-%m-%d %H:%M:%S')}" --allow-empty -q
git push -u origin main
echo "✅ 发布完成：https://navigatorxia.github.io"
