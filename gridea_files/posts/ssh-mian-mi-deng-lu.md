---
title: 'ssh 免密登录'
date: 2022-09-22 17:07:55
tags: [shell]
published: true
hideInList: false
feature: 
isTop: false
---
本机登录服务器免密登录步骤

### 1.在本机上生成公钥
```
ssh-keygen -t rsa
```

### 2.将生成的公钥上传至服务器上
```
scp -p ~/.ssh/id_rsa.pub user@<ip>:~/.ssh/authorized_keys
```

### 3.登录服务器设置权限
```
chmod 600 .ssh/authorized_keys
chmod 700 .ssh
```

### 4.修改ssh配置文件(linux)
为保护文件，需要root权限
```
vi /etc/ssh/sshd_config
```

保证下面三个配置均为`yes`
```
RSAAuthentication yes 
PubkeyAuthentication yes 
AuthorizedKeysFile .ssh/authorized_keys
```

### 5.重启ssh服务
```
sudo service sshd restart
```

现在就可以免密登陆了
