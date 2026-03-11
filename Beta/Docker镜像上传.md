# Docker 推送镜像

## 1. 标记镜像
 ```sh
docker tag SOURCE_IMAGE[:TAG] harbor.sen.ip-ddns.com/public/REPOSITORY[:TAG]
```

•` SOURCE_IMAGE[:TAG]`：本地已有的镜像名和标签，比如 nginx:latest、myapp:v1。

• `harbor.sen.ip-ddns.com/public/REPOSITORY[:TAG]`：目标仓库地址，其中：

• `public` 是 Harbor 里的项目名（project）；

• `REPOSITORY` 是你要在该项目下创建的镜像仓库名；

• `:TAG` 可选，不写默认为 latest。

示例：
 ```sh
docker tag nginx:latest harbor.sen.ip-ddns.com/public/nginx:latest
```

## 2. 推送镜像
 ```sh
docker push harbor.sen.ip-ddns.com/public/REPOSITORY[:TAG]
```

示例：
 ```sh
docker push harbor.sen.ip-ddns.com/public/nginx:latest
```

## 3. 完整流程示例（测试环境）

 1. 打标签
  ```sh
docker tag nginx:latest harbor.sen.ip-ddns.com/public/nginx:latest
```

 2. 登录 Harbor（首次推送前）
 ```sh
docker login harbor.sen.ip-ddns.com
```

# 输入用户名/密码

3. 推送
 ```sh
docker push harbor.sen.ip-ddns.com/public/nginx:latest
```


