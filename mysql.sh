echo -e "\e[35mDisable MySQL Default Version\e[0m"
yum module disable mysql -y  &>>/tmp/roboshop.log

echo -e "\e[35mDisable MySQL Default Version\e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo   &>>/tmp/roboshop.log

echo -e "\e[35mInstall MySQL Community Server\e[0m"
yum install mysql-community-server -y  &>>/tmp/roboshop.log

echo -e "\e[35mStart MySQL Service\e[0m"
systemctl enable mysqld  &>>/tmp/roboshop.log
systemctl start mysqld  &>>/tmp/roboshop.log

echo -e "\e[35mSetup MySQL Password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1  &>>/tmp/roboshop.log