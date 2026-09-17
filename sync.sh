#!/bin/bash
# 时光集 · 成长相册 —— 一键同步到 GitHub
# 用法：本地验证通过后，运行 ./sync.sh，按提示填写更新说明
set -e
cd "$(dirname "$0")"

echo "== 时光集 · 同步脚本 =="
echo "--- 当前更改 ---"
git status --short

if [ -z "$(git status --porcelain)" ]; then
  echo "没有需要同步的更改，已是最新。"
  exit 0
fi

read -rp "本次更新说明（将写入提交信息，例如：v0.3 新增豆沙粉主题）: " msg
if [ -z "$msg" ]; then
  echo "未填写更新说明，已取消。"
  exit 1
fi

git add -A
git commit -m "$msg"
git push

echo ""
echo "已同步到 GitHub ✓"
echo "提醒：重要改动请同步在 CHANGELOG.md 中追加记录。"
