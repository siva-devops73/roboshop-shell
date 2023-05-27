echo -e "\e[35mInstall Maven\e[0m"
yum install maven -y  &>>/tmp/roboshop.log

echo -e "\e[35mAdd Application User\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[35mCreate Application Directory\e[0m"
rm -rf /app  &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[35mDownload Application Content\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip  &>>/tmp/roboshop.log

echo -e "\e[35mExtract Application Content\e[0m"
cd /app  &>>/tmp/roboshop.log
unzip /tmp/shipping.zip  &>>/tmp/roboshop.log

echo -e "\e[35mDownload Maven Dependencies\e[0m"
cd /app  &>>/tmp/roboshop.log
mvn clean package  &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar  &>>/tmp/roboshop.log

echo -e "\e[35mInstall MySQL Client\e[0m"
yum install mysql -y  &>>/tmp/roboshop.log

echo -e "\e[35mLoad Schema\e[0m"
mysql -h mysql-dev.devops73.store -uroot -pRoboShop@1 < /app/schema/shipping.sql   &>>/tmp/roboshop.log

echo -e "\e[35mSetup SystemD File\e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service  &>>/tmp/roboshop.log

echo -e "\e[35mStart Shipping Service\e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable shipping  &>>/tmp/roboshop.log
systemctl restart shipping  &>>/tmp/roboshop.log
