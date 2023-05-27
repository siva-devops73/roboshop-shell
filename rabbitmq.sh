echo -e "\e[35mConfigure Erlang Repos\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash  &>>/tmp/roboshop.log

echo -e "\e[35mConfigure RabbitMQ Repos\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash  &>>/tmp/roboshop.log

echo -e "\e[35mInstall RabbitMQ Server\e[0m"
yum install rabbitmq-server -y  &>>/tmp/roboshop.log

echo -e "\e[35mStart RabbitMQ Service\e[0m"
systemctl enable rabbitmq-server  &>>/tmp/roboshop.log
systemctl restart rabbitmq-server  &>>/tmp/roboshop.log

echo -e "\e[35mAdd RabbitMQ Application User\e[0m"
rabbitmqctl add_user roboshop roboshop123  &>>/tmp/roboshop.log
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"  &>>/tmp/roboshop.log