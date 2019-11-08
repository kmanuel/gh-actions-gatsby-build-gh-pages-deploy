#!/bin/sh


echo '=================== Set git username and email ===================' 
git config --global user.name "Auto Deploy Action"
git config --global user.email "autodeploy@action.com"
echo '=================== Create deploy key to push ===================' 
mkdir /root/.ssh
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa
echo '=================== Install node_modules ==================='
npm install
echo '=================== Build Gatsby Site ==================='
npm run build
echo '=================== Deploy Gatsby Site ==================='
npm run deploy