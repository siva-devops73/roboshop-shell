echo -e "\e[35mCopy Mongo repo file\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[35mInstalling MongoDB Server\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[35mUpdating MongoDB Listen Address\e[0m"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf  &>>/tmp/roboshop.log


echo -e "\e[35mStart MongoDB Server\e[0m"
systemctl enable mongod   &>>/tmp/roboshop.log
systemctl restart mongod  &>>/tmp/roboshop.log