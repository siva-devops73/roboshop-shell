source common.sh
component=catalogue

nodejs

echo -e "${color} Copy Mongo Repo file ${nocolor}"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo  &>>${log_file}

echo -e "${color} Install MongoDB Client ${nocolor}"
yum install mongodb-org-shell -y  &>>${log_file}

echo -e "${color} Load Schema ${nocolor}"
mongo --host mongodb-dev.devops73.store <${app_path}/schema/${component}.js  &>>${log_file}