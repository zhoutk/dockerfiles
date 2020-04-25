FROM debian:10

RUN set -ex \
    && sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get upgrade --no-install-recommends -y \
    && apt-get install openssh-server vim git zsh autojump --no-install-recommends -y \
    && passwd -u root \
    && mkdir /home/zhoutk/softs -p \
    && mkdir /home/zhoutk/codes -p \
    && sed -ri 's/UsePAM yes/# UsePAM yes/g' /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && mkdir /run/sshd \
    && echo "root:a1b2c3" | chpasswd 

COPY .zshrc /home/zhoutk/
ADD ohmyzsh.tar.gz /home/zhoutk/

RUN set -ex \
    && chsh -s /bin/zsh \
    && sed -i "s/root\:\/root/root\:\/home\/zhoutk/g" /etc/passwd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]