#!/bin/bash

# 使用xcolor来选择颜色
CMD="xcolor --format hex --selection clipboard"

# 执行xcolor并捕获输出
COLOR=$($CMD)

# 检查命令是否成功
if [ $? -eq 0 ]; then
  # 使用notify-send显示通知
  notify-send "Color Picked" "The selected color is: $COLOR"
else
  notify-send "Error" "Failed to pick a color."
fi

# 确保等待进程结束（可选）
wait
