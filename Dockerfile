# VagexRobot.AllInOne

FROM centos:6.7
MAINTAINER snquentin <snquentin@msn.com>

#pull kinogmt/centos-ssh
RUN yum update -y && \
#yum clean  && \
yum install wget php php5-cli curl libcurl3 libcurl3-dev php5-curl screen -y
# && \
#yum install gcc gcc-c++ autoconf vixie-cron -y && \
#yum install gcc gcc-c++ autoconf crontab -y
#yum clean

RUN wget https://raw.githubusercontent.com/snquentin/Vagex-For-CentOS-6/master/VagexRobot.AllInOne.php

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN screen -dmS vagex php /root/VagexRobot.AllInOne.php
#RUN (crontab -u root -l; echo "@daily screen -X -S vagex quit; screen -dmS vagex php VagexRobot.AllInOne.php" ) | crontab -u root -l
#RUN (crontab -l; echo "@daily screen -X -S vagex quit; screen -dmS vagex php VagexRobot.AllInOne.php" ) | crontab -l

RUN php VagexRobot.AllInOne.php