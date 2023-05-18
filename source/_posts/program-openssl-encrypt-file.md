---
title: 心跳检测遗书的思路
date: 2023-05-18 11:43:56
tags:
    - openssl
    - ssh
---
openssl encrypt and decrypt large file
**人活得还好好的**
<!-- toc -->

# TODO

# 背景
过去几年，听闻好多个30多岁的程序员大佬突然离去，虽然现在工作环境已经很安逸，但是考虑到过去几年透支的身体，还是感觉要定时回顾一下自己的一生，留下点自己的感悟和遗言。   
遗言嘛，能说实话还是说实话，但是为了避免人还活着，但已经社死，考虑结合加密算法和github action来定时检测自己是否活着，如果自己的github超过一段时间没有更新，就把遗言解密用邮件发给家人吧。

# 实现思路
一步步的实现，后续慢慢补充吧

1. 非对称机密日常遗言
2. 推送github repo
3. Github actions 心跳检测是否存活
4. 超时解密发送亲朋好友

# 技术细节探究
## 非对称加密
非对称加密的优势就是加密时使用公钥，解密时可以使用私钥，二者可以分开保存，安全性更高。   
密钥默认就有ssh-keygen 生成的密钥对吧，方便日常书写，也方便Repo推送， 工具就使用openssl吧，后期结合git hooks，用python实现一个自动化的工具，避免把未加密的遗言推送到repo过早社死
### 转换SSH KEY
因为SSH KEY默认已经是SSH2-formated，无法直接被openssl直接识别，需要转换成格式
#### 私钥转换
```bash
ssh-keygen -p -m PKCS8  -f ssh/id_rsa 
```
#### 公钥转换

```bash
ssh-keygen -e -f ssh/id_rsa.pub -m PKCS8 > id_rsa.pub.pkcs8
```
后续使用openssl时，使用的公钥就是id_rsa.pub.pkcs8

## 加解密小文件
对于普通小文件，可以直接使用openssl加密
```bash
#enc
openssl pkeyutl -encrypt -pubin -inkey ${PUBKEY} -in ${ORIGIN_FILE} -out ${ENC_OUT}
#dec
openssl pkeyutl -decrypt -inkey ${SSH_KEY}  -in ${ENC_OUT}  -out ${DEC_OUT}
```
## 加解密大文件
对于大文件，一般不适用公私钥直接进行加解密，实现流程如下：

1. **加密** => 生成随机密码文件
2. **加密** => 使用公钥加密随机密码文件
3. **加密** => 使用随机密码文件加密目标文件
4. ========== 按需求保存或者发送**加密后的随机密码和加密后的目标文件**
5. **解密** <= 使用私钥解密加密后的随机密码文件，还原出密码
6. **解密** <= 使用密码文件还原目标文件

### 生成随机密码文件
```bash 
openssl rand -base64 256 > key.bin
```

### 加密密码文件
```bash
openssl pkeyutl -encrypt -pubin -inkey ${PUBKEY} -in ${RAND_KEY} -out ${RAND_KEY_ENC}
```
### 使用密码文件加密目标文件
```bash
openssl enc -aes-256-cbc -salt -pbkdf2 -in ${ORI_IN} -out ${ENC_OUT}  -pass file:${RAND_KEY}
```

### 解密加密后的密码文件
```bash
openssl pkeyutl -decrypt -inkey ${SSH_KEY}  -in ${RAND_KEY_ENC}  -out ${RAND_KEY_DEC}
```

### 使用密码文件恢复加密后的目标文件
```bash
openssl enc  -d -aes-256-cbc -pbkdf2 -in ${ENC_OUT} -out ${DEC_OUT} -pass file:${RAND_KEY_DEC}
```

### Show me the whole shit
```bash
#!/bin/bash
set -x -e

SSH_KEY=ssh/id_rsa
SSH_KEY_PUB=${SSH_KEY}.pub
ORI_IN=origin.md
ENC_OUT=origin.md.encrypted
DEC_OUT=origin.md.decrypted
PUBKEY=pub.pkcs8
RAND_KEY=key.bin
RAND_KEY_ENC=key.bin.encrypted
RAND_KEY_DEC=key.bin.decrypted

echo "Get rsakey PKCS8 PUB KEY"
ssh-keygen -e -f ${SSH_KEY_PUB} -m PKCS8 > ${PUBKEY}
echo "Generate a 256 bit(32 bytes) random key"
openssl rand -base64 256 > key.bin
#cat  ${PUBKEY}
echo "Start encrypt"
md5sum ${ORI_IN}
echo "Encrypt key file"
openssl pkeyutl -encrypt -pubin -inkey ${PUBKEY} -in ${RAND_KEY} -out ${RAND_KEY_ENC}
echo "Encryot our file"
#openssl pkeyutl -encrypt -pubin -inkey ${PUBKEY} -in ${ORI_IN} -out ${ENC_OUT}
openssl enc -aes-256-cbc -salt -pbkdf2 -in ${ORI_IN} -out ${ENC_OUT}  -pass file:${RAND_KEY}

echo "Start Decrypt"
echo "Decrypt key file"
openssl pkeyutl -decrypt -inkey ${SSH_KEY}  -in ${RAND_KEY_ENC}  -out ${RAND_KEY_DEC}
echo "Decrypt file"
openssl enc  -d -aes-256-cbc -pbkdf2 -in ${ENC_OUT} -out ${DEC_OUT} -pass file:${RAND_KEY_DEC}
```

## Github actions 支持
### 调用repo secret解密

可以将私钥保存到github repo的secret环境中，在github action调用私钥解密即可，就可以对文本进行解密
### 通过email发送解密后的文件

## full code 
on the way 