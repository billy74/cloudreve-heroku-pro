FROM redis:6.0.8-buster
RUN apt update
RUN apt install redis-server git python3-pip screen unzip -y
WORKDIR /root/cloudreve
ADD cloudreve ./cloudreve
ADD conf.ini ./conf.ini
ADD cloudreve.db ./cloudreve.db
ADD run.sh ./run.sh
ADD key.bin ./key.bin

RUN chmod +x ./cloudreve
RUN chmod +x ./run.sh

WORKDIR /root/faka
ADD faka.zip ./faka.zip
RUN unzip faka.zip
RUN chmod +x main.py
WORKDIR /root/cloudreve

CMD ./run.sh
