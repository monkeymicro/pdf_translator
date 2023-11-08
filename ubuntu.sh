#!/bin/bash

# chmod +x ubuntu.sh
# then ./ubuntu.sh
sudo apt-get update
sudo apt-get install -y libgl1-mesa-glx
pip install paddlepaddle
pip install opencv-python
pip install PyMuPDF pytesseract pillow
pip install matplotlib

# 使用lspci命令检查是否存在GPU
lspci | grep -i 'VGA\|3D\|2D controller' > /dev/null

if [ $? -eq 0 ]; then
    # 存在GPU
    gpu=1
    # GPU
    python3 -m pip install paddlepaddle-gpu -i https://mirror.baidu.com/pypi/simple
else
    # 不存在GPU
    gpu=0
    # CPU
    python3 -m pip install paddlepaddle -i https://mirror.baidu.com/pypi/simple
fi

echo "gpu=$a"

pip install "paddleocr>=2.0.1" # 推荐使用2.0.1+版本



