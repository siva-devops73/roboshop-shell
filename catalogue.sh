echo -e "\e[35mConfiguring NodeJS Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[35mInstall NodeJS\e[0m"
yum install nodejs -y

echo -e "\e[35mAdd Application User\e[0m"
useradd roboshop

echo -e "\e[35mCreate Application Directory\e[0m"
rm -rf/app
mkdir /app

echo -e "\e[35mDownload Application Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[35mExtract Application Content\e[0m"
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[35mInstall NodeJS Dependencies\e[0m"
npm install

echo -e "\e[35mSetup Systemd Service\e[0m"
cp /home/centos/roboshop-shell/catalogue service /etc/systemd/system/catalogue.service

echo -e "\e[35mStart Catalogue Service\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

echo -e "\e[35mCopy Mongo Repo file\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[35mInstall MongoDB Client\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[35mLoad Schema\e[0m"
mongo --host mongodb-dev.devops73.store </app/schema/catalogue.js