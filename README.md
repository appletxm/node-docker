## 用nodejs创建https服务器

###创建证书
```
mkdir certificate
cd certificate
openssl

genrsa -out private.pem 2048
req -new -key private.pem -out csr.pem
....

x509 -req  -in csr.pem -signkey private.pem -out csr.crt
```

###创建证书二
```
openssl genrsa -out ca.key 1024  
//这里是CA生成的私钥，文件名为ca.key  
openssl req -new -key ca.key -out ca.csr  
//这里是CA通过自己的私钥生成CSR文件，文件名为ca.csr  
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt  
//这里是通过把CA的csr文件用私钥进行签名，最后生成一个证书的过程，证书名字为ca.crt 
```


###docker
1、在Windows的系统环境添加MACHINE_STORAGE_PATH ，指向虚拟机的位置（我推荐D:\VM\machines）
2、复制boot2docker.iso到虚拟机的位置同级目录cache上（D:\VM\cache），如果不是最新的话需要下载最新。
3、default machine with IP 192.168.99.100  docker/tcuser

docker-machine ssh default
docker push 注册用户名/镜像名