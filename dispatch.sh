echo -e "\e[35mInstall Golang\e[0m"
yum install golang -y  &>>/tmp/roboshop.log

echo -e "\e[35mAdd Application User\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[35mCreate Application Content\e[0m"
rm -rf /app  &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[35mDownload Application Dependencies\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mExtract Application Content\e[0m"
unzip /tmp/dispatch.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log

echo -e "\e[35mInstall Application Dependencies\e[0m"
go mod init dispatch  &>>/tmp/roboshop.log
go get  &>>/tmp/roboshop.log
go build  &>>/tmp/roboshop.log

echo -e "\e[35mSetup SystemD Dispatch File\e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service  &>>/tmp/roboshop.log

echo -e "\e[35mStart Dispatch Service\e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable dispatch  &>>/tmp/roboshop.log
systemctl restart dispatch  &>>/tmp/roboshop.log