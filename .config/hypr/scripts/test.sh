#!/bin/bash

# 默认选项
FORMAT="rgb"
FANCY="yes"
AUTOCOPY="no"
RENDER_INACTIVE="no"
ZOOM="yes"

# 解析命令行参数
while [[ "$#" -gt 0 ]]; do
  case $1 in
  -f | --format)
    FORMAT="$2"
    shift
    ;;
  --format=*) FORMAT="${1#*=}" ;;
  -n | --no-fancy) FANCY="no" ;;
  -a | --autocopy) AUTOCOPY="yes" ;;
  -r | --render-inactive) RENDER_INACTIVE="yes" ;;
  -z | --no-zoom) ZOOM="no" ;;
  -h | --help)
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -f | --format=[fmt]         Specifies the output format (cmyk, hex, rgb, hsl, hsv)"
    echo "  -n | --no-fancy             Disables the 'fancy' (colored) output"
    echo "  -a | --autocopy             Automatically copies the output to the clipboard (requires wl-clipboard)"
    echo "  -r | --render-inactive      Render (freeze) inactive displays too"
    echo "  -z | --no-zoom              Disable the zoom lens"
    echo "  -h | --help                 Prints this help message"
    exit 0
    ;;
  *)
    echo "Unknown parameter passed: $1"
    exit 1
    ;;
  esac
  shift
done

# 构建hyprpicker命令
CMD="hyprpicker --format=$FORMAT"
[[ "$FANCY" == "no" ]] && CMD="$CMD --no-fancy"
[[ "$AUTOCOPY" == "yes" ]] && CMD="$CMD --autocopy"
[[ "$RENDER_INACTIVE" == "yes" ]] && CMD="$CMD --render-inactive"
[[ "$ZOOM" == "no" ]] && CMD="$CMD --no-zoom"

# 执行hyprpicker并捕获输出
COLOR=$($CMD)

# 使用notify-send显示通知
if [ $? -eq 0 ]; then
  notify-send "Color Picked" "The selected color is: $COLOR"
else
  notify-send "Error" "Failed to pick a color."
fi
