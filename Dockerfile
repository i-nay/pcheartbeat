FROM node:alpine

#MAINTAINER zsnmwy <szlszl35622@gmail.com>
LABEL AUTHOR = "Lkeme <Useri@live.cn>"

ENV REPO_URL='https://github.com/' \
    CUSTOM_CLONE_URL='https://github.com/lkeme/bilibili-pcheartbeat.git' \
    MIRRORS="0" \
    Green="\\033[32m" \
    Red="\\033[31m" \
    GreenBG="\\033[42;37m" \
    RedBG="\\033[41;37m" \
    Font="\\033[0m" \
    Green_font_prefix="\\033[32m" \
    Green_background_prefix="\\033[42;37m" \
    Font_color_suffix="\\033[0m" \
    Info="${Green}[信息]${Font}" \
    OK="${Green}[OK]${Font}" \
    Error="${Red}[错误]${Font}"

WORKDIR /api

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

#RUN if [ "${CN}" = true ]; then export REPO_URL="https://github.com.cnpmjs.org"; fi

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

RUN apk add --no-cache git bash curl wget unzip && \
    git clone ${REPO_URL}lkeme/bilibili-pcheartbeat.git --depth=1 /api && \
    chmod 777 /usr/local/bin/entrypoint.sh && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man

ENTRYPOINT ["entrypoint.sh"]
