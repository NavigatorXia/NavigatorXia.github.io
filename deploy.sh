#!/bin/bash
# One-command publish: build the static site and push it to GitHub Pages.
# Usage: ./deploy.sh "commit message" (optional)
#
# Note: public/ is build output and `hexo clean` wipes it (including its .git).
# So we rebuild the repo and force-push the site branch — the branch always
# mirrors the latest build.
set -e
cd "$(dirname "$0")"

npx hexo generate

cd public
rm -rf .git
git init -b main -q
git remote add origin git@github.com:NavigatorXia/NavigatorXia.github.io.git
git add -A
git commit -q -m "site deploy: ${1:-$(date '+%Y-%m-%d %H:%M:%S')}"
git push -f -q origin main
echo "Done: https://navigatorxia.github.io"
