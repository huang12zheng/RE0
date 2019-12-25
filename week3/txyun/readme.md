站内信有 帐号和密码
设置ssh，绑定
设置出入站规则
0. git,source,yum(node) 已经处理了
git config --global user.email "805104533@qq.com"
git config --global user.name "huang12zheng"
cat ~/.ssh/id_rsa.pub
> ~/.ssh/authorized_keys
chown -R ubuntu:ubuntu ~/.ssh
git clone ubuntu@122.51.89.245:/home/ubuntu/build
```bach
#git serve
# client 
ssh-keygen -t rsa -C 'ubuntu'
# coy *.pub to serve ~/.ssh/au...
```
2. Ubuntu 安装 PostgreSQL

```bash
sudo apt-get update
sudo apt-get install postgresql postgresql-client
```
```
netstat -antup | grep 5432
```
```
sudo su postgres
#用postgres登陆
#https://www.cnblogs.com/zhangpengshou/p/5464610.html ubuntu下postgreSQL安装配置
```
```
# https://jingyan.baidu.com/article/3ea51489ec3cb452e71bba52.html
```
3.install node(not nodejs)
> # apt-get update
> # apt-get install wget
> use nvm to a better choose
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
nvm install 
```
# https://github.com/nodesource/distributions/blob/master/README.md
# curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
# sudo apt-get install -y nodejs
```
```bash
#sudo apt-get install gcc g++ make

curl -sL https://deb.nodesource.com/setup_10.16.3 | sudo -E bash -
sudo apt-get install -y nodejs
```
```
su ubuntu
# https://cloud.tencent.com/developer/article/1436876
wget https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.xz
tar -xvf node-v10.16.3-linux-x64.tar.xz
cd node-v10.16.3-linux-x64/bin
pwd
#/home/ubuntu/node-v10.16.3-linux-x64/bin
.node -v
sudo ln /home/ubuntu/node-v10.16.3-linux-x64/bin/node /usr/local/bin/node
sudo ln -s /home/ubuntu/node-v10.16.3-linux-x64/bin/npm /usr/local/bin/npm
# ln would error, can't find npm
pwd
sudo cp /usr/local/bin/node /usr/sbin/
sudo cp /usr/local/bin/npm /usr/sbin/
```
/etc/profile加入

#node（注释）
```
#   export NODE_HOME=/usr/local/src/node-v8.4.0-linux-x64
#   export PATH=$PATH:$NODE_HOME/bin  
#   export NODE_PATH=$NODE_HOME/lib/node_modules 
```
4. 