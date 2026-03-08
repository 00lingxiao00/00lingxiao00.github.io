#!/bin/bash

# 确保在当前文件夹下执行
cd "$(dirname "$0")"

echo "🚀 开始自动打包并推送到数字花园..."

# 1. 打包所有变动
git add .

# 2. 自动生成带时间戳的提交信息
git commit -m "Auto deploy: $(date '+%Y-%m-%d %H:%M:%S')"

# 3. 推送到 GitHub
git push

echo "✅ 推送完成！你可以去喝口水，准备刷新网页了。"

# 停留 3 秒后自动关闭窗口（或者你可以删掉这行，手动关窗口）
sleep 3