echo -e "\e[34mInstalling Nginx Server\e[0m"
yum install nginx -y  &>>/tmp/roboshop.log

echo -e "\e[34mRemoving Old App Content\e[0m"
rm -rf /usr/share/nginx/html/*  &>>/tmp/roboshop.log

echo -e "\e[34mDownloading Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>/tmp/roboshop.log

echo -e "\e[34mExtract Frontend Content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip  &>>/tmp/roboshop.log

echo -e "\e[34mStarting Frontend Server\e[0m"
systemctl enable nginx  &>>/tmp/roboshop.log
systemctl restart nginx  &>>/tmp/roboshop.log