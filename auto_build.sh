#!/bin/bash

ROOT="/home/Herman/myblog/myblog"
LOG_FILE="$ROOT/logs/update.log"

# 将当前时间戳写入日志文件
echo "[$(date)] Checking for updates..." >> $LOG_FILE

cd "$ROOT"

remote_hash=$(git ls-remote https://github.com/HYBB-rash/Blog.git -h refs/heads/master | awk '{print $1}')
local_hash=$(git rev-parse HEAD)

echo "[$(date)] Remote hash $remote_hash. Local hash $local_hash." >> $LOG_FILE

if [ "$remote_hash" != "$local_hash" ]; then

    echo "[$(date)] Update found. Pulling changes and generating..." >> $LOG_FILE

    # 从 GitHub 拉取代码更新
    git pull github master >> $LOG_FILE 2>&1

    npm install >> $LOG_FILE 2>&1

    # 执行 hexo generate
    hexo generate >> $LOG_FILE 2>&1

    echo "[$(date)] Update and generation completed." >> $LOG_FILE
else
    echo "[$(date)] No updates found." >> $LOG_FILE
fi

echo "[$(date)] .........................................................................................................." >> $LOG_FILE

