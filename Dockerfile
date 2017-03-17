# VagexRobot.AllInOne

FROM ubuntu:14.04.3
MAINTAINER snquentin <snquentin@msn.com>

RUN apt-get update && \
apt-get clean  && \
apt-get install -y install php php5-cli curl libcurl3 libcurl3-dev php5-curl screen -y && \
apt-get clean

RUN wget https://raw.githubusercontent.com/WangCharlie/Vagex-For-CentOS-6/master/VagexRobot.AllInOne.php
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
RUN screen -dmS vagex php /root/VagexRobot.AllInOne.php
RUN (crontab -u root -l; echo "@daily screen -X -S vagex quit; screen -dmS vagex php VagexRobot.AllInOne.php" ) | crontab -u root -l
RUN php VagexRobot.AllInOne.php