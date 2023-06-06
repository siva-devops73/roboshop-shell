source common.sh

echo -e "${color} Copy Mongo repo file ${nocolor}"
cp mongo.repo /etc/yum.repos.d/mongo.repo  &>>${log_file}
stat_check $?

echo -e "${color} Installing MongoDB Server ${nocolor}"
yum install mongodb-org -y  &>>${log_file}
stat_check $?

echo -e "${color} Updating MongoDB Listen Address ${nocolor}"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf  &>>${log_file}
stat_check $?

echo -e "${color} Start MongoDB Server ${nocolor}"
systemctl enable mongod   &>>${log_file}
systemctl restart mongod  &>>${log_file}
stat_check $?