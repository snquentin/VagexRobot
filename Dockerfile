# VagexRobot.AllInOne

FROM ubuntu:14.04.3
MAINTAINER snquentin <snquentin@msn.com>

RUN apt-get update && \
apt-get clean  && \
#apt-get install -y php php5-cli curl libcurl3 libcurl3-dev php5-curl screen -y && \
apt-get install -y php5-cli curl libcurl3 libcurl3-dev php5-curl screen -y && \
apt-get clean

#~/php-fpm$ docker pull php:5.6-fpm
#http://www.runoob.com/docker/docker-install-php.html

RUN wget https://raw.githubusercontent.com/WangCharlie/Vagex-For-CentOS-6/master/VagexRobot.AllInOne.php
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
RUN screen -dmS vagex php /root/VagexRobot.AllInOne.php
RUN (crontab -u root -l; echo "@daily screen -X -S vagex quit; screen -dmS vagex php VagexRobot.AllInOne.php" ) | crontab -u root -l
RUN php VagexRobot.AllInOne.php