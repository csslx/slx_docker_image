#!/bin/bash

# 确保日志目录存在
mkdir -p "/slxapp/log"
# 定义日志文件路径
LOG_FILE="/slxapp/log/creatapp.log"

# 定义一个带时间戳的日志函数
log() {
    local message="$1"
    # 获取当前时间，格式为 YYYY-MM-DD HH:MM:SS
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    # 将带时间戳的消息追加到日志文件
    echo "[${timestamp}] ${message}" >> "${LOG_FILE}"
}

log "脚本开始执行..."

# 创建应用目录
mkdir -p /slxapp/portainer
log "应用目录创建完成"

# 进入应用目录
cd /slxapp/portainer || { log "无法进入目录 /slxapp/portainer"; exit 1; }

# 拉取配置文件
curl -O https://raw.githubusercontent.com/csslx/slx_docker_image/refs/heads/main/Beta/portainer/docker-compose.yml
if [ $? -eq 0 ]; then
    log "配置文件拉取完成"
else
    log "配置文件拉取失败"
    exit 1
fi

# 启动应用
docker-compose up -d
if [ $? -eq 0 ]; then
    log "应用启动完成"
else
    log "应用启动失败"
    exit 1
fi

log "脚本执行完毕。"