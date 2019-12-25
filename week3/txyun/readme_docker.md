站内信有 帐号和密码
设置ssh，绑定
设置出入站规则
0. git,source,yum(node) 已经处理了
1. 安装docker
直接腾讯docker镜像 Ubuntu 14.04LST
```
#sudo apt-get update
#sudo apt-get install aptitude
#sudo apt-get install docker.io
curl -sSL https://get.daocloud.io/docker | sh # 不是最新的
```
---
+ docker-compose
https://docs.docker.com/compose/install/
```bash
# sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

2. 安装 PostgreSQL
<!-- 3. nvm -->
4. prisma2

