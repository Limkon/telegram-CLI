#!/bin/bash
set -e

echo "[1/5] 安装路径：~/TelegramCLI"
cd ~
git clone --recursive https://github.com/vysheng/tg.git TelegramCLI
cd TelegramCLI

echo "[2/5] 安装依赖（跳过 sudo，只提示）"
echo "你必须先确保系统安装了以下依赖："
echo "libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make gcc git"
echo "如果没有，请联系管理员或在编译失败时使用 --static 模式手动编译"

echo "[3/5] 开始 configure"
./configure --prefix=$HOME/TelegramCLI/build || true

echo "[4/5] 开始 make 编译，可能需要几分钟..."
make

echo "[5/5] 编译完成，Telegram CLI 可执行文件位置："
echo "~/TelegramCLI/bin/telegram-cli"
echo ""
echo "运行命令："
echo "./bin/telegram-cli -k tg-server.pub"
