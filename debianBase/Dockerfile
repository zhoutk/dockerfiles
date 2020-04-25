FROM debian:10

RUN set -ex \
    && sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get upgrade --no-install-recommends -y \
    && apt-get install git vim zsh autojump wget openssh-server xz-utils --no-install-recommends -y \
    && mkdir /home/zhoutk/softs -p \
    && mkdir /home/zhoutk/codes -p \
    && mkdir /var/run/sshd \
    && passwd -u root \
    && echo "root:a1b2c3" | chpasswd \
    && sed -ri 's/UsePAM yes/# UsePAM yes/g' /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git /home/zhoutk/.oh-my-zsh 

COPY .zshrc /home/zhoutk/
COPY node-v12.16.2-linux-x64.tar.xz /home/zhoutk/softs/

RUN set -ex \
    && cd /home/zhoutk/softs \
	&& xz -d node-v12.16.2-linux-x64.tar.xz \
	&& tar -xvf node-v12.16.2-linux-x64.tar \
	&& rm node-v12.16.2-linux-x64.tar && mv node-v12.16.2-linux-x64 node \
	&& ln -s /home/zhoutk/softs/node/bin/node /usr/bin \
    && ln -s /home/zhoutk/softs/node/bin/npm /usr/bin \
    && ln -s /home/zhoutk/softs/node/bin/npx /usr/bin \
    && npm -g i yarn \
    && ln -s /home/zhoutk/softs/node/bin/yarn /usr/bin \
    && chsh -s /bin/zsh \
    && sed -i "s/bin\/zsh/home\/zhoutk/g" /etc/passwd

EXPOSE 22 
CMD ["/usr/sbin/sshd", "-D"]