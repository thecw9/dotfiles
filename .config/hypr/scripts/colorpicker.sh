#!/bin/bash

CMD="hyprpicker --autocopy"

# 执行hyprpicker并捕获输出
COLOR=$($CMD)

# 检查命令是否成功
if [ $? -eq 0 ]; then
  # 使用notify-send显示通知
  notify-send "Color Picked" "The selected color is: $COLOR"
else
  notify-send "Error" "Failed to pick a color."
fi
