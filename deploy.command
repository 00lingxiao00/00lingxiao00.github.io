#!/bin/bash

# 确保在当前文件夹下执行
cd "$(dirname "$0")"

echo "🚀 开始自动打包并推送到数字花园..."

# 1. 打包所有变动
git add .

# 2. 检查是否有可提交内容
if git diff --cached --quiet; then
  echo "ℹ️ 没有检测到可提交的变更，已跳过提交和推送。"
  sleep 2
  exit 0
fi

# 3. 选择提交信息
default_message="Auto deploy: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
echo "请选择提交信息方式："
echo "1) 使用默认命名（时间戳）"
echo "2) 手动输入命名"
read -r -p "输入选项 [1/2]（默认 1）: " commit_choice

case "$commit_choice" in
  2)
    read -r -p "请输入 commit message: " custom_message
    if [ -z "$custom_message" ]; then
      commit_message="$default_message"
      echo "⚠️ 未输入内容，已使用默认命名。"
    else
      commit_message="$custom_message"
    fi
    ;;
  *)
    commit_message="$default_message"
    ;;
esac

git commit -m "$commit_message"

# 4. 推送到 GitHub
git push

echo "✅ 推送完成！你可以去喝口水，准备刷新网页了。"

# 停留 3 秒后自动关闭窗口（或者你可以删掉这行，手动关窗口）
sleep 3
