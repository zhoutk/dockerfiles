FROM ubuntu:18.04

RUN set -ex \
    && sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get upgrade -y \
    && apt-get install apt-utils iputils-ping net-tools procps xz-utils -y \
    && apt-get install openssh-server vim git zsh autojump wget -y \
    && sed -i "s/without-password/yes/g" /etc/ssh/sshd_config \
    && passwd -u root \
    && cd /home && mkdir -p zhoutk/softs && cd zhoutk/softs \
    && wget https://nodejs.org/dist/v12.16.2/node-v12.16.2-linux-x64.tar.xz \
    && xz -d node-v12.16.2-linux-x64.tar.xz \
    && tar -xvf node-v12.16.2-linux-x64.tar \
    && rm node-v12.16.2-linux-x64.tar \
    && mv node-v12.16.2-linux-x64 node \
    && ln -s /home/zhoutk/softs/node/bin/node /usr/bin \
    && ln -s /home/zhoutk/softs/node/bin/npm /usr/bin \
    && ln -s /home/zhoutk/softs/node/bin/npx /usr/bin \
    && npm -g i yarn \
    && ln -s /home/zhoutk/softs/node/bin/yarn /usr/bin \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && mkdir /run/sshd \
    && echo "root:a1b2c3" | chpasswd 

EXPOSE 22 3000

CMD ["/usr/sbin/sshd -D"]