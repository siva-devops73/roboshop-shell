echo -e "\e[35mInstalling Nginx Server\e[0m"
yum install nginx -y  &>>/tmp/roboshop.log

echo -e "\e[35mRemoving Old App Content\e[0m"
rm -rf /usr/share/nginx/html/*  &>>/tmp/roboshop.log

echo -e "\e[35mDownloading Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>/tmp/roboshop.log

echo -e "\e[35mExtract Frontend Content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip  &>>/tmp/roboshop.log

echo -e "\e[35mStarting Frontend Server\e[0m"
systemctl enable nginx  &>>/tmp/roboshop.log
systemctl restart nginx  &>>/tmp/roboshop.log