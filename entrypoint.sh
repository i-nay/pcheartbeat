#!/bin/sh
set -e

# 源切换
case ${MIRRORS} in
"custom")
  # custom
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-自定义克隆链接 ${Font} \n ======== \n"
  git remote set-url origin ${CUSTOM_CLONE_URL}
  ;;
"0")
  # https://github.com/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-github.com ${Font} \n ======== \n"
  git remote set-url origin https://github.com/lkeme/bilibili-pcheartbeat.git
  ;;
"1")
  # https://ghproxy.com/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-ghproxy.com ${Font} \n ======== \n"
  git remote set-url origin https://ghproxy.com/https://github.com/lkeme/bilibili-pcheartbeat.git
  ;;
"2")
  # http://fastgit.org/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-hub.fastgit.xyz ${Font} \n ======== \n"
  git remote set-url origin https://hub.fastgit.xyz/lkeme/bilibili-pcheartbeat.git
  ;;
"3")
  # https://hub.gitfast.tk/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-hub.gitfast.tk ${Font} \n ======== \n"
  git remote set-url origin https://hub.gitfast.tk/lkeme/bilibili-pcheartbeat.git
  ;;
"4")
  # https://hub.gitslow.tk/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-hub.gitslow.tk ${Font} \n ======== \n"
  git remote set-url origin https://hub.gitslow.tk/lkeme/bilibili-pcheartbeat.git
  ;;
"5")
  # https://hub.verge.tk/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-hub.verge.tk ${Font} \n ======== \n"
  git remote set-url origin https://hub.verge.tk/lkeme/bilibili-pcheartbeat.git
  ;;
"6")
  # https://gh.api.99988866.xyz/
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-gh.api.99988866.xyz ${Font} \n ======== \n"
  git remote set-url origin https://gh.api.99988866.xyz/https://github.com/lkeme/bilibili-pcheartbeat.git
  ;;
*)
  echo -e "\n ======== \n ${Info} ${GreenBG} 切换源-github.com ${Font} \n ======== \n"
  git remote set-url origin https://github.com/lkeme/bilibili-pcheartbeat.git
  ;;
esac

# 拉取更新
echo -e "\n ======== \n ${Info} ${GreenBG} 正使用 git pull 同步项目 ${Font} \n ======== \n"
git pull

# 安装依赖
echo -e "\n ======== \n ${Info} ${GreenBG} 安装/更新 项目运行依赖 ${Font} \n ======== \n"
npm install
echo -e "\n \n \n \n"

# 启动
[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -O nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY}
node app.js
