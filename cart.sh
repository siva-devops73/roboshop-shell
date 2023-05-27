echo -e "\e[35mConfiguring NodeJS Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

echo -e "\e[35mInstall NodeJS\e[0m"
yum install nodejs -y  &>>/tmp/roboshop.log

echo -e "\e[35mAdd Application User\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[35mCreate Application Directory\e[0m"
rm -rf /app  &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[35mDownload Application Content\e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mExtract Application Content\e[0m"
unzip /tmp/cart.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mInstall NodeJS Dependencies\e[0m"
npm install  &>>/tmp/roboshop.log

echo -e "\e[35mSetup Systemd Service\e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service  &>>/tmp/roboshop.log

echo -e "\e[35mStart cart Service\e[0m"
systemctl daemon-reload   &>>/tmp/roboshop.log
systemctl enable cart  &>>/tmp/roboshop.log
systemctl restart cart  &>>/tmp/roboshop.log

