echo -e "\e[35mConfiguring NodeJS Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

echo -e "\e[35mInstall NodeJS\e[0m"
yum install nodejs -y  &>>/tmp/roboshop.log

echo -e "\e[35mAdd Application User\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[35mCreate Application Directory\e[0m"
rm -rf/app  &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[35mDownload Application Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mExtract Application Content\e[0m"
unzip /tmp/catalogue.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mInstall NodeJS Dependencies\e[0m"
npm install  &>>/tmp/roboshop.log

echo -e "\e[35mSetup Systemd Service\e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service  &>>/tmp/roboshop.log

echo -e "\e[35mStart Catalogue Service\e[0m"
systemctl daemon-reload   &>>/tmp/roboshop.log
systemctl enable catalogue  &>>/tmp/roboshop.log
systemctl restart catalogue  &>>/tmp/roboshop.log

echo -e "\e[35mCopy Mongo Repo file\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[35mInstall MongoDB Client\e[0m"
yum install mongodb-org-shell -y  &>>/tmp/roboshop.log

echo -e "\e[35mLoad Schema\e[0m"
mongo --host mongodb-dev.devops73.store </app/schema/catalogue.js  &>>/tmp/roboshop.log